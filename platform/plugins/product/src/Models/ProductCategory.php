<?php

namespace Botble\Product\Models;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;

class ProductCategory extends BaseModel
{
    protected $table = 'ht_product_categories';

    protected $fillable = [
        'name',
        'description',
        'order',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
    ];

    public function products()
    {
        return $this->hasMany(Product::class, 'category_id');
    }
}
