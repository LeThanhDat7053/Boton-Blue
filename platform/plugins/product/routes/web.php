<?php

use Botble\Base\Facades\BaseHelper;
use Botble\Product\Models\Product;
use Botble\Slug\Facades\SlugHelper;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'Botble\Product\Http\Controllers', 'middleware' => ['web', 'core']], function (): void {
    Route::group(['prefix' => BaseHelper::getAdminPrefix() . '/product', 'middleware' => 'auth'], function (): void {
        Route::group(['prefix' => 'products', 'as' => 'product.'], function (): void {
            Route::resource('', 'ProductController')->parameters(['' => 'product']);
        });

        Route::group(['prefix' => 'product-categories', 'as' => 'product-category.'], function (): void {
            Route::resource('', 'ProductCategoryController')->parameters(['' => 'product-category']);
        });

        Route::group(['prefix' => 'product-orders', 'as' => 'product-order.'], function (): void {
            Route::resource('', 'ProductOrderController')->parameters(['' => 'order'])->except(['create', 'store']);
        });
    });

    if (defined('THEME_MODULE_SCREEN_NAME')) {
        Theme::registerRoutes(function (): void {
            Route::get(SlugHelper::getPrefix(Product::class, 'products'), 'PublicProductController@getProducts')
                ->name('public.products');

            Route::get(SlugHelper::getPrefix(Product::class, 'products') . '/{slug}', 'PublicProductController@getProduct');

            Route::post('products/order', 'PublicProductController@postOrder')
                ->name('public.product.order');
        });
    }
});
