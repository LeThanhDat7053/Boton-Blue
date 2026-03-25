@once
<style>
    .blog-row-section {
        margin-top: 40px;
        margin-bottom: 40px;
    }

    .blog-row-section .section-title {
        font-size: 22px;
        font-weight: 700;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid var(--primary-color);
        display: inline-block;
    }

    .blog-row-grid {
        display: grid;
        grid-template-columns: repeat(5, 1fr);
        gap: 15px;
    }

    .blog-row-card {
        background: #fff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 10px rgba(0,0,0,0.06);
        transition: box-shadow 0.3s ease, transform 0.3s ease;
    }

    .blog-row-card:hover {
        box-shadow: 0 6px 20px rgba(0,0,0,0.12);
        transform: translateY(-3px);
    }

    .blog-row-card-thumb {
        position: relative;
        overflow: hidden;
        height: 150px;
    }

    .blog-row-card-thumb a {
        display: block;
        height: 100%;
    }

    .blog-row-card-thumb img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.3s ease;
    }

    .blog-row-card:hover .blog-row-card-thumb img {
        transform: scale(1.05);
    }

    .blog-row-card-body {
        padding: 12px 14px;
    }

    .blog-row-card-body .blog-row-date {
        font-size: 11px;
        color: #999;
        display: block;
        margin-bottom: 5px;
    }

    .blog-row-card-body h4 {
        font-size: 14px;
        font-weight: 600;
        margin: 0;
        line-height: 1.4;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .blog-row-card-body h4 a {
        color: #333;
        text-decoration: none;
    }

    .blog-row-card-body h4 a:hover {
        color: var(--primary-color);
    }

    @media (max-width: 991px) {
        .blog-row-grid {
            grid-template-columns: repeat(3, 1fr);
        }
    }

    @media (max-width: 576px) {
        .blog-row-grid {
            grid-template-columns: repeat(2, 1fr);
        }
    }
</style>
@endonce

<div class="blog-row-section">
    <div class="blog-row-grid">
        @foreach($posts as $post)
            <div class="blog-row-card">
                <div class="blog-row-card-thumb">
                    <a href="{{ $post->url }}">
                        @if($post->image)
                            <img src="{{ RvMedia::getImageUrl($post->image, 'medium') }}" alt="{{ $post->name }}">
                        @endif
                    </a>
                </div>
                <div class="blog-row-card-body">
                    <span class="blog-row-date">{{ Theme::formatDate($post->created_at) }}</span>
                    <h4><a href="{{ $post->url }}">{{ $post->name }}</a></h4>
                </div>
            </div>
        @endforeach
    </div>
</div>
