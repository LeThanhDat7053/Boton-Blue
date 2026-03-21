<section id="pricing" class="pricing-area pt-90 pb-60 fix p-relative">
    <?php if($bgImage1 = $shortcode->background_image_1): ?>
        <div class="animations-01">
            <img src="<?php echo e(RvMedia::getImageUrl($bgImage1)); ?>" alt="<?php echo e(__('Background image 1')); ?>">
        </div>
    <?php endif; ?>

    <?php if($bgImage2 = $shortcode->background_image_2): ?>
        <div class="animations-02">
            <img src="<?php echo e(RvMedia::getImageUrl($bgImage2)); ?>" alt="<?php echo e(__('Background image 2')); ?>">
        </div>
    <?php endif; ?>

    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-lg-4 col-md-12">
                <div class="section-title mb-20">
                    <?php if($subtitle = $shortcode->subtitle): ?>
                        <h5><?php echo BaseHelper::clean($subtitle); ?></h5>
                    <?php endif; ?>

                    <?php if($title = $shortcode->title): ?>
                        <h2><?php echo BaseHelper::clean($title); ?></h2>
                    <?php endif; ?>
                </div>

                <?php if($description = $shortcode->description): ?>
                    <p><?php echo BaseHelper::clean($description); ?></p>
                <?php endif; ?>
            </div>

            <?php $__currentLoopData = $tabs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tab): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-lg-4 col-md-6">
                    <div class="pricing-box pricing-box2 mb-60">
                        <div class="pricing-head">
                            <?php if($tab['title']): ?>
                                <h3><?php echo BaseHelper::clean($tab['title']); ?></h3>
                            <?php endif; ?>

                            <?php if($tab['description']): ?>
                                <p><?php echo BaseHelper::clean($tab['description']); ?></p>
                            <?php endif; ?>

                            <?php if($tab['duration']): ?>
                                <div class="month"><?php echo BaseHelper::clean($tab['duration']); ?></div>
                            <?php endif; ?>

                            <?php if($tab['price']): ?>
                                <div class="price-count">
                                    <h2><?php echo BaseHelper::clean($tab['price']); ?></h2>
                                </div>
                            <?php endif; ?>
                            <hr>
                        </div>

                        <?php if($tab['feature_list']): ?>
                            <?php
                                $featureList = explode(',', $tab['feature_list'])
                            ?>

                            <?php if(count($featureList) > 0): ?>
                                <div class="pricing-body mt-20 mb-30 text-start">
                                    <ul>
                                        <?php $__currentLoopData = $featureList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $feature): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <li><?php echo BaseHelper::clean($feature); ?></li>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </ul>
                                </div>
                            <?php endif; ?>
                        <?php endif; ?>

                        <?php if($tab['button_label'] && $tab['button_url']): ?>
                            <div class="pricing-btn">
                                <a href="<?php echo e($tab['button_url']); ?>" class="btn ss-btn"><?php echo BaseHelper::clean($tab['button_label']); ?><i class="fal fa-angle-right"></i></a>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
</section>
<?php /**PATH C:\laragon\www\main\platform\themes/riorelax/partials/shortcodes/pricing/index.blade.php ENDPATH**/ ?>