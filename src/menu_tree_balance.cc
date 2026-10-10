#include "prelude.h"

struct MenuTreeNodeView {
    u8 color;
    u8 reserved[3];
    MenuTreeNodeView * parent;
    MenuTreeNodeView * left;
    MenuTreeNodeView * right;
};

extern void RotateMenuTreeLeft(MenuTreeNodeView *, MenuTreeNodeView **) asm("func_080E2170");
extern void RotateMenuTreeRight(MenuTreeNodeView *, MenuTreeNodeView **) asm("func_080E21A8");

EC void BalanceMenuTreeAfterInsert(MenuTreeNodeView * node, MenuTreeNodeView ** root)
    SECTION(".text.menu_tree_insert_balance_e21e0");

void BalanceMenuTreeAfterInsert(MenuTreeNodeView * node, MenuTreeNodeView ** root)
{
    node->color = 0;
    while (node != *root && node->parent->color == 0) {
        if (node->parent == node->parent->parent->left) {
            MenuTreeNodeView * uncle = node->parent->parent->right;
            if (uncle && uncle->color == 0) {
                node->parent->color = 1;
                uncle->color = 1;
                node->parent->parent->color = 0;
                node = node->parent->parent;
            } else {
                if (node == node->parent->right) {
                    node = node->parent;
                    RotateMenuTreeLeft(node, root);
                }
                node->parent->color = 1;
                node->parent->parent->color = 0;
                RotateMenuTreeRight(node->parent->parent, root);
            }
        } else {
            MenuTreeNodeView * uncle = node->parent->parent->left;
            if (uncle && uncle->color == 0) {
                node->parent->color = 1;
                uncle->color = 1;
                node->parent->parent->color = 0;
                node = node->parent->parent;
            } else {
                if (node == node->parent->left) {
                    node = node->parent;
                    RotateMenuTreeRight(node, root);
                }
                node->parent->color = 1;
                node->parent->parent->color = 0;
                RotateMenuTreeLeft(node->parent->parent, root);
            }
        }
    }
    (*root)->color = 1;
}

EC MenuTreeNodeView * PreviousMenuTreeNode(MenuTreeNodeView * node)
    SECTION(".text.menu_tree_prev_e2354");

MenuTreeNodeView * PreviousMenuTreeNode(MenuTreeNodeView * node)
{
    if (node->color == 0 && node->parent->parent == node)
        node = node->right;
    else if (node->left != 0) {
        MenuTreeNodeView * prev = node->left;
        while (prev->right != 0)
            prev = prev->right;
        node = prev;
    } else {
        MenuTreeNodeView * parent = node->parent;
        while (node == parent->left) {
            node = parent;
            parent = parent->parent;
        }
        node = parent;
    }
    return node;
}
