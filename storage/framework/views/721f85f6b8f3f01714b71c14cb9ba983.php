<?php if(is_plugin_active('hotel') && count($currencies = get_all_currencies()) > 0): ?>
    <div class="dropdown currencies-switcher d-inline-flex align-items-center">
        <a class="dropdown-toggle" type="button" id="currency-switcher-dropdown" data-bs-toggle="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <?php echo e(get_application_currency()->title); ?>

        </a>
        <div class="dropdown-menu currency-switcher-list" aria-labelledby="currency-switcher-dropdown">
            <?php $__currentLoopData = $currencies; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $currency): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php if($currency->id === get_application_currency_id()) continue; ?>
                <li>
                    <a class="currency-item" href="<?php echo e(route('public.change-currency', $currency->title)); ?>"><?php echo e($currency->title); ?></a>
                </li>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
<?php endif; ?>

<?php /**PATH C:\laragon\www\main\platform\themes/riorelax/partials/currency-switcher.blade.php ENDPATH**/ ?>