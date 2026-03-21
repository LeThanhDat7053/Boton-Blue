<?php
    $margin = $margin ?? false;
?>

<div class="<?php echo \Illuminate\Support\Arr::toCssClasses(['single-services shadow-block mb-30', 'ser-m' => !$margin]); ?>">
    <div class="services-thumb hover-zoomin wow fadeInUp animated">
        <?php if($images = $room->images): ?>
            <a href="<?php echo e($room->url); ?>?start_date=<?php echo e(BaseHelper::stringify(request()->query('start_date', $startDate))); ?>&end_date=<?php echo e(BaseHelper::stringify(request()->query('end_date', $endDate))); ?>&adults=<?php echo e(BaseHelper::stringify(request()->query('adults', HotelHelper::getMinimumNumberOfGuests()))); ?>&children=<?php echo e(BaseHelper::stringify(request()->query('children', 0))); ?>">
                <img src="<?php echo e(RvMedia::getImageUrl(Arr::first($images), 'medium')); ?>" alt="<?php echo e($room->name); ?>">
            </a>
        <?php endif; ?>
    </div>
    <div class="services-content">
        <?php if(!empty($room->vr360_url)): ?>
            <div class="day-book">
                <a href="<?php echo e($room->vr360_url); ?>" target="_blank" rel="noopener noreferrer" class="vr360-btn">
                    <i class="fas fa-vr-cardboard"></i> VIEW VR360
                </a>
            </div>
        <?php endif; ?>
        <h4><a href="<?php echo e($room->url); ?>"><?php echo e($room->name); ?></a></h4>
        <?php if($description = $room->description): ?>
            <p class="room-item-custom-truncate" title="<?php echo e($description); ?>"><?php echo BaseHelper::clean($description); ?></p>
        <?php endif; ?>

        <?php if($room->amenities->isNotEmpty()): ?>
            <div class="icon">
                <ul class="d-flex justify-content-evenly">
                    <?php $__currentLoopData = $room->amenities->take(6); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $amenity): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php if($image = $amenity->getMetaData('icon_image', true) ): ?>
                            <li>
                                <img src="<?php echo e(RvMedia::getImageUrl($image)); ?>" alt="<?php echo e($amenity->name); ?>">
                            </li>
                        <?php endif; ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ul>
            </div>
        <?php endif; ?>
    </div>
</div>
<?php /**PATH C:\laragon\www\main\platform\themes/riorelax/partials/rooms/item.blade.php ENDPATH**/ ?>