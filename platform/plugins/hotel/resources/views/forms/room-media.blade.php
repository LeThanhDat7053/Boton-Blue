<div class="room-media-gallery-wrapper">
    <div id="room-media-items">
        @if (isset($mediaItems) && $mediaItems->count())
            @foreach ($mediaItems as $index => $item)
                <div class="room-media-item card mb-3" data-index="{{ $index }}">
                    <div class="card-body p-3">
                        <div class="row align-items-center">
                            <div class="col-md-2">
                                <select name="media_items[{{ $index }}][type]" class="form-control form-select media-type-select">
                                    <option value="image" @if($item->type === 'image') selected @endif>{{ __('Image') }}</option>
                                    <option value="video" @if($item->type === 'video') selected @endif>{{ __('Video') }}</option>
                                    <option value="vr360" @if($item->type === 'vr360') selected @endif>{{ __('VR360') }}</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input type="text" name="media_items[{{ $index }}][url]" class="form-control media-url-input" value="{{ $item->url }}" placeholder="{{ __('URL or select from media') }}">
                                    <button type="button" class="btn btn-outline-secondary btn-media-browse" data-target="media-url" title="{{ __('Browse') }}">
                                        <i class="fas fa-cloud-upload-alt"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input type="text" name="media_items[{{ $index }}][thumbnail]" class="form-control media-thumbnail-input" value="{{ $item->thumbnail }}" placeholder="{{ __('Thumbnail (optional)') }}">
                                    <button type="button" class="btn btn-outline-secondary btn-media-browse" data-target="media-thumbnail" title="{{ __('Browse') }}">
                                        <i class="fas fa-image"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-1 text-center">
                                @if ($item->type === 'image' && $item->url)
                                    <img src="{{ RvMedia::getImageUrl($item->url, 'thumb') }}" class="media-preview-thumb" style="max-height:40px;max-width:60px;border-radius:4px;">
                                @elseif ($item->type === 'video')
                                    <i class="fas fa-video text-primary" style="font-size:24px;"></i>
                                @else
                                    <i class="fas fa-vr-cardboard text-info" style="font-size:24px;"></i>
                                @endif
                            </div>
                            <div class="col-md-1 text-end">
                                <button type="button" class="btn btn-sm btn-danger btn-remove-media-item" title="{{ __('Remove') }}">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        @endif
    </div>

    <div class="mt-3">
        <button type="button" class="btn btn-sm btn-primary" id="btn-add-media-item">
            <i class="fas fa-plus me-1"></i> {{ __('Add Media') }}
        </button>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var mediaIndex = {{ isset($mediaItems) ? $mediaItems->count() : 0 }};
        var container = document.getElementById('room-media-items');

        document.getElementById('btn-add-media-item').addEventListener('click', function () {
            var html = `
                <div class="room-media-item card mb-3" data-index="${mediaIndex}">
                    <div class="card-body p-3">
                        <div class="row align-items-center">
                            <div class="col-md-2">
                                <select name="media_items[${mediaIndex}][type]" class="form-control form-select media-type-select">
                                    <option value="image">{{ __('Image') }}</option>
                                    <option value="video">{{ __('Video') }}</option>
                                    <option value="vr360">{{ __('VR360') }}</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input type="text" name="media_items[${mediaIndex}][url]" class="form-control media-url-input" placeholder="{{ __('URL or select from media') }}">
                                    <button type="button" class="btn btn-outline-secondary btn-media-browse" data-target="media-url" title="{{ __('Browse') }}">
                                        <i class="fas fa-cloud-upload-alt"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input type="text" name="media_items[${mediaIndex}][thumbnail]" class="form-control media-thumbnail-input" placeholder="{{ __('Thumbnail (optional)') }}">
                                    <button type="button" class="btn btn-outline-secondary btn-media-browse" data-target="media-thumbnail" title="{{ __('Browse') }}">
                                        <i class="fas fa-image"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-1 text-center">
                                <i class="fas fa-photo-video text-muted" style="font-size:24px;"></i>
                            </div>
                            <div class="col-md-1 text-end">
                                <button type="button" class="btn btn-sm btn-danger btn-remove-media-item" title="{{ __('Remove') }}">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            `;
            container.insertAdjacentHTML('beforeend', html);
            mediaIndex++;
        });

        container.addEventListener('click', function (e) {
            var removeBtn = e.target.closest('.btn-remove-media-item');
            if (removeBtn) {
                removeBtn.closest('.room-media-item').remove();
            }

            var browseBtn = e.target.closest('.btn-media-browse');
            if (browseBtn) {
                var target = browseBtn.getAttribute('data-target');
                var row = browseBtn.closest('.room-media-item');
                var inputEl;
                if (target === 'media-url') {
                    inputEl = row.querySelector('.media-url-input');
                } else {
                    inputEl = row.querySelector('.media-thumbnail-input');
                }

                if (typeof RV_MEDIA_CONFIG !== 'undefined') {
                    var $el = $(browseBtn);
                    new RvMediaStandalone(target + '-' + row.dataset.index, {
                        filter: 'everything',
                        view_in: 'all_media',
                        onSelectFiles: function (files) {
                            if (files && files.length > 0) {
                                inputEl.value = files[0].url;
                            }
                        }
                    }).open();
                }
            }
        });
    });
</script>
