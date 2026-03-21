<?php

namespace Botble\Product\Forms;

use Botble\Base\Forms\FieldOptions\ContentFieldOption;
use Botble\Base\Forms\FieldOptions\DescriptionFieldOption;
use Botble\Base\Forms\FieldOptions\MediaImageFieldOption;
use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\OnOffFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\Fields\EditorField;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\OnOffField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\Product\Http\Requests\ProductRequest;
use Botble\Product\Models\Product;
use Botble\Product\Models\ProductCategory;

class ProductForm extends FormAbstract
{
    public function setup(): void
    {
        $categories = ProductCategory::query()->pluck('name', 'id')->all();

        $this
            ->setupModel(new Product())
            ->setValidatorClass(ProductRequest::class)
            ->withCustomFields()
            ->add('name', TextField::class, NameFieldOption::make()->required()->toArray())
            ->add('description', TextareaField::class, DescriptionFieldOption::make()->toArray())
            ->add('content', EditorField::class, ContentFieldOption::make()->allowedShortcodes()->toArray())
            ->add(
                'is_featured',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('core/base::forms.is_featured'))
                    ->defaultValue(false)
                    ->toArray()
            )
            ->add('price', 'text', [
                'label' => trans('plugins/product::product.price'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('plugins/product::product.price'),
                    'class' => 'form-control',
                ],
            ])
            ->add('original_price', 'text', [
                'label' => trans('plugins/product::product.original_price'),
                'attr' => [
                    'placeholder' => trans('plugins/product::product.original_price'),
                    'class' => 'form-control',
                ],
            ])
            ->add('image', MediaImageField::class, MediaImageFieldOption::make()->toArray())
            ->add('images[]', 'mediaImages', [
                'label' => trans('plugins/product::product.images'),
                'values' => $this->getModel()->id ? $this->getModel()->images : [],
            ])
            ->add('order', 'number', [
                'label' => trans('core/base::forms.order'),
                'attr' => [
                    'placeholder' => trans('core/base::forms.order_by_placeholder'),
                ],
                'default_value' => 0,
            ])
            ->add('status', SelectField::class, StatusFieldOption::make()->toArray())
            ->add('category_id', 'customSelect', [
                'label' => trans('plugins/product::product.category'),
                'attr' => [
                    'class' => 'form-control select-full',
                ],
                'choices' => ['' => '-- Select --'] + $categories,
            ])
            ->setBreakFieldPoint('status');
    }
}
