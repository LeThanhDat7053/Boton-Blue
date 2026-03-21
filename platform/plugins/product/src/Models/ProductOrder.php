<?php

namespace Botble\Product\Models;

use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ProductOrder extends BaseModel
{
    protected $table = 'ht_product_orders';

    protected $fillable = [
        'order_number',
        'customer_name',
        'customer_email',
        'customer_phone',
        'customer_note',
        'total_amount',
        'status',
    ];

    public function items(): HasMany
    {
        return $this->hasMany(ProductOrderItem::class, 'order_id');
    }
}
