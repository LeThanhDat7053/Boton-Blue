<link
    href="<?php echo e(rtrim(Language::getLocalizedURL(Language::getDefaultLocale(), url()->current(), [], false), '/')); ?>"
    hreflang="x-default"
    rel="alternate"
/>

<?php $__currentLoopData = $hreflangUrls; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $hreflangCode => $url): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <link
        href="<?php echo e($url); ?>"
        hreflang="<?php echo e($hreflangCode); ?>"
        rel="alternate"
    />
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php /**PATH C:\laragon\www\main\platform\plugins\language\/resources/views/partials/hreflang.blade.php ENDPATH**/ ?>