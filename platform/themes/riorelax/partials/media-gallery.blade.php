{{-- Reusable media gallery partial: images + videos + VR360 --}}
{{-- Usage: {!! Theme::partial('media-gallery', ['items' => $galleryItems, 'id' => 'unique-id']) !!} --}}
{{-- Each item: ['img' => 'url', 'description' => '...', 'type' => 'image|video|vr360'] --}}

@php
    $galleryId = $id ?? 'media-gallery-' . uniqid();
    $items = $items ?? [];
    $galleryImages = collect($items)->filter(fn($item) => Arr::get($item, 'type', 'image') === 'image');
    $galleryVideos = collect($items)->filter(fn($item) => Arr::get($item, 'type') === 'video');
    $galleryVr360s = collect($items)->filter(fn($item) => Arr::get($item, 'type') === 'vr360');
@endphp

@if (count($items))
<div class="media-gallery-section mt-30 mb-30">
    <div class="row" id="{{ $galleryId }}">
        {{-- Images --}}
        @foreach ($galleryImages as $image)
            @if (Arr::get($image, 'img'))
                <div class="col-12 col-md-4 mt-20"
                     data-src="{{ RvMedia::getImageUrl(Arr::get($image, 'img'), 'galleries') }}"
                     data-sub-html="{{ BaseHelper::clean(Arr::get($image, 'description')) }}">
                    <div class="photo-item">
                        <div class="thumb">
                            <a href="{{ RvMedia::getImageUrl(Arr::get($image, 'img'), 'galleries') }}">
                                <img src="{{ RvMedia::getImageUrl(Arr::get($image, 'img'), 'galleries') }}"
                                     alt="{{ BaseHelper::clean(Arr::get($image, 'description')) }}"
                                     loading="lazy" style="width:100%;border-radius:4px;">
                            </a>
                        </div>
                    </div>
                </div>
            @endif
        @endforeach

        {{-- Videos --}}
        @foreach ($galleryVideos as $video)
            @if (Arr::get($video, 'img'))
                @php
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
                @endphp

                <div class="col-12 col-md-4 mt-20">
                    @if ($isExternal)
                        {{-- YouTube / Vimeo: clickable thumbnail opens Bootstrap modal with iframe --}}
                        <a href="#" data-bs-toggle="modal" data-bs-target="#{{ $videoUniqueId }}Modal"
                           class="position-relative d-block overflow-hidden rounded"
                           style="aspect-ratio:16/9;background:#000;">
                            @if ($thumbUrl)
                                <img src="{{ $thumbUrl }}" alt="{{ $videoDesc }}"
                                     style="width:100%;height:100%;object-fit:cover;opacity:0.8;" loading="lazy">
                            @endif
                            <span class="position-absolute top-50 start-50 translate-middle"
                                  style="font-size:50px;color:#fff;text-shadow:0 2px 10px rgba(0,0,0,.7);">
                                <i class="fas fa-play-circle"></i>
                            </span>
                            <span class="position-absolute bottom-0 start-0 px-2 py-1 text-white"
                                  style="background:rgba(0,0,0,.6);font-size:11px;font-weight:700;">
                                <i class="fas fa-video me-1"></i> VIDEO
                            </span>
                        </a>

                        <div class="modal fade" id="{{ $videoUniqueId }}Modal" tabindex="-1"
                             aria-labelledby="{{ $videoUniqueId }}Label" aria-hidden="true"
                             data-video-src="{{ $embedUrl }}">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content" style="background:#000;">
                                    <div class="modal-header border-0 p-2">
                                        <button type="button" class="btn-close btn-close-white"
                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body p-0">
                                        <div style="position:relative;padding-bottom:56.25%;height:0;">
                                            {{-- src left empty on purpose — set by JS on open, cleared on close to stop audio --}}
                                            <iframe src="" frameborder="0"
                                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                    allowfullscreen
                                                    style="position:absolute;top:0;left:0;width:100%;height:100%;"></iframe>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @else
                        {{-- Local .mp4 / .webm: thumbnail + play icon, click opens modal (same style as YouTube) --}}
                        @php
                            $localThumb = Arr::get($video, 'thumb');
                            $localThumbUrl = $localThumb
                                ? (str_starts_with($localThumb, 'http') ? $localThumb : RvMedia::getImageUrl($localThumb))
                                : null;
                        @endphp
                        <a href="#" data-bs-toggle="modal" data-bs-target="#{{ $videoUniqueId }}Modal"
                           class="position-relative d-block overflow-hidden rounded"
                           style="aspect-ratio:16/9;background:#111;">
                            @if ($localThumbUrl)
                                <img src="{{ $localThumbUrl }}" alt="{{ $videoDesc }}"
                                     style="width:100%;height:100%;object-fit:cover;opacity:0.8;position:absolute;inset:0;" loading="lazy">
                            @endif
                            <span class="position-absolute top-50 start-50 translate-middle"
                                  style="font-size:50px;color:#fff;text-shadow:0 2px 10px rgba(0,0,0,.7);z-index:1;">
                                <i class="fas fa-play-circle"></i>
                            </span>
                            <span class="position-absolute bottom-0 start-0 px-2 py-1 text-white"
                                  style="background:rgba(0,0,0,.6);font-size:11px;font-weight:700;z-index:1;">
                                <i class="fas fa-video me-1"></i> VIDEO
                            </span>
                            @if ($videoDesc)
                                <span class="position-absolute bottom-0 end-0 px-2 py-1 text-white"
                                      style="background:rgba(0,0,0,.6);font-size:11px;z-index:1;">{{ $videoDesc }}</span>
                            @endif
                        </a>

                        <div class="modal fade" id="{{ $videoUniqueId }}Modal" tabindex="-1"
                             aria-labelledby="{{ $videoUniqueId }}Label" aria-hidden="true">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content" style="background:#000;">
                                    <div class="modal-header border-0 p-2">
                                        <button type="button" class="btn-close btn-close-white"
                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body p-0">
                                        <video controls preload="metadata"
                                               style="width:100%;display:block;max-height:70vh;">
                                            <source src="{{ $resolvedVideoUrl }}" type="video/mp4">
                                            <source src="{{ $resolvedVideoUrl }}" type="video/webm">
                                        </video>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif
                </div>
            @endif
        @endforeach

        {{-- VR360 --}}
        @foreach ($galleryVr360s as $vr)
            @if (Arr::get($vr, 'img'))
                @php
                    $vrLink = Arr::get($vr, 'img');
                    $vrThumb = Arr::get($vr, 'thumb');
                    // Priority: explicit thumb → fallback to img URL itself (works when img is a panorama .jpg)
                    if ($vrThumb) {
                        $vrPreviewUrl = str_starts_with($vrThumb, 'http') ? $vrThumb : RvMedia::getImageUrl($vrThumb);
                    } else {
                        $vrPreviewUrl = str_starts_with($vrLink, 'http') ? $vrLink : RvMedia::getImageUrl($vrLink);
                    }
                @endphp
                <div class="col-12 col-md-4 mt-20">
                    <a href="{{ $vrLink }}" target="_blank" rel="noopener noreferrer"
                       class="position-relative d-block overflow-hidden rounded"
                       style="aspect-ratio:16/9;background:#1a1a2e;">
                        {{-- Show preview image; onerror hides it if the URL is not a loadable image --}}
                        <img src="{{ $vrPreviewUrl }}"
                             alt="{{ Arr::get($vr, 'description', 'VR360') }}"
                             loading="lazy"
                             class="vr360-preview-img"
                             style="width:100%;height:100%;object-fit:cover;position:absolute;inset:0;opacity:0.75;"
                             onerror="this.style.display='none'">
                        <span class="position-absolute top-50 start-50 translate-middle text-center" style="pointer-events:none;z-index:1;">
                            <i class="fas fa-vr-cardboard" style="font-size:40px;color:#00d4ff;text-shadow:0 2px 8px rgba(0,0,0,.5);"></i>
                            <span class="d-block text-white mt-1" style="font-size:12px;font-weight:700;letter-spacing:1px;">VR360 — Click to open</span>
                        </span>
                        @if (Arr::get($vr, 'description'))
                            <span class="position-absolute bottom-0 start-0 px-2 py-1 text-white"
                                  style="background:rgba(0,0,0,.6);font-size:11px;z-index:1;">
                                {{ Arr::get($vr, 'description') }}
                            </span>
                        @endif
                    </a>
                </div>
            @endif
        @endforeach
    </div>
</div>

@if ($galleryVideos->isNotEmpty())
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
});
</script>
@endif
@endif
