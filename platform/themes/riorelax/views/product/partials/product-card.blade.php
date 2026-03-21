<div class="product-card shadow-block h-100">
    <div class="product-card-image position-relative hover-zoomin">
        <a href="{{ $product->url }}">
            <img src="{{ RvMedia::getImageUrl($product->image, 'medium') }}" alt="{{ $product->name }}" class="w-100" style="height: 250px; object-fit: cover;">
        </a>
        @if ($product->original_price && $product->original_price > $product->price)
            <span class="badge bg-danger position-absolute" style="top: 10px; right: 10px;">
                -{{ round(100 - ($product->price / $product->original_price * 100)) }}%
            </span>
        @endif
    </div>
    <div class="product-card-body p-3">
        <h5 class="mb-2"><a href="{{ $product->url }}">{{ $product->name }}</a></h5>
        @if ($product->category)
            <small class="text-muted">{{ $product->category->name }}</small>
        @endif
        <div class="product-price mt-2">
            <strong class="text-primary" style="font-size: 1.2em;">{{ number_format($product->price, 0, ',', '.') }} VND</strong>
            @if ($product->original_price && $product->original_price > $product->price)
                <del class="text-muted ms-2">{{ number_format($product->original_price, 0, ',', '.') }} VND</del>
            @endif
        </div>
        @if ($product->total_sold > 0)
            <small class="text-muted">{{ __('Sold') }}: {{ number_format($product->total_sold) }}</small>
        @endif
        <div class="mt-3">
            <a href="{{ $product->url }}" class="btn ss-btn btn-sm w-100">{{ __('Order Now') }}</a>
        </div>
    </div>
</div>
