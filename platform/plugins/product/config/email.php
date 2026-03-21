<?php

return [
    'name' => 'plugins/product::product.settings.email.title',
    'description' => 'plugins/product::product.settings.email.description',
    'templates' => [
        'order-notice-to-admin' => [
            'title' => 'New product order notification to admin',
            'description' => 'Send email to admin/sales when a new product order is placed',
            'subject' => 'New order #{{ order_number }}',
            'can_off' => false,
            'variables' => [
                'order_number' => 'Order number',
                'customer_name' => 'Customer name',
                'customer_email' => 'Customer email',
                'customer_phone' => 'Customer phone',
                'product_name' => 'Product name',
                'quantity' => 'Quantity',
                'total_amount' => 'Total amount',
                'customer_note' => 'Customer note',
                'order_date' => 'Order date',
            ],
        ],
    ],
];
