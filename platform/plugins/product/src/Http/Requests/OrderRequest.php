<?php

namespace Botble\Product\Http\Requests;

use Botble\Support\Http\Requests\Request;

class OrderRequest extends Request
{
    public function rules(): array
    {
        return [
            'product_id' => ['required', 'exists:ht_products,id'],
            'customer_name' => ['required', 'string', 'max:120'],
            'customer_email' => ['required', 'email', 'max:120'],
            'customer_phone' => ['required', 'string', 'max:20'],
            'quantity' => ['required', 'integer', 'min:1', 'max:100'],
            'customer_note' => ['nullable', 'string', 'max:1000'],
        ];
    }
}
