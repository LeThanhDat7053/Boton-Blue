<?php if (! $__env->hasRenderedOnce('9226167e-5f14-45f7-9150-424e6a342145')): $__env->markAsRenderedOnce('9226167e-5f14-45f7-9150-424e6a342145'); ?>
    <div
        class="offcanvas offcanvas-end"
        tabindex="-1"
        id="notification-sidebar"
        aria-labelledby="notification-sidebar-label"
        data-url="<?php echo e(route('notifications.index')); ?>"
        data-count-url="<?php echo e(route('notifications.count-unread')); ?>"
    >
        <button
            type="button"
            class="btn-close text-reset"
            data-bs-dismiss="offcanvas"
            aria-label="Close"
        ></button>

        <div class="notification-content"></div>
    </div>

    <script src="<?php echo e(asset('vendor/core/core/base/js/notification.js')); ?>"></script>
<?php endif; ?>
<?php /**PATH C:\laragon\www\main\platform\core\base\/resources/views/notification/notification.blade.php ENDPATH**/ ?>