<?php

namespace Botble\Product\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class ProductCategoryRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'description' => ['nullable', 'string', 'max:400'],
            'order' => ['nullable', 'numeric'],
            'status' => Rule::in(BaseStatusEnum::values()),
        ];
    }
}
