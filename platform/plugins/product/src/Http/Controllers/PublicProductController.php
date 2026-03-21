<?php

namespace Botble\Product\Http\Controllers;

use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Product\Http\Requests\OrderRequest;
use Botble\Product\Models\Product;
use Botble\Product\Models\ProductCategory;
use Botble\Product\Models\ProductOrder;
use Botble\Product\Models\ProductOrderItem;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Slug\Facades\SlugHelper;
use Botble\Theme\Facades\Theme;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class PublicProductController extends Controller
{
    public function getProducts(Request $request)
    {
        SeoHelper::setTitle(trans('plugins/product::product.name'));

        Theme::breadcrumb()->add(trans('plugins/product::product.name'), route('public.products'));

        $products = Product::query()
            ->wherePublished()
            ->with(['category'])
            ->when($request->input('category_id'), function ($query, $categoryId) {
                return $query->where('category_id', $categoryId);
            })
            ->oldest('order')
            ->latest()
            ->paginate(12);

        $categories = ProductCategory::query()
            ->wherePublished()
            ->oldest('order')
            ->get();

        return Theme::scope('product.products', compact('products', 'categories'))->render();
    }

    public function getProduct(string $key)
    {
        $slug = SlugHelper::getSlug($key, SlugHelper::getPrefix(Product::class));

        abort_unless($slug, 404);

        $product = Product::query()
            ->with(['category'])
            ->findOrFail($slug->reference_id);

        SeoHelper::setTitle($product->name)
            ->setDescription(Str::words($product->description, 120));

        Theme::breadcrumb()
            ->add(trans('plugins/product::product.name'), route('public.products'))
            ->add($product->name, $product->url);

        $relatedProducts = Product::query()
            ->wherePublished()
            ->where('category_id', $product->category_id)
            ->whereNot('id', $product->id)
            ->limit(4)
            ->get();

        return Theme::scope('product.product', compact('product', 'relatedProducts'))->render();
    }

    public function postOrder(OrderRequest $request, BaseHttpResponse $response)
    {
        $product = Product::query()->findOrFail($request->input('product_id'));

        $quantity = $request->integer('quantity', 1);
        $totalAmount = $product->price * $quantity;

        $order = ProductOrder::query()->create([
            'order_number' => 'PO-' . strtoupper(Str::random(8)),
            'customer_name' => $request->input('customer_name'),
            'customer_email' => $request->input('customer_email'),
            'customer_phone' => $request->input('customer_phone'),
            'customer_note' => $request->input('customer_note'),
            'total_amount' => $totalAmount,
            'status' => 'pending',
        ]);

        ProductOrderItem::query()->create([
            'order_id' => $order->id,
            'product_id' => $product->id,
            'product_name' => $product->name,
            'product_price' => $product->price,
            'quantity' => $quantity,
        ]);

        $product->increment('total_sold', $quantity);

        // Send email notification
        $salesEmail = config('plugins.product.general.sales_email');
        if ($salesEmail) {
            try {
                Mail::send('plugins/product::emails.order-notification', [
                    'order' => $order,
                    'product' => $product,
                    'quantity' => $quantity,
                ], function ($message) use ($salesEmail, $order) {
                    $message->to($salesEmail)
                        ->subject('Đơn hàng mới #' . $order->order_number);
                });
            } catch (\Throwable $e) {
                \Log::error('Failed to send product order email: ' . $e->getMessage());
            }
        }

        return $response
            ->setMessage(trans('plugins/product::product.order_success'))
            ->setNextUrl(route('public.products'));
    }
}
