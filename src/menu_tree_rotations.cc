#include "prelude.h"

struct MenuTreeNodeView
{
    u8 status[4];
    MenuTreeNodeView * parent;
    MenuTreeNodeView * left;
    MenuTreeNodeView * right;
};

EC void RotateMenuTreeLeft(MenuTreeNodeView * node, MenuTreeNodeView ** root)
{
    MenuTreeNodeView * pivot = node->right;
    node->right = pivot->left;
    if (pivot->left != 0)
        pivot->left->parent = node;
    pivot->parent = node->parent;
    if (node == *root)
        *root = pivot;
    else if (node == node->parent->left)
        node->parent->left = pivot;
    else
        node->parent->right = pivot;
    pivot->left = node;
    node->parent = pivot;
}

EC void RotateMenuTreeRight(MenuTreeNodeView * node, MenuTreeNodeView ** root)
{
    MenuTreeNodeView * pivot = node->left;
    node->left = pivot->right;
    if (pivot->right != 0)
        pivot->right->parent = node;
    pivot->parent = node->parent;
    if (node == *root)
        *root = pivot;
    else if (node == node->parent->right)
        node->parent->right = pivot;
    else
        node->parent->left = pivot;
    pivot->right = node;
    node->parent = pivot;
}
