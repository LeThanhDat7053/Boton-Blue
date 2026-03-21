<?php

namespace Botble\Product\Providers;

use Botble\Base\Facades\DashboardMenu;
use Botble\Base\Facades\EmailHandler;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Botble\Product\Models\Product;
use Botble\Product\Models\ProductCategory;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Slug\Facades\SlugHelper;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\ServiceProvider;

class ProductServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this->setNamespace('plugins/product')
            ->loadAndPublishConfigurations(['permissions', 'email', 'general'])
            ->loadAndPublishTranslations()
            ->loadAndPublishViews()
            ->loadRoutes()
            ->loadHelpers();

        SlugHelper::registering(function (): void {
            SlugHelper::registerModule(Product::class, fn () => trans('plugins/product::product.name'));
            SlugHelper::setPrefix(Product::class, 'products');
        });

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-product',
                    'priority' => 2,
                    'name' => 'plugins/product::product.name',
                    'icon' => 'ti ti-shopping-cart',
                    'route' => 'product.index',
                ])
                ->registerItem([
                    'id' => 'cms-plugins-product-list',
                    'priority' => 0,
                    'parent_id' => 'cms-plugins-product',
                    'name' => 'plugins/product::product.products',
                    'icon' => 'ti ti-package',
                    'route' => 'product.index',
                ])
                ->registerItem([
                    'id' => 'cms-plugins-product-category',
                    'priority' => 1,
                    'parent_id' => 'cms-plugins-product',
                    'name' => 'plugins/product::product.categories',
                    'icon' => 'ti ti-tags',
                    'route' => 'product-category.index',
                ])
                ->registerItem([
                    'id' => 'cms-plugins-product-order',
                    'priority' => 2,
                    'parent_id' => 'cms-plugins-product',
                    'name' => 'plugins/product::product.orders',
                    'icon' => 'ti ti-receipt',
                    'route' => 'product-order.index',
                ]);
        });

        $this->app['events']->listen(RouteMatched::class, function (): void {
            EmailHandler::addTemplateSettings(PRODUCT_MODULE_SCREEN_NAME, config('plugins.product.email'));
        });

        if (defined('LANGUAGE_MODULE_SCREEN_NAME') && defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
            LanguageAdvancedManager::registerModule(Product::class, [
                'name',
                'description',
                'content',
            ]);

            LanguageAdvancedManager::registerModule(ProductCategory::class, [
                'name',
                'description',
            ]);
        }

        $this->app->booted(function (): void {
            SeoHelper::registerModule([
                Product::class,
            ]);
        });
    }
}
