



<?php
    $galleryId = $id ?? 'media-gallery-' . uniqid();
    $items = $items ?? [];
    $galleryImages = collect($items)->filter(fn($item) => Arr::get($item, 'type', 'image') === 'image');
    $galleryVideos = collect($items)->filter(fn($item) => Arr::get($item, 'type') === 'video');
    $galleryVr360s = collect($items)->filter(fn($item) => Arr::get($item, 'type') === 'vr360');
?>

<?php if(count($items)): ?>
<div class="media-gallery-section mt-30 mb-30">
    <div class="row" id="<?php echo e($galleryId); ?>">
        
        <?php $__currentLoopData = $galleryImages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $image): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <?php if(Arr::get($image, 'img')): ?>
                <div class="col-12 col-md-4 mt-20"
                     data-src="<?php echo e(RvMedia::getImageUrl(Arr::get($image, 'img'), 'galleries')); ?>"
                     data-sub-html="<?php echo e(BaseHelper::clean(Arr::get($image, 'description'))); ?>">
                    <div class="photo-item">
                        <div class="thumb">
                            <a href="<?php echo e(RvMedia::getImageUrl(Arr::get($image, 'img'), 'galleries')); ?>">
                                <img src="<?php echo e(RvMedia::getImageUrl(Arr::get($image, 'img'), 'galleries')); ?>"
                                     alt="<?php echo e(BaseHelper::clean(Arr::get($image, 'description'))); ?>"
                                     loading="lazy" style="width:100%;border-radius:4px;">
                            </a>
                        </div>
                    </div>
                </div>
            <?php endif; ?>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

        
        <?php $__currentLoopData = $galleryVideos; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $video): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <?php if(Arr::get($video, 'img')): ?>
                <?php
                    $videoUrl = Arr::get($video, 'img');
                    $videoDesc = Arr::get($video, 'description', '');
                    $ytId = '';
                    $vimeoId = '';

                    if (preg_match('/(?:youtube\.com\/(?:watch\?v=|embed\/|shorts\/)|youtu\.be\/)([a-zA-Z0-9_-]{11})/', $videoUrl, $ytMatch)) {
                        $ytId = $ytMatch[1];
                    } elseif (preg_match('/vimeo\.com\/(?:video\/)?(\d+)/', $videoUrl, $vmMatch)) {
                        $vimeoId = $vmMatch[1];
                    }

                    $isExternal = ($ytId || $vimeoId);
                    $thumbUrl = $ytId ? 'https://img.youtube.com/vi/' . $ytId . '/hqdefault.jpg' : '';
                    $embedUrl = $ytId
                        ? 'https://www.youtube.com/embed/' . $ytId . '?autoplay=1'
                        : ($vimeoId ? 'https://player.vimeo.com/video/' . $vimeoId . '?autoplay=1' : '');

                    $resolvedVideoUrl = (str_starts_with($videoUrl, 'http://') || str_starts_with($videoUrl, 'https://'))
                        ? $videoUrl
                        : RvMedia::getImageUrl($videoUrl);

                    $videoUniqueId = 'vid_' . md5($videoUrl);
                ?>

                <div class="col-12 col-md-4 mt-20">
                    <?php if($isExternal): ?>
                        
                        <a href="#" data-bs-toggle="modal" data-bs-target="#<?php echo e($videoUniqueId); ?>Modal"
                           class="position-relative d-block overflow-hidden rounded"
                           style="aspect-ratio:16/9;background:#000;">
                            <?php if($thumbUrl): ?>
                                <img src="<?php echo e($thumbUrl); ?>" alt="<?php echo e($videoDesc); ?>"
                                     style="width:100%;height:100%;object-fit:cover;opacity:0.8;" loading="lazy">
                            <?php endif; ?>
                            <span class="position-absolute top-50 start-50 translate-middle"
                                  style="font-size:50px;color:#fff;text-shadow:0 2px 10px rgba(0,0,0,.7);">
                                <i class="fas fa-play-circle"></i>
                            </span>
                            <span class="position-absolute bottom-0 start-0 px-2 py-1 text-white"
                                  style="background:rgba(0,0,0,.6);font-size:11px;font-weight:700;">
                                <i class="fas fa-video me-1"></i> VIDEO
                            </span>
                        </a>

                        <div class="modal fade" id="<?php echo e($videoUniqueId); ?>Modal" tabindex="-1"
                             aria-labelledby="<?php echo e($videoUniqueId); ?>Label" aria-hidden="true"
                             data-video-src="<?php echo e($embedUrl); ?>">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content" style="background:#000;">
                                    <div class="modal-header border-0 p-2">
                                        <button type="button" class="btn-close btn-close-white"
                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body p-0">
                                        <div style="position:relative;padding-bottom:56.25%;height:0;">
                                            
                                            <iframe src="" frameborder="0"
                                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                    allowfullscreen
                                                    style="position:absolute;top:0;left:0;width:100%;height:100%;"></iframe>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php else: ?>
                        
                        <?php
                            $localThumb = Arr::get($video, 'thumb');
                            $localThumbUrl = $localThumb
                                ? (str_starts_with($localThumb, 'http') ? $localThumb : RvMedia::getImageUrl($localThumb))
                                : null;
                        ?>
                        <a href="#" data-bs-toggle="modal" data-bs-target="#<?php echo e($videoUniqueId); ?>Modal"
                           class="position-relative d-block overflow-hidden rounded"
                           style="aspect-ratio:16/9;background:#111;">
                            <?php if($localThumbUrl): ?>
                                <img src="<?php echo e($localThumbUrl); ?>" alt="<?php echo e($videoDesc); ?>"
                                     style="width:100%;height:100%;object-fit:cover;opacity:0.8;position:absolute;inset:0;" loading="lazy">
                            <?php endif; ?>
                            <span class="position-absolute top-50 start-50 translate-middle"
                                  style="font-size:50px;color:#fff;text-shadow:0 2px 10px rgba(0,0,0,.7);z-index:1;">
                                <i class="fas fa-play-circle"></i>
                            </span>
                            <span class="position-absolute bottom-0 start-0 px-2 py-1 text-white"
                                  style="background:rgba(0,0,0,.6);font-size:11px;font-weight:700;z-index:1;">
                                <i class="fas fa-video me-1"></i> VIDEO
                            </span>
                            <?php if($videoDesc): ?>
                                <span class="position-absolute bottom-0 end-0 px-2 py-1 text-white"
                                      style="background:rgba(0,0,0,.6);font-size:11px;z-index:1;"><?php echo e($videoDesc); ?></span>
                            <?php endif; ?>
                        </a>

                        <div class="modal fade" id="<?php echo e($videoUniqueId); ?>Modal" tabindex="-1"
                             aria-labelledby="<?php echo e($videoUniqueId); ?>Label" aria-hidden="true">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content" style="background:#000;">
                                    <div class="modal-header border-0 p-2">
                                        <button type="button" class="btn-close btn-close-white"
                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body p-0">
                                        <video controls preload="metadata"
                                               style="width:100%;display:block;max-height:70vh;">
                                            <source src="<?php echo e($resolvedVideoUrl); ?>" type="video/mp4">
                                            <source src="<?php echo e($resolvedVideoUrl); ?>" type="video/webm">
                                        </video>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                </div>
            <?php endif; ?>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

        
        <?php $__currentLoopData = $galleryVr360s; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $vr): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <?php if(Arr::get($vr, 'img')): ?>
                <?php
                    $vrLink = Arr::get($vr, 'img');
                    $vrThumb = Arr::get($vr, 'thumb');
                    // Priority: explicit thumb → fallback to img URL itself (works when img is a panorama .jpg)
                    if ($vrThumb) {
                        $vrPreviewUrl = str_starts_with($vrThumb, 'http') ? $vrThumb : RvMedia::getImageUrl($vrThumb);
                    } else {
                        $vrPreviewUrl = str_starts_with($vrLink, 'http') ? $vrLink : RvMedia::getImageUrl($vrLink);
                    }
                ?>
                <div class="col-12 col-md-4 mt-20">
                    <a href="<?php echo e($vrLink); ?>" target="_blank" rel="noopener noreferrer"
                       class="position-relative d-block overflow-hidden rounded"
                       style="aspect-ratio:16/9;background:#1a1a2e;">
                        
                        <img src="<?php echo e($vrPreviewUrl); ?>"
                             alt="<?php echo e(Arr::get($vr, 'description', 'VR360')); ?>"
                             loading="lazy"
                             class="vr360-preview-img"
                             style="width:100%;height:100%;object-fit:cover;position:absolute;inset:0;opacity:0.75;"
                             onerror="this.style.display='none'">
                        <span class="position-absolute top-50 start-50 translate-middle text-center" style="pointer-events:none;z-index:1;">
                            <i class="fas fa-vr-cardboard" style="font-size:40px;color:#00d4ff;text-shadow:0 2px 8px rgba(0,0,0,.5);"></i>
                            <span class="d-block text-white mt-1" style="font-size:12px;font-weight:700;letter-spacing:1px;">VR360 — Click to open</span>
                        </span>
                        <?php if(Arr::get($vr, 'description')): ?>
                            <span class="position-absolute bottom-0 start-0 px-2 py-1 text-white"
                                  style="background:rgba(0,0,0,.6);font-size:11px;z-index:1;">
                                <?php echo e(Arr::get($vr, 'description')); ?>

                            </span>
                        <?php endif; ?>
                    </a>
                </div>
            <?php endif; ?>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>
</div>

<?php if($galleryVideos->isNotEmpty()): ?>
<script>
document.addEventListener('DOMContentLoaded', function () {
    // Set iframe src only when modal opens, clear it on close so audio stops
    document.querySelectorAll('.modal[data-video-src]').forEach(function (modal) {
        var src = modal.getAttribute('data-video-src');
        var iframe = modal.querySelector('iframe');
        if (!iframe) return;
        modal.addEventListener('show.bs.modal', function () {
            iframe.src = src;
        });
        modal.addEventListener('hide.bs.modal', function () {
            iframe.src = '';
        });
    });

    // Pause local videos and reset to start when modal closes
    document.querySelectorAll('.modal').forEach(function (modal) {
        var video = modal.querySelector('video');
        if (!video) return;
        modal.addEventListener('hide.bs.modal', function () {
            video.pause();
            video.currentTime = 0;
        });
    });
});
</script>
<?php endif; ?>
<?php endif; ?>
<?php /**PATH C:\laragon\www\main\platform\themes/riorelax/partials/media-gallery.blade.php ENDPATH**/ ?>