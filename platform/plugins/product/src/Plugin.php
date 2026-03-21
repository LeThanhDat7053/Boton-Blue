<?php

namespace Botble\Product;

use Botble\PluginManagement\Abstracts\PluginOperationAbstract;
use Illuminate\Support\Facades\Schema;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('ht_product_order_items');
        Schema::dropIfExists('ht_product_orders');
        Schema::dropIfExists('ht_products_translations');
        Schema::dropIfExists('ht_products');
        Schema::dropIfExists('ht_product_categories_translations');
        Schema::dropIfExists('ht_product_categories');
        Schema::enableForeignKeyConstraints();
    }
}
