<?php
    Theme::set('pageTitle', $product->name);
?>

<section class="pt-60 pb-60">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-6">
                <div class="product-detail-image mb-30">
                    <img id="main-product-image" src="<?php echo e(RvMedia::getImageUrl($product->image)); ?>" alt="<?php echo e($product->name); ?>" class="w-100 rounded" style="object-fit: cover;">
                </div>
                <?php if($product->images && count($product->images) > 0): ?>
                    <div class="row g-2 mt-3 mb-30">
                        <div class="col-3">
                            <img src="<?php echo e(RvMedia::getImageUrl($product->image, 'thumb')); ?>"
                                 data-full="<?php echo e(RvMedia::getImageUrl($product->image)); ?>"
                                 alt="<?php echo e($product->name); ?>"
                                 class="w-100 rounded product-thumb"
                                 style="height: 120px; object-fit: cover; cursor: pointer; border: 2px solid #ff6600; transition: border-color 0.2s;"
                                 onclick="document.getElementById('main-product-image').src=this.dataset.full; document.querySelectorAll('.product-thumb').forEach(function(t){t.style.borderColor='transparent'}); this.style.borderColor='#ff6600';">
                        </div>
                        <?php $__currentLoopData = $product->images; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $img): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="col-3">
                                <img src="<?php echo e(RvMedia::getImageUrl($img, 'thumb')); ?>"
                                     data-full="<?php echo e(RvMedia::getImageUrl($img)); ?>"
                                     alt="<?php echo e($product->name); ?>"
                                     class="w-100 rounded product-thumb"
                                     style="height: 120px; object-fit: cover; cursor: pointer; border: 2px solid transparent; transition: border-color 0.2s;"
                                     onclick="document.getElementById('main-product-image').src=this.dataset.full; document.querySelectorAll('.product-thumb').forEach(function(t){t.style.borderColor='transparent'}); this.style.borderColor='#ff6600';">
                            </div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                <?php endif; ?>
            </div>

            <div class="col-lg-5 col-md-6">
                <div class="product-detail-info">
                    <h2><?php echo e($product->name); ?></h2>
                    <?php if($product->category): ?>
                        <span class="badge bg-secondary mb-3"><?php echo e($product->category->name); ?></span>
                    <?php endif; ?>

                    <div class="product-price mb-3">
                        <strong class="text-primary" style="font-size: 1.5em;"><?php echo e(number_format($product->price, 0, ',', '.')); ?> VND</strong>
                        <?php if($product->original_price && $product->original_price > $product->price): ?>
                            <del class="text-muted ms-2" style="font-size: 1.1em;"><?php echo e(number_format($product->original_price, 0, ',', '.')); ?> VND</del>
                        <?php endif; ?>
                    </div>

                    <?php if($product->total_sold > 0): ?>
                        <p class="text-muted mb-3"><i class="fal fa-check-circle"></i> <?php echo e(__('Sold')); ?>: <?php echo e(number_format($product->total_sold)); ?></p>
                    <?php endif; ?>

                    <?php if($product->description): ?>
                        <div class="mb-4">
                            <p><?php echo e($product->description); ?></p>
                        </div>
                    <?php endif; ?>

                    <div class="order-form-wrapper shadow-block p-4 rounded">
                        <h4 class="mb-3"><?php echo e(__('Order Now')); ?></h4>
                        <form action="<?php echo e(route('public.product.order')); ?>" method="POST">
                            <?php echo csrf_field(); ?>
                            <input type="hidden" name="product_id" value="<?php echo e($product->id); ?>">

                            <div class="mb-3">
                                <label class="form-label"><?php echo e(__('Full Name')); ?> <span class="text-danger">*</span></label>
                                <input type="text" name="customer_name" class="form-control" required value="<?php echo e(old('customer_name')); ?>" maxlength="120">
                            </div>

                            <div class="mb-3">
                                <label class="form-label"><?php echo e(__('Email')); ?> <span class="text-danger">*</span></label>
                                <input type="email" name="customer_email" class="form-control" required value="<?php echo e(old('customer_email')); ?>" maxlength="120">
                            </div>

                            <div class="mb-3">
                                <label class="form-label"><?php echo e(__('Phone')); ?> <span class="text-danger">*</span></label>
                                <input type="tel" name="customer_phone" class="form-control" required value="<?php echo e(old('customer_phone')); ?>">
                            </div>

                            <div class="mb-3">
                                <label class="form-label"><?php echo e(__('Quantity')); ?></label>
                                <input type="number" name="quantity" class="form-control" value="1" min="1" max="100">
                            </div>

                            <div class="mb-3">
                                <label class="form-label"><?php echo e(__('Note')); ?></label>
                                <textarea name="customer_note" class="form-control" rows="3" maxlength="1000"><?php echo e(old('customer_note')); ?></textarea>
                            </div>

                            <button type="submit" class="btn ss-btn w-100">
                                <i class="fal fa-shopping-cart"></i> <?php echo e(__('Place Order')); ?>

                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <?php if($product->content): ?>
            <div class="row mt-50">
                <div class="col-12">
                    <div class="ck-content">
                        <?php echo $product->content; ?>

                    </div>
                </div>
            </div>
        <?php endif; ?>

        <?php if($relatedProducts->isNotEmpty()): ?>
            <div class="row mt-50">
                <div class="col-12">
                    <h3 class="mb-30"><?php echo e(__('Related Products')); ?></h3>
                </div>
                <?php $__currentLoopData = $relatedProducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $relatedProduct): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-30">
                        <?php echo $__env->make(Theme::getThemeNamespace('views.product.partials.product-card'), ['product' => $relatedProduct], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        <?php endif; ?>
    </div>
</section>
<?php /**PATH C:\laragon\www\main\platform\themes/riorelax/views/product/product.blade.php ENDPATH**/ ?>