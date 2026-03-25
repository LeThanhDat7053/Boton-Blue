<?php
    Theme::set('pageTitle', $post->name);
    $recentPosts = get_recent_posts(5);
?>

<?php if (! $__env->hasRenderedOnce('9293b0e4-d529-4f93-b935-96f970db5ead')): $__env->markAsRenderedOnce('9293b0e4-d529-4f93-b935-96f970db5ead'); ?>
<style>
    /* H1 inside blog content - green left border style */
    .ck-content h1 {
        font-size: 22px;
        font-weight: 700;
        color: var(--primary-color);
        border-left: 4px solid var(--primary-color);
        padding: 8px 0 8px 15px;
        margin: 30px 0 15px;
        line-height: 1.4;
    }

    /* Sidebar: "Có thể bạn quan tâm" */
    .blog-detail-related {
        background: #f9f9f9;
        border-radius: 8px;
        padding: 20px;
    }

    .blog-detail-related-title {
        font-size: 18px;
        font-weight: 700;
        margin-bottom: 15px;
        padding-bottom: 10px;
        border-bottom: 2px solid var(--primary-color);
        text-transform: uppercase;
    }

    .blog-detail-related-item {
        display: flex;
        gap: 12px;
        align-items: flex-start;
        padding: 10px 0;
        border-bottom: 1px solid #e8e8e8;
    }

    .blog-detail-related-item:last-child {
        border-bottom: none;
    }

    .blog-detail-related-thumb {
        flex: 0 0 80px;
        height: 55px;
        overflow: hidden;
        border-radius: 4px;
    }

    .blog-detail-related-thumb a {
        display: block;
        height: 100%;
    }

    .blog-detail-related-thumb img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.3s ease;
    }

    .blog-detail-related-item:hover .blog-detail-related-thumb img {
        transform: scale(1.05);
    }

    .blog-detail-related-info {
        flex: 1;
        min-width: 0;
    }

    .blog-detail-related-info .related-date {
        font-size: 11px;
        color: #999;
        display: block;
        margin-bottom: 3px;
    }

    .blog-detail-related-info h5 {
        font-size: 13px;
        font-weight: 600;
        margin: 0;
        line-height: 1.4;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .blog-detail-related-info h5 a {
        color: #333;
        text-decoration: none;
    }

    .blog-detail-related-info h5 a:hover {
        color: var(--primary-color);
    }
</style>
<?php endif; ?>

<section class="inner-blog b-details-p pt-80 pb-40">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="blog-details-wrap">
                    <div class="details__content pb-30">
                        <h2><?php echo e($post->name); ?></h2>
                        <div class="meta-info">
                            <ul>
                                <li><i class="fal fa-eye"></i><?php echo e(number_format($post->views)); ?></li>
                                <li><i class="fal fa-calendar-alt"></i><?php echo e(Theme::formatDate($post->created_at)); ?></li>
                            </ul>
                        </div>
                        <div class="ck-content">
                            <?php echo $post->content; ?>

                        </div>
                        <?php if(function_exists('gallery_meta_data')): ?>
                            <?php ($galleryItems = gallery_meta_data($post)); ?>
                            <?php if(!empty($galleryItems)): ?>
                                <?php echo Theme::partial('media-gallery', ['items' => $galleryItems, 'id' => 'post-gallery']); ?>

                            <?php endif; ?>
                        <?php endif; ?>
                        <?php if($post->tags->isNotEmpty()): ?>
                            <div class="row">
                                <div class="col-xl-12 col-md-12">
                                    <div class="post__tag">
                                        <h5><?php echo e(__('Related Tags')); ?></h5>
                                        <ul>
                                            <?php $__currentLoopData = $post->tags; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tag): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <li>
                                                    <a href="<?php echo e($tag->url); ?>"><?php echo e($tag->name); ?></a>
                                                </li>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        <?php endif; ?>
                    </div>
                    <?php if(($posts = get_related_posts($post->id, 2)) && $posts->isNotEmpty()): ?>
                        <div class="posts_navigation pt-35 pb-100">
                            <div class="row align-items-center">
                                <?php if($prevPost = $posts[0]): ?>
                                    <div class="col-xl-4 col-md-5">
                                        <div class="prev-link">
                                            <span><?php echo e(__('Prev Post')); ?></span>
                                            <h4><a href="<?php echo e($prevPost->url); ?>"><?php echo e($prevPost->name); ?></a></h4>
                                        </div>
                                    </div>
                                <?php endif; ?>
                                <?php if($post->firstCategory): ?>
                                    <div class="col-xl-4 col-md-2 text-md-center">
                                        <a href="<?php echo e($post->firstCategory->url); ?>" class="blog-filter"><img src="<?php echo e(Theme::asset()->url('images/blog-category-icon.png')); ?>" alt="<?php echo e($post->firstCategory->name); ?>" /></a>
                                    </div>
                                <?php endif; ?>
                                <?php if($nextPost = (isset($posts[1]) ? $posts[1] : null)): ?>
                                    <div class="col-xl-4 col-md-5">
                                        <div class="next-link text-end text-md-right">
                                            <span><?php echo e(__('Next Post')); ?></span>
                                            <h4><a href="<?php echo e($nextPost->url); ?>"><?php echo e($nextPost->name); ?></a></h4>
                                        </div>
                                    </div>
                                <?php endif; ?>
                            </div>
                        </div>
                    <?php else: ?>
                        <div class="mb-60"></div>
                    <?php endif; ?>

                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-4">
                <aside class="sidebar-widget">
                    <div class="blog-detail-related">
                        <div class="blog-detail-related-title"><?php echo e(__('CÓ THỂ BẠN QUAN TÂM')); ?></div>
                        <?php $__currentLoopData = $recentPosts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $recentPost): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="blog-detail-related-item">
                                <div class="blog-detail-related-thumb">
                                    <a href="<?php echo e($recentPost->url); ?>">
                                        <?php if($recentPost->image): ?>
                                            <img src="<?php echo e(RvMedia::getImageUrl($recentPost->image, 'small')); ?>" alt="<?php echo e($recentPost->name); ?>">
                                        <?php endif; ?>
                                    </a>
                                </div>
                                <div class="blog-detail-related-info">
                                    <span class="related-date"><?php echo e(Theme::formatDate($recentPost->created_at)); ?></span>
                                    <h5><a href="<?php echo e($recentPost->url); ?>"><?php echo e($recentPost->name); ?></a></h5>
                                </div>
                            </div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                </aside>
            </div>
        </div>
    </div>
</section>
<?php /**PATH C:\laragon\www\main\platform\themes/riorelax/views/post.blade.php ENDPATH**/ ?>