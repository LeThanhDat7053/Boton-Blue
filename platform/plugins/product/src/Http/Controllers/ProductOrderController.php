<?php

namespace Botble\Product\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Product\Models\ProductOrder;
use Botble\Product\Tables\ProductOrderTable;

class ProductOrderController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans('plugins/product::product.name'));
    }

    public function index(ProductOrderTable $table)
    {
        $this->pageTitle(trans('plugins/product::product.orders'));

        return $table->renderTable();
    }

    public function edit(ProductOrder $order)
    {
        $order->load('items.product');

        $this->pageTitle(trans('plugins/product::product.order_detail', ['number' => $order->order_number]));

        return view('plugins/product::orders.edit', compact('order'));
    }

    public function update(ProductOrder $order)
    {
        $order->update([
            'status' => request()->input('status', $order->status),
        ]);

        return $this
            ->httpResponse()
            ->setPreviousRoute('product-order.index')
            ->withUpdatedSuccessMessage();
    }

    public function destroy(ProductOrder $order)
    {
        return DeleteResourceAction::make($order);
    }
}
