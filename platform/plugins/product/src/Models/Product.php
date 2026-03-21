<?php

namespace Botble\Product\Models;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Product extends BaseModel
{
    protected $table = 'ht_products';

    protected $fillable = [
        'name',
        'description',
        'content',
        'image',
        'images',
        'price',
        'original_price',
        'category_id',
        'total_sold',
        'is_featured',
        'order',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'price' => 'float',
        'original_price' => 'float',
        'total_sold' => 'integer',
    ];

    public function getImagesAttribute($value)
    {
        if ($value === '[null]') {
            return [];
        }

        $images = json_decode((string) $value, true);

        if (is_array($images)) {
            $images = array_filter($images);
        }

        return $images ?: [];
    }

    public function setImagesAttribute($value): void
    {
        if (is_array($value)) {
            $value = array_values(array_filter($value));
            $this->attributes['images'] = json_encode($value);
        } else {
            $this->attributes['images'] = $value;
        }
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(ProductCategory::class, 'category_id')->withDefault();
    }
}
