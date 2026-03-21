<?php

return [
    [
        'name' => 'Products',
        'flag' => 'product.index',
    ],
    [
        'name' => 'Create',
        'flag' => 'product.create',
        'parent_flag' => 'product.index',
    ],
    [
        'name' => 'Edit',
        'flag' => 'product.edit',
        'parent_flag' => 'product.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'product.destroy',
        'parent_flag' => 'product.index',
    ],
    [
        'name' => 'Product Categories',
        'flag' => 'product-category.index',
    ],
    [
        'name' => 'Create',
        'flag' => 'product-category.create',
        'parent_flag' => 'product-category.index',
    ],
    [
        'name' => 'Edit',
        'flag' => 'product-category.edit',
        'parent_flag' => 'product-category.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'product-category.destroy',
        'parent_flag' => 'product-category.index',
    ],
    [
        'name' => 'Product Orders',
        'flag' => 'product-order.index',
    ],
    [
        'name' => 'Edit',
        'flag' => 'product-order.edit',
        'parent_flag' => 'product-order.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'product-order.destroy',
        'parent_flag' => 'product-order.index',
    ],
];
