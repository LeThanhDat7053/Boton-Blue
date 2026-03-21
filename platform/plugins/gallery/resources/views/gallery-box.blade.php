{!! Form::hidden('gallery', $value ? json_encode($value) : null, [
    'id' => 'gallery-data',
    'class' => 'form-control',
]) !!}
<div>
    <div class="list-photos-gallery">
        <div
            class="row"
            id="list-photos-items"
        >
            @if (!empty($value))
                @foreach ($value as $key => $item)
                    @php
                        $itemType = Arr::get($item, 'type', 'image');
                        $imageUrl = Arr::get($item, 'img');
                        $description = Arr::get($item, 'description');
                        $thumbUrl = Arr::get($item, 'thumb');
                    @endphp
                    <div
                        class="col-md-2 col-sm-3 col-4 photo-gallery-item"
                        data-id="{{ $key }}"
                        data-img="{{ $imageUrl }}"
                        data-description="{{ $description }}"
                        data-type="{{ $itemType }}"
                        data-thumb="{{ $thumbUrl }}"
                    >
                        <div class="gallery_image_wrapper position-relative">
                            @if ($itemType === 'video')
                                @php
                                    $ytId = null;
                                    if (preg_match('/(?:youtube\.com\/(?:watch\?v=|embed\/|shorts\/)|youtu\.be\/)([a-zA-Z0-9_-]{11})/', $imageUrl, $ytMatch)) {
                                        $ytId = $ytMatch[1];
                                    }
                                @endphp
                                @if ($ytId)
                                    <img src="https://img.youtube.com/vi/{{ $ytId }}/hqdefault.jpg" alt="video" loading="lazy" style="width:100%;aspect-ratio:1;object-fit:cover;border-radius:4px;">
                                @elseif ($thumbUrl)
                                    <img src="{{ $thumbUrl }}" alt="video" loading="lazy" style="width:100%;aspect-ratio:1;object-fit:cover;border-radius:4px;">
                                @else
                                    <div style="width:100%;aspect-ratio:1;background:#1a1a2e;display:flex;align-items:center;justify-content:center;border-radius:4px;">
                                        <i class="fas fa-video" style="font-size:28px;color:#0d6efd;"></i>
                                    </div>
                                @endif
                                <span class="position-absolute top-0 start-0 badge bg-primary" style="font-size:9px;">VIDEO</span>
                            @elseif ($itemType === 'vr360')
                                @if ($thumbUrl)
                                    <img src="{{ RvMedia::getImageUrl($thumbUrl, 'thumb') }}" alt="vr360" loading="lazy" style="width:100%;aspect-ratio:1;object-fit:cover;border-radius:4px;">
                                @else
                                    <div style="width:100%;aspect-ratio:1;background:#1a1a2e;display:flex;align-items:center;justify-content:center;border-radius:4px;">
                                        <i class="fas fa-vr-cardboard" style="font-size:28px;color:#00d4ff;"></i>
                                    </div>
                                @endif
                                <span class="position-absolute top-0 start-0 badge bg-info" style="font-size:9px;">VR360</span>
                            @else
                                {{ RvMedia::image($imageUrl, $description, 'thumb') }}
                            @endif
                        </div>
                    </div>
                @endforeach
            @endif
        </div>
    </div>
    <div class="d-flex gap-2 flex-wrap align-items-center">
        <button type="button" class="btn-link border-0 bg-transparent p-0 btn_select_gallery" style="cursor:pointer;">{{ trans('plugins/gallery::gallery.select_image') }}</button>
        <button type="button" class="btn-link border-0 bg-transparent p-0 btn_add_video" style="cursor:pointer;"
                data-bs-toggle="modal" data-bs-target="#add-media-url-modal" data-media-type="video"
        ><i class="fas fa-video me-1"></i> {{ __('Add Video URL') }}</button>
        <button type="button" class="btn-link border-0 bg-transparent p-0 btn_add_vr360" style="cursor:pointer;"
                data-bs-toggle="modal" data-bs-target="#add-media-url-modal" data-media-type="vr360"
        ><i class="fas fa-vr-cardboard me-1"></i> {{ __('Add VR360 URL') }}</button>
        <button type="button" class="text-danger border-0 bg-transparent p-0 reset-gallery @if (empty($value)) hidden @endif" style="cursor:pointer;">{{ trans('plugins/gallery::gallery.reset') }}</button>
    </div>
</div>

<x-core::modal
    id="add-media-url-modal"
    :title="__('Add Media URL')"
>
    <div class="mb-3">
        <label class="form-label fw-bold">{{ __('URL') }}</label>
        <input type="text" class="form-control" id="media-url-input" placeholder="https://">
        <small class="form-text text-muted" id="media-url-hint"></small>
    </div>
    <div class="mb-3 media-thumb-row" style="display:none;">
        <label class="form-label fw-bold">{{ __('Thumbnail image (optional)') }}</label>
        <div class="d-flex gap-2 align-items-center">
            <input type="text" class="form-control" id="media-thumb-input" placeholder="{{ __('Select or paste image URL') }}" readonly>
            <button type="button" class="btn btn-secondary btn-sm flex-shrink-0 btn_pick_vr360_thumb">{{ __('Select') }}</button>
            <button type="button" class="btn btn-outline-danger btn-sm flex-shrink-0 btn_clear_vr360_thumb" style="display:none;">✕</button>
        </div>
        <div id="vr360-thumb-preview" style="display:none;margin-top:8px;">
            <img src="" alt="thumbnail" style="max-height:80px;border-radius:4px;border:1px solid #ddd;">
        </div>
    </div>
    <div class="mb-3">
        <label class="form-label fw-bold">{{ __('Description (optional)') }}</label>
        <input type="text" class="form-control" id="media-description-input" placeholder="{{ __('Description') }}">
    </div>
    <input type="hidden" id="media-type-input" value="video">

    <x-slot:footer>
        <div class="btn-list">
            <x-core::button
                type="button"
                data-bs-dismiss="modal"
            >
                {{ trans('core/base::forms.cancel') }}
            </x-core::button>
            <x-core::button
                type="button"
                color="primary"
                id="confirm-add-media-url"
            >
                {{ __('Add') }}
            </x-core::button>
        </div>
    </x-slot:footer>
</x-core::modal>

<x-core::modal
    id="edit-gallery-item"
    :title="trans('plugins/gallery::gallery.update_photo_description')"
>
    <input type="hidden" id="gallery-item-type" value="image">

    <div class="mb-3">
        <label class="form-label fw-bold">{{ __('URL') }}</label>
        <input
            type="text"
            class="form-control"
            id="gallery-item-url"
            placeholder="{{ __('URL (for video/VR360)') }}"
            readonly
        >
    </div>

    <div class="mb-3 edit-media-thumb-row" style="display:none;">
        <label class="form-label fw-bold">{{ __('Thumbnail image (optional)') }}</label>
        <div class="d-flex gap-2 align-items-center">
            <input type="text" class="form-control" id="edit-thumb-input" placeholder="{{ __('Select or paste image URL') }}" readonly>
            <button type="button" class="btn btn-secondary btn-sm flex-shrink-0 btn_pick_edit_thumb">{{ __('Select') }}</button>
            <button type="button" class="btn btn-outline-danger btn-sm flex-shrink-0 btn_clear_edit_thumb" style="display:none;">✕</button>
        </div>
        <div id="edit-thumb-preview" style="display:none;margin-top:8px;">
            <img src="" alt="thumbnail" style="max-height:80px;border-radius:4px;border:1px solid #ddd;">
        </div>
    </div>

    <div class="mb-3">
        <label class="form-label fw-bold">{{ trans('plugins/gallery::gallery.update_photo_description_placeholder') }}</label>
        <input
            type="text"
            class="form-control"
            id="gallery-item-description"
            placeholder="{{ trans('plugins/gallery::gallery.update_photo_description_placeholder') }}"
        >
    </div>

    <x-slot:footer>
        <div class="btn-list">
            <x-core::button
                type="button"
                color="danger"
                id="delete-gallery-item"
            >
                {{ trans('plugins/gallery::gallery.delete_photo') }}
            </x-core::button>
            <x-core::button
                type="button"
                data-bs-dismiss="modal"
            >
                {{ trans('core/base::forms.cancel') }}
            </x-core::button>
            <x-core::button
                type="button"
                color="primary"
                id="update-gallery-item"
            >
                {{ trans('core/base::forms.update') }}
            </x-core::button>
        </div>
    </x-slot:footer>
</x-core::modal>


