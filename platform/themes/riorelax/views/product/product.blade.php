@php
    Theme::set('pageTitle', $product->name);
@endphp

<section class="pt-60 pb-60">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-6">
                <div class="product-detail-image mb-30">
                    <img src="{{ RvMedia::getImageUrl($product->image) }}" alt="{{ $product->name }}" class="w-100 rounded" style="max-height: 500px; object-fit: cover;">
                </div>
                @if ($product->images && count($product->images) > 0)
                    <div class="row g-2 mb-30">
                        @foreach ($product->images as $img)
                            <div class="col-3">
                                <img src="{{ RvMedia::getImageUrl($img, 'thumb') }}" alt="{{ $product->name }}" class="w-100 rounded" style="height: 100px; object-fit: cover; cursor: pointer;">
                            </div>
                        @endforeach
                    </div>
                @endif
            </div>

            <div class="col-lg-5 col-md-6">
                <div class="product-detail-info">
                    <h2>{{ $product->name }}</h2>
                    @if ($product->category)
                        <span class="badge bg-secondary mb-3">{{ $product->category->name }}</span>
                    @endif

                    <div class="product-price mb-3">
                        <strong class="text-primary" style="font-size: 1.5em;">{{ number_format($product->price, 0, ',', '.') }} VND</strong>
                        @if ($product->original_price && $product->original_price > $product->price)
                            <del class="text-muted ms-2" style="font-size: 1.1em;">{{ number_format($product->original_price, 0, ',', '.') }} VND</del>
                        @endif
                    </div>

                    @if ($product->total_sold > 0)
                        <p class="text-muted mb-3"><i class="fal fa-check-circle"></i> {{ __('Sold') }}: {{ number_format($product->total_sold) }}</p>
                    @endif

                    @if ($product->description)
                        <div class="mb-4">
                            <p>{{ $product->description }}</p>
                        </div>
                    @endif

                    <div class="order-form-wrapper shadow-block p-4 rounded">
                        <h4 class="mb-3">{{ __('Order Now') }}</h4>
                        <form action="{{ route('public.product.order') }}" method="POST">
                            @csrf
                            <input type="hidden" name="product_id" value="{{ $product->id }}">

                            <div class="mb-3">
                                <label class="form-label">{{ __('Full Name') }} <span class="text-danger">*</span></label>
                                <input type="text" name="customer_name" class="form-control" required value="{{ old('customer_name') }}" maxlength="120">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">{{ __('Email') }} <span class="text-danger">*</span></label>
                                <input type="email" name="customer_email" class="form-control" required value="{{ old('customer_email') }}" maxlength="120">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">{{ __('Phone') }} <span class="text-danger">*</span></label>
                                <input type="tel" name="customer_phone" class="form-control" required value="{{ old('customer_phone') }}">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">{{ __('Quantity') }}</label>
                                <input type="number" name="quantity" class="form-control" value="1" min="1" max="100">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">{{ __('Note') }}</label>
                                <textarea name="customer_note" class="form-control" rows="3" maxlength="1000">{{ old('customer_note') }}</textarea>
                            </div>

                            <button type="submit" class="btn ss-btn w-100">
                                <i class="fal fa-shopping-cart"></i> {{ __('Place Order') }}
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        @if ($product->content)
            <div class="row mt-50">
                <div class="col-12">
                    <div class="ck-content">
                        {!! $product->content !!}
                    </div>
                </div>
            </div>
        @endif

        @if ($relatedProducts->isNotEmpty())
            <div class="row mt-50">
                <div class="col-12">
                    <h3 class="mb-30">{{ __('Related Products') }}</h3>
                </div>
                @foreach ($relatedProducts as $relatedProduct)
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-30">
                        @include(Theme::getThemeNamespace('views.product.partials.product-card'), ['product' => $relatedProduct])
                    </div>
                @endforeach
            </div>
        @endif
    </div>
</section>
