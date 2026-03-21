<?php

namespace Botble\Product\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Product\Forms\ProductForm;
use Botble\Product\Http\Requests\ProductRequest;
use Botble\Product\Models\Product;
use Botble\Product\Tables\ProductTable;

class ProductController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans('plugins/product::product.name'));
    }

    public function index(ProductTable $table)
    {
        $this->pageTitle(trans('plugins/product::product.name'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/product::product.create'));

        return ProductForm::create()->renderForm();
    }

    public function store(ProductRequest $request)
    {
        $form = ProductForm::create()->setRequest($request);
        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousRoute('product.index')
            ->setNextRoute('product.edit', $form->getModel()->getKey())
            ->withCreatedSuccessMessage();
    }

    public function edit(Product $product)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $product->name]));

        return ProductForm::createFromModel($product)->renderForm();
    }

    public function update(Product $product, ProductRequest $request)
    {
        ProductForm::createFromModel($product)->setRequest($request)->save();

        return $this
            ->httpResponse()
            ->setPreviousRoute('product.index')
            ->withUpdatedSuccessMessage();
    }

    public function destroy(Product $product)
    {
        return DeleteResourceAction::make($product);
    }
}
