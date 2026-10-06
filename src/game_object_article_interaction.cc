#include "actor.hh"
#include "field.hh"

struct FieldPlotLookupResult
{
    FieldPlotLookupResult()
        : plot(0), x(0), y(0), plot_x(0), plot_y(0)
    {
    }

    FieldPlot * plot;
    u16 x;
    u16 y;
    u16 plot_x;
    u16 plot_y;
};

extern "C" bool func_0801C0F8(
    GameObject * game_object,
    Location const & location,
    FieldPlotLookupResult * result);

extern "C" void func_080AA6D0(
    void * context,
    int x,
    int y,
    FieldPlot * plot,
    Unk_Something const * info);

inline bool IsValidFieldPlotCoordinate(int x, int y)
{
    bool valid = false;

    if (x >= 0 && y >= 0 && x <= 42 && y <= 24)
        valid = true;

    return valid;
}

extern "C" void func_0801D7B0(
    GameObject * game_object,
    Location const & location,
    Article const & article);

void func_0801D7B0(
    GameObject * game_object,
    Location const & location,
    Article const & article)
{
    FieldPlotLookupResult result;

    if (!func_0801C0F8(game_object, location, &result))
        return;

    result.plot->method_0800A6F4(article);

    if (game_object->vfunc_14() != location.GetMap())
        return;

    void * context = *reinterpret_cast<void **>(reinterpret_cast<u8 *>(game_object) + 4);

    FieldPlotLookupResult const * result_x = &result;
    FieldPlotLookupResult const * result_y = result_x;

    u8 * state = *reinterpret_cast<u8 **>(reinterpret_cast<u8 *>(game_object) + 0x1038);
    FieldPlot * plots = reinterpret_cast<FieldPlot *>(state + 0x9DC);

    int plot_x = result_x->plot_x;
    int plot_y = result_y->plot_y;

    FieldPlot * plot = &plots[plot_x + plot_y * 43];
    int next_y = plot_y + 1;
    FieldPlot * below = IsValidFieldPlotCoordinate(plot_x, next_y)
        ? &plots[plot_x + next_y * 43]
        : 0;

    int previous_y = plot_y - 1;
    FieldPlot * above = IsValidFieldPlotCoordinate(plot_x, previous_y)
        ? &plots[plot_x + previous_y * 43]
        : 0;

    Unk_Something const * info = plot->method_0800AF5C(below, above);
    func_080AA6D0(context, result.x, result.y, result.plot, info);
}

extern "C" i32 func_0801D88C(
    GameObject * game_object,
    Location const & location,
    Article const & article);

i32 func_0801D88C(
    GameObject * game_object,
    Location const & location,
    Article const & article)
{
    FieldPlotLookupResult result;

    if (func_0801C0F8(game_object, location, &result))
    {
        if (result.plot->method_0800A6C8(article))
            return 0;

        return 1;
    }

    return 2;
}
