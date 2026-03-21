@php
    Theme::set('pageTitle', trans('plugins/product::product.name'));
@endphp

<section class="pt-60 pb-60">
    <div class="container">
        @if ($categories->isNotEmpty())
            <div class="row mb-30">
                <div class="col-12">
                    <div class="product-categories text-center">
                        <a href="{{ route('public.products') }}" class="btn {{ !request('category_id') ? 'btn-primary' : 'btn-outline-primary' }} btn-sm me-2 mb-2">
                            {{ __('All') }}
                        </a>
                        @foreach ($categories as $category)
                            <a href="{{ route('public.products', ['category_id' => $category->id]) }}"
                               class="btn {{ request('category_id') == $category->id ? 'btn-primary' : 'btn-outline-primary' }} btn-sm me-2 mb-2">
                                {{ $category->name }}
                            </a>
                        @endforeach
                    </div>
                </div>
            </div>
        @endif

        <div class="row">
            @forelse ($products as $product)
                <div class="col-lg-3 col-md-4 col-sm-6 mb-30">
                    @include(Theme::getThemeNamespace('views.product.partials.product-card'), ['product' => $product])
                </div>
            @empty
                <div class="col-12 text-center">
                    <p>{{ __('No products found.') }}</p>
                </div>
            @endforelse
        </div>

        @if ($products->hasPages())
            <div class="row">
                <div class="col-12 text-center">
                    {{ $products->withQueryString()->links() }}
                </div>
            </div>
        @endif
    </div>
</section>
