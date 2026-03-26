<div class="product-card shadow-block h-100">
    <div class="product-card-image position-relative hover-zoomin">
        <a href="<?php echo e($product->url); ?>">
            <img src="<?php echo e($product->image ? RvMedia::getImageUrl($product->image, 'medium') : Theme::asset()->url('images/placeholder.svg')); ?>"
                 alt="<?php echo e($product->name); ?>"
                 class="w-100 product-card-img"
                 onerror="this.onerror=null;this.src='<?php echo e(Theme::asset()->url('images/placeholder.svg')); ?>';">
        </a>
        <?php if($product->original_price && $product->original_price > $product->price): ?>
            <span class="badge bg-danger position-absolute" style="top: 10px; right: 10px;">
                -<?php echo e(round(100 - ($product->price / $product->original_price * 100))); ?>%
            </span>
        <?php endif; ?>
    </div>
    <div class="product-card-body p-3">
        <h5 class="mb-2" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis; min-height: 2.8em; line-height: 1.4em;">
            <a href="<?php echo e($product->url); ?>"><?php echo e($product->name); ?></a>
        </h5>
        <?php if($product->category): ?>
            <small class="text-muted product-category-name"><?php echo e($product->category->name); ?></small>
        <?php else: ?>
            <small class="text-muted product-category-name">&nbsp;</small>
        <?php endif; ?>
        <div class="product-price mt-2">
            <strong class="text-primary" style="font-size: 1.2em;"><?php echo e(number_format($product->price, 0, ',', '.')); ?> VND</strong>
            <?php if($product->original_price && $product->original_price > $product->price): ?>
                <del class="text-muted ms-2"><?php echo e(number_format($product->original_price, 0, ',', '.')); ?> VND</del>
            <?php else: ?>
                <span class="price-original-placeholder ms-2">&nbsp;</span>
            <?php endif; ?>
        </div>
        <small class="text-muted"><?php echo e(__('Đã bán')); ?>: <?php echo e(number_format($product->total_sold)); ?></small>
        <div class="mt-3">
            <a href="<?php echo e($product->url); ?>" class="btn ss-btn btn-sm w-100"><?php echo e(__('Order Now')); ?></a>
        </div>
    </div>
</div>
<?php /**PATH C:\laragon\www\main\platform\themes/riorelax/views/product/partials/product-card.blade.php ENDPATH**/ ?>