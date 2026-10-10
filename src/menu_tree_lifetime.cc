#include "prelude.h"
#include <stdlib.h>

struct MenuTreeNodeView {
    u8 status[4];
    MenuTreeNodeView * parent;
    MenuTreeNodeView * left;
    MenuTreeNodeView * right;
};

EC void ReleaseMenuTreeSubtreeA(void * owner, MenuTreeNodeView * node)
    SECTION(".text.menu_tree_release_a_e2b5c");

void ReleaseMenuTreeSubtreeA(void * owner, MenuTreeNodeView * node)
{
    while (node != 0) {
        ReleaseMenuTreeSubtreeA(owner, node->right);
        MenuTreeNodeView * left = node->left;
        if (node != 0)
            free(node);
        node = left;
    }
}

EC void ReleaseMenuTreeSubtreeB(void * owner, MenuTreeNodeView * node)
    SECTION(".text.menu_tree_release_b_e2b88");

void ReleaseMenuTreeSubtreeB(void * owner, MenuTreeNodeView * node)
{
    while (node != 0) {
        ReleaseMenuTreeSubtreeB(owner, node->right);
        MenuTreeNodeView * left = node->left;
        if (node != 0)
            free(node);
        node = left;
    }
}

EC void ReleaseMenuTreeSubtreeC(void * owner, MenuTreeNodeView * node)
    SECTION(".text.menu_tree_release_c_e2e78");

void ReleaseMenuTreeSubtreeC(void * owner, MenuTreeNodeView * node)
{
    while (node != 0) {
        ReleaseMenuTreeSubtreeC(owner, node->right);
        MenuTreeNodeView * left = node->left;
        if (node != 0)
            free(node);
        node = left;
    }
}

EC void ReleaseTreeSubtreeDC57C(void * owner, MenuTreeNodeView * node)
    SECTION(".text.menu_tree_release_dc57c");

void ReleaseTreeSubtreeDC57C(void * owner, MenuTreeNodeView * node)
{
    while (node != 0) {
        ReleaseTreeSubtreeDC57C(owner, node->right);
        MenuTreeNodeView * left = node->left;
        if (node != 0)
            free(node);
        node = left;
    }
}

EC void ReleaseTreeSubtreeE54C4(void * owner, MenuTreeNodeView * node)
    SECTION(".text.menu_tree_release_e54c4");

void ReleaseTreeSubtreeE54C4(void * owner, MenuTreeNodeView * node)
{
    while (node != 0) {
        ReleaseTreeSubtreeE54C4(owner, node->right);
        MenuTreeNodeView * left = node->left;
        if (node != 0)
            free(node);
        node = left;
    }
}
