#!/usr/bin/perl

use strict;
use warnings;

(@ARGV == 1)
    or die "ERROR: no map file specified.\n";

open(my $file, '<', $ARGV[0])
    or die "ERROR: could not open file '$ARGV[0]'.\n";

my $src = 0;
my $asm = 0;
my $pending_section;
my $in_memory_map = 0;

sub is_code_section
{
    my ($section) = @_;

    return $section eq '.text'
        || $section =~ /^\.text\./
        || $section =~ /^\.gnu\.linkonce\.t\./;
}

sub account_section
{
    my ($section, $size_hex, $object) = @_;

    return unless is_code_section($section);
    return unless $object =~ m{(?:^|/)(src|asm)/[^[:space:]]+\.o(?:\([^)]*\))?};

    my $dir = $1;
    my $size = hex($size_hex);

    if ($dir eq 'src')
    {
        $src += $size;
    }
    elsif ($dir eq 'asm')
    {
        $asm += $size;
    }
}

while (my $line = <$file>)
{
    # GNU ld prints discarded input sections before the real linker map.
    # Ignore those, otherwise discarded .gnu.linkonce.t.* sections can be
    # mistaken for code that actually made it into the ROM.
    if (!$in_memory_map)
    {
        if ($line =~ /^Linker script and memory map\s*$/)
        {
            $in_memory_map = 1;
        }
        next;
    }

    # Normal GNU ld map entry, all fields on one line:
    #  .text 0x08000000 0x20 src/foo.o
    if ($line =~ /^\s*(\.\S+)\s+0x[0-9a-fA-F]+\s+(0x[0-9a-fA-F]+)\s+(\S+)/)
    {
        account_section($1, $2, $3);
        $pending_section = undef;
        next;
    }

    # Long section names (especially .gnu.linkonce.t.*) are commonly
    # wrapped by GNU ld so the section name appears on its own line.
    if ($line =~ /^\s*(\.\S+)\s*$/ && is_code_section($1))
    {
        $pending_section = $1;
        next;
    }

    if (defined $pending_section)
    {
        if ($line =~ /^\s*0x[0-9a-fA-F]+\s+(0x[0-9a-fA-F]+)\s+(\S+)/)
        {
            account_section($pending_section, $1, $2);
            $pending_section = undef;
            next;
        }

        # A wrapped map entry should continue immediately on the next
        # non-empty line. Avoid accidentally carrying a stale section name.
        $pending_section = undef if $line =~ /\S/;
    }
}

my $total = $src + $asm;

if ($total == 0)
{
    die "ERROR: no src/ or asm/ code sections found in map file.\n";
}

my $srcPct = sprintf("%.4f", 100 * $src / $total);
my $asmPct = sprintf("%.4f", 100 * $asm / $total);

print "$total total bytes of code\n";
print "$src bytes of code in src ($srcPct%)\n";
print "$asm bytes of code in asm ($asmPct%)\n";
