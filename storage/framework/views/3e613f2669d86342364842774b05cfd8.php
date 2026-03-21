<?php ($bgColor = $shortcode->background_color ?: '#f7f5f1'); ?>

<div class="brand-area pt-60 pb-60" style="background-color: <?php echo e($bgColor); ?>">
    <div class="container">
        <div class="row brand-active">
            <?php $__currentLoopData = $tabs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tab): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-xl-2">
                    <?php if($tab['image']): ?>
                        <div class="single-brand">
                            <a href="<?php echo e($tab['link']); ?>">
                                <img src="<?php echo e(RvMedia::getImageUrl($tab['image'])); ?>" alt="<?php echo e($tab['name']); ?>">
                            </a>
                        </div>
                    <?php endif; ?>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
</div>
<?php /**PATH C:\laragon\www\main\platform\themes/riorelax/partials/shortcodes/brands/index.blade.php ENDPATH**/ ?>