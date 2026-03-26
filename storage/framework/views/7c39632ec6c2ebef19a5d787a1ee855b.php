<?php
    Theme::set('pageTitle', trans('plugins/product::product.name'));
?>

<style>
    /* Product card image */
    .product-card-img {
        height: 250px;
        object-fit: cover;
    }

    /* Category name always reserves space */
    .product-category-name {
        display: block;
        min-height: 1.2em;
    }

    /* Category horizontal scroll (desktop) */
    .category-products-scroll {
        display: flex;
        overflow-x: auto;
        gap: 16px;
        padding-bottom: 10px;
        scroll-behavior: smooth;
        -webkit-overflow-scrolling: touch;
    }
    .category-products-scroll::-webkit-scrollbar {
        height: 6px;
    }
    .category-products-scroll::-webkit-scrollbar-thumb {
        background: #ccc;
        border-radius: 3px;
    }
    .category-products-scroll .product-scroll-item {
        min-width: 240px;
        max-width: 240px;
        flex-shrink: 0;
    }

    /* Category section */
    .category-section {
        margin-bottom: 40px;
    }
    .category-section .category-title {
        font-size: 1.3em;
        font-weight: 700;
        margin-bottom: 16px;
        padding-bottom: 8px;
        border-bottom: 2px solid #f0f0f0;
        text-transform: uppercase;
    }

    /* Sort filters */
    .sort-filters {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        margin-bottom: 24px;
    }
    .sort-filters .filter-btn {
        padding: 6px 16px;
        border: 1px solid #ddd;
        border-radius: 20px;
        background: #fff;
        cursor: pointer;
        font-size: 0.9em;
        transition: all 0.2s;
        text-decoration: none;
        color: #333;
    }
    .sort-filters .filter-btn:hover {
        border-color: #ff6600;
        color: #ff6600;
    }
    .sort-filters .filter-btn.active {
        background: #ff6600;
        color: #fff;
        border-color: #ff6600;
    }

    /* All products grid */
    .all-products-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
        gap: 20px;
    }

    /* ===== MOBILE (max-width: 767px) ===== */
    @media (max-width: 767px) {
        section.pt-60 {
            padding-top: 30px !important;
            padding-bottom: 30px !important;
        }
        .category-section {
            margin-bottom: 24px;
        }
        .category-section .category-title {
            font-size: 1.1em;
            margin-bottom: 12px;
            padding-bottom: 6px;
        }
        /* Mobile: category products as 2-column grid instead of horizontal scroll */
        .category-products-scroll {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            overflow-x: visible;
            padding-bottom: 0;
        }
        .category-products-scroll .product-scroll-item {
            min-width: unset;
            max-width: unset;
        }
        .product-card-img {
            height: 160px;
        }
        .product-card-body.p-3 {
            padding: 10px !important;
        }
        .product-card-body h5 {
            font-size: 0.85em;
            min-height: 2.4em;
        }
        .product-card-body .product-price strong {
            font-size: 1em !important;
        }
        .product-card-body .product-price del,
        .product-card-body .product-price .price-original-placeholder {
            font-size: 0.8em;
            display: block;
            margin-left: 0 !important;
            min-height: 1.2em;
        }
        .sort-filters {
            gap: 6px;
            margin-bottom: 16px;
        }
        .sort-filters .filter-btn {
            padding: 5px 12px;
            font-size: 0.8em;
        }
        .all-products-grid {
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
        }
    }

    /* ===== SMALL MOBILE (max-width: 374px) ===== */
    @media (max-width: 374px) {
        .product-card-img {
            height: 130px;
        }
        .all-products-grid {
            grid-template-columns: repeat(2, 1fr);
            gap: 8px;
        }
    }
</style>

<section class="pt-60 pb-60">
    <div class="container">

        
        <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <?php if($category->products->isNotEmpty()): ?>
                <div class="category-section">
                    <h3 class="category-title"><?php echo e($category->name); ?></h3>
                    <div class="category-products-scroll">
                        <?php $__currentLoopData = $category->products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="product-scroll-item">
                                <?php echo $__env->make(Theme::getThemeNamespace('views.product.partials.product-card'), ['product' => $product], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                            </div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                </div>
            <?php endif; ?>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

        
        <?php if($allProducts->isNotEmpty()): ?>
            <div class="category-section">
                <h3 class="category-title"><?php echo e(__('Sắp xếp theo')); ?></h3>
                <div class="sort-filters">
                    <button type="button" class="filter-btn active" data-sort="newest"><?php echo e(__('Mới nhất')); ?></button>
                    <button type="button" class="filter-btn" data-sort="best_selling"><?php echo e(__('Bán chạy')); ?></button>
                    <button type="button" class="filter-btn" data-sort="on_sale"><?php echo e(__('Đang giảm giá')); ?></button>
                    <button type="button" class="filter-btn" data-sort="price_asc"><?php echo e(__('Giá tăng dần')); ?></button>
                    <button type="button" class="filter-btn" data-sort="price_desc"><?php echo e(__('Giá giảm dần')); ?></button>
                </div>
                <div class="all-products-grid" id="sortable-products">
                    <?php $__currentLoopData = $allProducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="sortable-item"
                             data-price="<?php echo e($product->price); ?>"
                             data-original-price="<?php echo e($product->original_price ?? 0); ?>"
                             data-sold="<?php echo e($product->total_sold); ?>"
                             data-created="<?php echo e($product->created_at->timestamp); ?>">
                            <?php echo $__env->make(Theme::getThemeNamespace('views.product.partials.product-card'), ['product' => $product], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        <?php endif; ?>

    </div>
</section>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var grid = document.getElementById('sortable-products');
    if (!grid) return;

    var buttons = document.querySelectorAll('.sort-filters .filter-btn');

    buttons.forEach(function(btn) {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            buttons.forEach(function(b) { b.classList.remove('active'); });
            btn.classList.add('active');

            var sortType = btn.getAttribute('data-sort');
            var items = Array.from(grid.querySelectorAll('.sortable-item'));

            // Show all items first
            items.forEach(function(item) { item.style.display = ''; });

            // For on_sale: hide non-discounted items
            if (sortType === 'on_sale') {
                items.forEach(function(item) {
                    var orig = parseFloat(item.dataset.originalPrice);
                    var price = parseFloat(item.dataset.price);
                    if (!(orig > 0 && orig > price)) {
                        item.style.display = 'none';
                    }
                });
            }

            items.sort(function(a, b) {
                switch (sortType) {
                    case 'best_selling':
                        return parseFloat(b.dataset.sold) - parseFloat(a.dataset.sold);
                    case 'on_sale':
                        return parseFloat(b.dataset.created) - parseFloat(a.dataset.created);
                    case 'price_asc':
                        return parseFloat(a.dataset.price) - parseFloat(b.dataset.price);
                    case 'price_desc':
                        return parseFloat(b.dataset.price) - parseFloat(a.dataset.price);
                    default: // newest
                        return parseFloat(b.dataset.created) - parseFloat(a.dataset.created);
                }
            });

            items.forEach(function(item) { grid.appendChild(item); });
        });
    });
});
</script>
<?php /**PATH C:\laragon\www\main\platform\themes/riorelax/views/product/products.blade.php ENDPATH**/ ?>