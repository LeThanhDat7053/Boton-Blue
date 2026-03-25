@php
    $isBlogListing = Theme::get('isBlogListingPage', false);
    $pinnedPost = null;
    $heroLeftPosts = collect();
    $heroRightPosts = collect();
    $rowPosts = collect();
    $bottomLeftPosts = collect();
    $popularPosts = collect();

    if ($isBlogListing && $posts->isNotEmpty()) {
        try {
            $pinnedPost = \Botble\Blog\Models\Post::query()
                ->wherePublished()
                ->where('is_pinned', 1)
                ->with(['slugable'])
                ->first();
        } catch (\Exception $e) {
            $pinnedPost = null;
        }

        // Fallback: if no pinned post, use the newest post
        if (!$pinnedPost) {
            $pinnedPost = \Botble\Blog\Models\Post::query()
                ->wherePublished()
                ->with(['slugable'])
                ->orderByDesc('created_at')
                ->first();
        }

        if ($pinnedPost) {
            // Get ALL published posts except pinned, ordered by newest
            $allPosts = \Botble\Blog\Models\Post::query()
                ->wherePublished()
                ->where('id', '!=', $pinnedPost->id)
                ->with(['slugable'])
                ->orderByDesc('created_at')
                ->get();

            $heroLeftPosts = $allPosts->take(2);
            $heroRightPosts = $allPosts->skip(2)->take(5);
            $rowPosts = $allPosts->skip(7)->take(5);
            $bottomLeftPosts = $allPosts->skip(12)->values();
            $popularPosts = get_popular_posts(5);
        }
    }
@endphp

@if ($posts->isNotEmpty())
    @if ($pinnedPost)
        {{-- Hero Grid Section --}}
        {!! Theme::partial('blog.hero-grid', compact('pinnedPost', 'heroLeftPosts', 'heroRightPosts')) !!}

        {{-- 5-post horizontal row (posts 8-12) --}}
        @if ($rowPosts->isNotEmpty())
            {!! Theme::partial('blog.row-posts', ['posts' => $rowPosts]) !!}
        @endif

        {{-- 2-column: left recent + right popular, with load more --}}
        @if ($bottomLeftPosts->isNotEmpty() || $popularPosts->isNotEmpty())
            {!! Theme::partial('blog.two-col-section', compact('bottomLeftPosts', 'popularPosts')) !!}
        @endif
    @else
        {!! Theme::partial('blog.posts', compact('posts')) !!}
    @endif
@else
    <h1 class="text-center">{{ __('Ops! No results found') }}</h1>
    <p class="text-center">
        {{ __('We couldn’t find what you searched for. Try searching again or') }}
        <a class="link-primary custom-link" href="{{ route('public.single', 'blog') }}">{{ __('Back here') }}</a>
    </p>
@endif
