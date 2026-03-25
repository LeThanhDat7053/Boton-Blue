@once
<style>
    .blog-twocol-section {
        display: flex;
        gap: 25px;
        margin-top: 40px;
        margin-bottom: 40px;
    }

    .blog-twocol-left {
        flex: 0 0 70%;
        max-width: 70%;
    }

    .blog-twocol-right {
        flex: 0 0 calc(30% - 25px);
        max-width: calc(30% - 25px);
    }

    .blog-twocol-title {
        font-size: 20px;
        font-weight: 700;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid var(--primary-color);
        display: inline-block;
    }

    /* Left column: vertical post list */
    .blog-twocol-post {
        display: flex;
        gap: 15px;
        margin-bottom: 20px;
        padding-bottom: 20px;
        border-bottom: 1px solid #eee;
    }

    .blog-twocol-post:last-child {
        border-bottom: none;
        margin-bottom: 0;
        padding-bottom: 0;
    }

    .blog-twocol-post-thumb {
        flex: 0 0 220px;
        height: 145px;
        overflow: hidden;
        border-radius: 6px;
    }

    .blog-twocol-post-thumb a {
        display: block;
        height: 100%;
    }

    .blog-twocol-post-thumb img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.3s ease;
    }

    .blog-twocol-post:hover .blog-twocol-post-thumb img {
        transform: scale(1.05);
    }

    .blog-twocol-post-content {
        flex: 1;
        min-width: 0;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .blog-twocol-post-content .blog-twocol-date {
        font-size: 12px;
        color: #999;
        display: block;
        margin-bottom: 6px;
    }

    .blog-twocol-post-content h3 {
        font-size: 17px;
        font-weight: 600;
        margin: 0 0 8px;
        line-height: 1.4;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .blog-twocol-post-content h3 a {
        color: #333;
        text-decoration: none;
    }

    .blog-twocol-post-content h3 a:hover {
        color: var(--primary-color);
    }

    .blog-twocol-post-content p {
        font-size: 13px;
        color: #666;
        margin: 0;
        line-height: 1.5;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    /* Right column: popular posts */
    .blog-popular-list {
        background: #f9f9f9;
        border-radius: 8px;
        padding: 15px;
    }

    .blog-popular-item {
        display: flex;
        gap: 12px;
        align-items: flex-start;
        padding: 10px 0;
        border-bottom: 1px solid #e8e8e8;
    }

    .blog-popular-item:last-child {
        border-bottom: none;
    }

    .blog-popular-rank {
        flex: 0 0 28px;
        height: 28px;
        background: var(--primary-color);
        color: #fff;
        font-size: 13px;
        font-weight: 700;
        text-align: center;
        line-height: 28px;
        border-radius: 4px;
        margin-top: 2px;
    }

    .blog-popular-item-thumb {
        flex: 0 0 70px;
        height: 50px;
        overflow: hidden;
        border-radius: 4px;
    }

    .blog-popular-item-thumb a {
        display: block;
        height: 100%;
    }

    .blog-popular-item-thumb img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .blog-popular-item-content {
        flex: 1;
        min-width: 0;
    }

    .blog-popular-item-content h5 {
        font-size: 13px;
        font-weight: 600;
        margin: 0;
        line-height: 1.4;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .blog-popular-item-content h5 a {
        color: #333;
        text-decoration: none;
    }

    .blog-popular-item-content h5 a:hover {
        color: var(--primary-color);
    }

    .blog-popular-item-views {
        font-size: 11px;
        color: #999;
        margin-top: 3px;
    }

    .blog-popular-item-views i {
        margin-right: 3px;
    }

    /* Pagination spacing */
    .blog-pagination-wrap {
        margin-top: 40px;
        margin-bottom: 60px;
    }

    /* Load more button */
    .blog-loadmore-btn {
        display: inline-block;
        background: var(--primary-color);
        color: #fff;
        border: none;
        padding: 10px 30px;
        font-size: 14px;
        font-weight: 600;
        border-radius: 4px;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.2s ease;
    }

    .blog-loadmore-btn:hover {
        background: var(--primary-color-hover);
        transform: translateY(-1px);
    }

    .blog-loadmore-btn i {
        margin-left: 6px;
        font-size: 12px;
    }

    /* Responsive */
    @media (max-width: 991px) {
        .blog-twocol-section {
            flex-direction: column;
        }

        .blog-twocol-left,
        .blog-twocol-right {
            flex: 0 0 100%;
            max-width: 100%;
        }
    }

    @media (max-width: 576px) {
        .blog-twocol-post {
            flex-direction: column;
        }

        .blog-twocol-post-thumb {
            flex: none;
            height: 180px;
            width: 100%;
        }
    }
</style>
@endonce

<div class="blog-twocol-section">
    {{-- Left Column 70%: All remaining posts, 5 at a time --}}
    <div class="blog-twocol-left">
        @foreach($bottomLeftPosts as $index => $post)
            <div class="blog-twocol-post js-loadmore-post" @if($index >= 3) style="display:none" @endif>
                <div class="blog-twocol-post-thumb">
                    <a href="{{ $post->url }}">
                        @if($post->image)
                            <img src="{{ RvMedia::getImageUrl($post->image, 'medium') }}" alt="{{ $post->name }}">
                        @endif
                    </a>
                </div>
                <div class="blog-twocol-post-content">
                    <span class="blog-twocol-date">{{ Theme::formatDate($post->created_at) }}</span>
                    <h3><a href="{{ $post->url }}">{{ $post->name }}</a></h3>
                    @if ($post->description)
                        <p>{!! BaseHelper::clean($post->description) !!}</p>
                    @endif
                </div>
            </div>
        @endforeach

        @if($bottomLeftPosts->count() > 3)
            <div class="text-center mt-20" id="blog-loadmore-wrap">
                <button type="button" class="blog-loadmore-btn" id="blog-loadmore-btn">
                    {{ __('Xem thêm') }} <i class="fas fa-chevron-down"></i>
                </button>
            </div>
        @endif
    </div>

    {{-- Right Column 30%: 5 Most Viewed --}}
    <div class="blog-twocol-right">
        <div class="blog-twocol-title">{{ __('Xem nhiều nhất') }}</div>
        <div class="blog-popular-list">
            @foreach($popularPosts as $index => $post)
                <div class="blog-popular-item">
                    <div class="blog-popular-rank">{{ $index + 1 }}</div>
                    <div class="blog-popular-item-thumb">
                        <a href="{{ $post->url }}">
                            @if($post->image)
                                <img src="{{ RvMedia::getImageUrl($post->image, 'small') }}" alt="{{ $post->name }}">
                            @endif
                        </a>
                    </div>
                    <div class="blog-popular-item-content">
                        <h5><a href="{{ $post->url }}">{{ $post->name }}</a></h5>
                        <div class="blog-popular-item-views">
                            <i class="fas fa-eye"></i> {{ number_format($post->views) }} {{ __('lượt xem') }}
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>

@once
<script>
document.addEventListener('DOMContentLoaded', function() {
    var btn = document.getElementById('blog-loadmore-btn');
    if (!btn) return;
    var wrap = document.getElementById('blog-loadmore-wrap');
    var allItems = document.querySelectorAll('.js-loadmore-post');
    var visible = 3;
    btn.addEventListener('click', function() {
        var target = visible + 5;
        for (var i = visible; i < allItems.length && i < target; i++) {
            allItems[i].style.display = '';
        }
        visible = Math.min(target, allItems.length);
        if (visible >= allItems.length) {
            wrap.style.display = 'none';
        }
    });
});
</script>
@endonce
