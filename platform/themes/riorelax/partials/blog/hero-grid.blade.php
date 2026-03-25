@once
<style>
    .blog-hero-grid {
        display: grid;
        grid-template-columns: 1fr 2fr 1fr;
        gap: 10px;
        margin-bottom: 40px;
    }

    .blog-hero-left {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .blog-hero-item {
        flex: 1;
        position: relative;
        overflow: hidden;
        border-radius: 8px;
    }

    .blog-hero-item > a {
        display: block;
        height: 100%;
    }

    .blog-hero-item img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.3s ease;
    }

    .blog-hero-item:hover img {
        transform: scale(1.05);
    }

    .blog-hero-item::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        height: 65%;
        background: linear-gradient(transparent, rgba(0,0,0,0.75));
        pointer-events: none;
        z-index: 1;
    }

    .blog-hero-item-content {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        padding: 12px 15px;
        z-index: 2;
        color: #fff;
    }

    .blog-hero-item-content .blog-hero-date {
        font-size: 11px;
        opacity: 0.85;
        display: block;
        margin-bottom: 4px;
    }

    .blog-hero-item-content h4 {
        font-size: 14px;
        font-weight: 600;
        margin: 0;
        line-height: 1.4;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .blog-hero-item-content h4 a {
        color: #fff;
        text-decoration: none;
    }

    .blog-hero-item-content h4 a:hover {
        text-decoration: underline;
    }

    /* Center - Pinned Post */
    .blog-hero-center {
        position: relative;
        overflow: hidden;
        border-radius: 8px;
        min-height: 520px;
    }

    .blog-hero-featured {
        height: 100%;
    }

    .blog-hero-featured > a {
        display: block;
        height: 100%;
    }

    .blog-hero-featured img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.3s ease;
    }

    .blog-hero-featured:hover img {
        transform: scale(1.05);
    }

    .blog-hero-center::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        height: 50%;
        background: linear-gradient(transparent, rgba(0,0,0,0.75));
        pointer-events: none;
        z-index: 1;
    }

    .blog-hero-featured-content {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        padding: 20px 25px;
        z-index: 2;
        color: #fff;
    }

    .blog-hero-pin-badge {
        display: inline-block;
        background: var(--primary-color);
        color: #fff;
        font-size: 11px;
        padding: 3px 10px;
        border-radius: 3px;
        text-transform: uppercase;
        font-weight: 600;
        letter-spacing: 0.5px;
    }

    .blog-hero-featured-content h3 {
        font-size: 22px;
        font-weight: 700;
        margin: 8px 0;
        line-height: 1.3;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .blog-hero-featured-content h3 a {
        color: #fff;
        text-decoration: none;
    }

    .blog-hero-featured-content h3 a:hover {
        text-decoration: underline;
    }

    .blog-hero-featured-content p {
        font-size: 14px;
        margin: 0;
        line-height: 1.5;
        opacity: 0.9;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    /* Right Column */
    .blog-hero-right {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        background: #f9f9f9;
        border-radius: 8px;
        padding: 8px 12px;
    }

    .blog-hero-item-sm {
        display: flex;
        gap: 10px;
        align-items: flex-start;
        padding: 8px 0;
        border-bottom: 1px solid #e8e8e8;
    }

    .blog-hero-item-sm:last-child {
        border-bottom: none;
    }

    .blog-hero-item-sm-thumb {
        width: 80px;
        min-width: 80px;
        height: 55px;
        overflow: hidden;
        border-radius: 4px;
    }

    .blog-hero-item-sm-thumb a {
        display: block;
        height: 100%;
    }

    .blog-hero-item-sm-thumb img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.3s ease;
    }

    .blog-hero-item-sm:hover .blog-hero-item-sm-thumb img {
        transform: scale(1.05);
    }

    .blog-hero-item-sm-content {
        flex: 1;
        min-width: 0;
    }

    .blog-hero-item-sm-content .blog-hero-date {
        font-size: 11px;
        color: #888;
        display: block;
        margin-bottom: 3px;
    }

    .blog-hero-item-sm-content h5 {
        font-size: 13px;
        font-weight: 600;
        margin: 0;
        line-height: 1.4;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .blog-hero-item-sm-content h5 a {
        color: #333;
        text-decoration: none;
    }

    .blog-hero-item-sm-content h5 a:hover {
        color: var(--primary-color);
    }

    /* Responsive */
    @media (max-width: 991px) {
        .blog-hero-grid {
            grid-template-columns: 1fr;
            height: auto;
        }

        .blog-hero-center {
            height: 300px;
            order: -1;
        }

        .blog-hero-left {
            flex-direction: row;
        }

        .blog-hero-item {
            height: 200px;
        }

        .blog-hero-right {
            max-height: 300px;
        }
    }

    @media (max-width: 576px) {
        .blog-hero-left {
            flex-direction: column;
        }

        .blog-hero-item {
            height: 180px;
        }

        .blog-hero-featured-content h3 {
            font-size: 18px;
        }
    }
</style>
@endonce

<div class="blog-hero-grid">
    {{-- Left Column: 2 newest posts --}}
    <div class="blog-hero-left">
        @foreach($heroLeftPosts as $post)
            <div class="blog-hero-item">
                <a href="{{ $post->url }}">
                    @if($post->image)
                        <img src="{{ RvMedia::getImageUrl($post->image) }}" alt="{{ $post->name }}">
                    @endif
                </a>
                <div class="blog-hero-item-content">
                    <span class="blog-hero-date">{{ Theme::formatDate($post->created_at) }}</span>
                    <h4><a href="{{ $post->url }}">{{ $post->name }}</a></h4>
                </div>
            </div>
        @endforeach
    </div>

    {{-- Center Column: Pinned/Featured post --}}
    <div class="blog-hero-center">
        <div class="blog-hero-featured">
            <a href="{{ $pinnedPost->url }}">
                @if($pinnedPost->image)
                    <img src="{{ RvMedia::getImageUrl($pinnedPost->image) }}" alt="{{ $pinnedPost->name }}">
                @endif
            </a>
            <div class="blog-hero-featured-content">
                <span class="blog-hero-pin-badge"><i class="fas fa-thumbtack"></i> {{ __('Ghim') }}</span>
                <h3><a href="{{ $pinnedPost->url }}">{{ $pinnedPost->name }}</a></h3>
                @if ($pinnedPost->description)
                    <p>{!! BaseHelper::clean($pinnedPost->description) !!}</p>
                @endif
            </div>
        </div>
    </div>

    {{-- Right Column: 5 next newest posts --}}
    <div class="blog-hero-right">
        @foreach($heroRightPosts as $post)
            <div class="blog-hero-item-sm">
                <div class="blog-hero-item-sm-thumb">
                    <a href="{{ $post->url }}">
                        @if($post->image)
                            <img src="{{ RvMedia::getImageUrl($post->image, 'small') }}" alt="{{ $post->name }}">
                        @endif
                    </a>
                </div>
                <div class="blog-hero-item-sm-content">
                    <span class="blog-hero-date">{{ Theme::formatDate($post->created_at) }}</span>
                    <h5><a href="{{ $post->url }}">{{ $post->name }}</a></h5>
                </div>
            </div>
        @endforeach
    </div>
</div>
