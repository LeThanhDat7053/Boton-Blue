@php
    Theme::set('pageTitle', $post->name);
@endphp
<section class="inner-blog b-details-p pt-80 pb-40">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="blog-details-wrap">
                    <div class="details__content pb-30">
                        <h2>{{ $post->name }}</h2>
                        <div class="meta-info">
                            <ul>
                                <li><i class="fal fa-eye"></i>{{ number_format($post->views) }}</li>
                                <li><i class="fal fa-calendar-alt"></i>{{ Theme::formatDate($post->created_at) }}</li>
                            </ul>
                        </div>
                        <div class="ck-content">
                            {!! $post->content !!}
                        </div>
                        @if (function_exists('gallery_meta_data'))
                            @php($galleryItems = gallery_meta_data($post))
                            @if (!empty($galleryItems))
                                {!! Theme::partial('media-gallery', ['items' => $galleryItems, 'id' => 'post-gallery']) !!}
                            @endif
                        @endif
                        @if ($post->tags->isNotEmpty())
                            <div class="row">
                                <div class="col-xl-12 col-md-12">
                                    <div class="post__tag">
                                        <h5>{{ __('Related Tags') }}</h5>
                                        <ul>
                                            @foreach($post->tags as $tag)
                                                <li>
                                                    <a href="{{ $tag->url }}">{{ $tag->name }}</a>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        @endif
                    </div>
                    @if(($posts = get_related_posts($post->id, 2)) && $posts->isNotEmpty())
                        <div class="posts_navigation pt-35 pb-100">
                            <div class="row align-items-center">
                                @if($prevPost = $posts[0])
                                    <div class="col-xl-4 col-md-5">
                                        <div class="prev-link">
                                            <span>{{ __('Prev Post') }}</span>
                                            <h4><a href="{{ $prevPost->url }}">{{ $prevPost->name }}</a></h4>
                                        </div>
                                    </div>
                                @endif
                                @if ($post->firstCategory)
                                    <div class="col-xl-4 col-md-2 text-md-center">
                                        <a href="{{ $post->firstCategory->url }}" class="blog-filter"><img src="{{ Theme::asset()->url('images/blog-category-icon.png') }}" alt="{{ $post->firstCategory->name }}" /></a>
                                    </div>
                                @endif
                                @if($nextPost = (isset($posts[1]) ? $posts[1] : null))
                                    <div class="col-xl-4 col-md-5">
                                        <div class="next-link text-end text-md-right">
                                            <span>{{ __('Next Post') }}</span>
                                            <h4><a href="{{ $nextPost->url }}">{{ $nextPost->name }}</a></h4>
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    @else
                        <div class="mb-60"></div>
                    @endif

                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-4">
                <aside class="sidebar-widget">
                    {!! dynamic_sidebar('blog_sidebar') !!}
                </aside>
            </div>
        </div>
    </div>
</section>
