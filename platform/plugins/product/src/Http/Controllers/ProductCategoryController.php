<?php

namespace Botble\Product\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Product\Forms\ProductCategoryForm;
use Botble\Product\Http\Requests\ProductCategoryRequest;
use Botble\Product\Models\ProductCategory;
use Botble\Product\Tables\ProductCategoryTable;

class ProductCategoryController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans('plugins/product::product.name'));
    }

    public function index(ProductCategoryTable $table)
    {
        $this->pageTitle(trans('plugins/product::product.categories'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/product::product.create_category'));

        return ProductCategoryForm::create()->renderForm();
    }

    public function store(ProductCategoryRequest $request)
    {
        $form = ProductCategoryForm::create()->setRequest($request);
        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousRoute('product-category.index')
            ->setNextRoute('product-category.edit', $form->getModel()->getKey())
            ->withCreatedSuccessMessage();
    }

    public function edit(ProductCategory $productCategory)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $productCategory->name]));

        return ProductCategoryForm::createFromModel($productCategory)->renderForm();
    }

    public function update(ProductCategory $productCategory, ProductCategoryRequest $request)
    {
        ProductCategoryForm::createFromModel($productCategory)->setRequest($request)->save();

        return $this
            ->httpResponse()
            ->setPreviousRoute('product-category.index')
            ->withUpdatedSuccessMessage();
    }

    public function destroy(ProductCategory $productCategory)
    {
        return DeleteResourceAction::make($productCategory);
    }
}
