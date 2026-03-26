<div class="product-card shadow-block h-100">
    <div class="product-card-image position-relative hover-zoomin">
        <a href="{{ $product->url }}">
            <img src="{{ $product->image ? RvMedia::getImageUrl($product->image, 'medium') : Theme::asset()->url('images/placeholder.svg') }}"
                 alt="{{ $product->name }}"
                 class="w-100 product-card-img"
                 onerror="this.onerror=null;this.src='{{ Theme::asset()->url('images/placeholder.svg') }}';">
        </a>
        @if ($product->original_price && $product->original_price > $product->price)
            <span class="badge bg-danger position-absolute" style="top: 10px; right: 10px;">
                -{{ round(100 - ($product->price / $product->original_price * 100)) }}%
            </span>
        @endif
    </div>
    <div class="product-card-body p-3">
        <h5 class="mb-2" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis; min-height: 2.8em; line-height: 1.4em;">
            <a href="{{ $product->url }}">{{ $product->name }}</a>
        </h5>
        @if ($product->category)
            <small class="text-muted product-category-name">{{ $product->category->name }}</small>
        @else
            <small class="text-muted product-category-name">&nbsp;</small>
        @endif
        <div class="product-price mt-2">
            <strong class="text-primary" style="font-size: 1.2em;">{{ number_format($product->price, 0, ',', '.') }} VND</strong>
            @if ($product->original_price && $product->original_price > $product->price)
                <del class="text-muted ms-2">{{ number_format($product->original_price, 0, ',', '.') }} VND</del>
            @else
                <span class="price-original-placeholder ms-2">&nbsp;</span>
            @endif
        </div>
        <small class="text-muted">{{ __('Đã bán') }}: {{ number_format($product->total_sold) }}</small>
        <div class="mt-3">
            <a href="{{ $product->url }}" class="btn ss-btn btn-sm w-100">{{ __('Order Now') }}</a>
        </div>
    </div>
</div>
