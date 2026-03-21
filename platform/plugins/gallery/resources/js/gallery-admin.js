'use strict'

$(() => {
    // rvMedia options for Select Image  initialized lazily on click to avoid startup errors
    var rvMediaOptions = {
        view_in: 'all_media',
        onSelectFiles: function (files) {
            var last_index = getLastIndex()
            $.each(files, function (index, file) {
                var type = 'image'
                var imgUrl = file.url
                var thumbUrl = file.thumb

                // Detect locally-uploaded video files by mime_type
                if (file.mime_type && file.mime_type.indexOf('video/') === 0) {
                    type = 'video'
                    imgUrl = file.full_url || file.url
                    thumbUrl = null
                }

                $('.list-photos-gallery .row').append(
                    buildGalleryItem(last_index + index, imgUrl, '', type, thumbUrl)
                )
            })
            initSortable()
            updateItems()
            $('.reset-gallery').removeClass('hidden')
        },
    }

    // Select Image  lazy-initialize rvMedia on click
    $(document).on('click', '.btn_select_gallery', function (e) {
        e.preventDefault()
        if (typeof $.fn.rvMedia === 'function') {
            $(this).rvMedia(rvMediaOptions)
        }
    })

    // Video/VR360 modal  set type and placeholder when Bootstrap 5 modal opens
    $(document).on('show.bs.modal', '#add-media-url-modal', function (e) {
        var type = e.relatedTarget ? $(e.relatedTarget).data('media-type') : ($('#media-type-input').val() || 'video')
        type = type || 'video'
        $('#media-type-input').val(type)
        if (type === 'vr360') {
            $('#media-url-input').attr('placeholder', 'https://... (VR360 panorama URL)')
            $('#media-url-hint').text('Paste the full link to your VR360 / 360° panorama page')
            $('.media-thumb-row').show()
        } else {
            $('#media-url-input').attr('placeholder', 'https://www.youtube.com/watch?v=... or .mp4 URL')
            $('#media-url-hint').text('Supported: YouTube, Vimeo, direct .mp4 URL')
            $('.media-thumb-row').show()
        }
        $('#media-url-input').val('')
        $('#media-description-input').val('')
        $('#media-thumb-input').val('')
        $('#vr360-thumb-preview').hide().find('img').attr('src', '')
        $('.btn_clear_vr360_thumb').hide()
    })

    // Thumbnail image picker for VR360 (add modal)
    $(document).on('click', '.btn_pick_vr360_thumb', function (e) {
        e.preventDefault()
        if (typeof $.fn.rvMedia !== 'function') return
        var $btn = $(this)
        if (!$btn.data('rv-init')) {
            $btn.data('rv-init', true)
            $btn.rvMedia({
                filter: 'image',
                view_in: 'all_media',
                onSelectFiles: function (files) {
                    if (files && files.length > 0) {
                        var f = files[0]
                        var displayUrl = f.full_url || f.thumb || f.url
                        $('#media-thumb-input').val(displayUrl)
                        $('#vr360-thumb-preview').show().find('img').attr('src', displayUrl)
                        $('.btn_clear_vr360_thumb').show()
                    }
                },
            })
            $btn.trigger('click')
        }
    })

    $(document).on('click', '.btn_clear_vr360_thumb', function () {
        $('#media-thumb-input').val('')
        $('#vr360-thumb-preview').hide().find('img').attr('src', '')
        $(this).hide()
    })

    // Confirm: add video or VR360 URL directly to gallery JSON (no server upload)
    $(document).on('click', '#confirm-add-media-url', function () {
        var url = $('#media-url-input').val().trim()
        if (!url) return

        var type = $('#media-type-input').val()
        var description = $('#media-description-input').val().trim()
        var thumbUrl = (type === 'vr360' || type === 'video') ? $('#media-thumb-input').val().trim() : null
        var last_index = getLastIndex()

        $('.list-photos-gallery .row').append(
            buildGalleryItem(last_index, url, description, type, thumbUrl)
        )
        initSortable()
        updateItems()
        $('.reset-gallery').removeClass('hidden')

        // Close modal  Bootstrap 5 native API
        var modalEl = document.getElementById('add-media-url-modal')
        if (modalEl && typeof bootstrap !== 'undefined') {
            var bsModal = bootstrap.Modal.getInstance(modalEl)
            if (bsModal) bsModal.hide()
        }
    })

    function getLastIndex() {
        var lastItem = $('.list-photos-gallery .photo-gallery-item:last-child')
        return lastItem.length ? lastItem.data('id') + 1 : 0
    }

    function buildGalleryItem(id, url, description, type, thumbUrl) {
        var inner = ''
        if (type === 'video') {
            var ytMatch = url.match(/(?:youtube\.com\/(?:watch\?v=|embed\/|shorts\/)|youtu\.be\/)([a-zA-Z0-9_-]{11})/)
            if (ytMatch) {
                inner = '<img src="https://img.youtube.com/vi/' + ytMatch[1] + '/hqdefault.jpg" alt="video" loading="lazy" style="width:100%;aspect-ratio:1;object-fit:cover;border-radius:4px;">'
            } else if (thumbUrl) {
                inner = '<img src="' + thumbUrl + '" alt="video" loading="lazy" style="width:100%;aspect-ratio:1;object-fit:cover;border-radius:4px;">'
            } else {
                inner = '<div style="width:100%;aspect-ratio:1;background:#1a1a2e;display:flex;align-items:center;justify-content:center;border-radius:4px;"><i class="fas fa-video" style="font-size:28px;color:#0d6efd;"></i></div>'
            }
            inner += '<span class="position-absolute top-0 start-0 badge bg-primary" style="font-size:9px;">VIDEO</span>'
        } else if (type === 'vr360') {
            if (thumbUrl) {
                inner = '<img src="' + thumbUrl + '" alt="vr360" loading="lazy" style="width:100%;aspect-ratio:1;object-fit:cover;border-radius:4px;">'
            } else {
                inner = '<div style="width:100%;aspect-ratio:1;background:#1a1a2e;display:flex;align-items:center;justify-content:center;border-radius:4px;"><i class="fas fa-vr-cardboard" style="font-size:28px;color:#00d4ff;"></i></div>'
            }
            inner += '<span class="position-absolute top-0 start-0 badge bg-info" style="font-size:9px;">VR360</span>'
        } else {
            var src = thumbUrl || url
            inner = '<img src="' + src + '" alt="image" loading="lazy"/>'
        }

        return '<div class="col-md-2 col-sm-3 col-4 photo-gallery-item" data-id="' + id +
            '" data-img="' + url +
            '" data-description="' + (description || '') +
            '" data-type="' + type +
            '" data-thumb="' + (thumbUrl || '') +
            '"><div class="gallery_image_wrapper position-relative">' + inner + '</div></div>'
    }

    let initSortable = function () {
        let el = document.getElementById('list-photos-items')
        if (el) {
            Sortable.create(el, {
                group: 'galleries',
                sort: true,
                delay: 0,
                disabled: false,
                store: null,
                animation: 150,
                handle: '.photo-gallery-item',
                ghostClass: 'sortable-ghost',
                chosenClass: 'sortable-chosen',
                dataIdAttr: 'data-id',
                forceFallback: false,
                fallbackClass: 'sortable-fallback',
                fallbackOnBody: false,
                scroll: true,
                scrollSensitivity: 30,
                scrollSpeed: 10,
                onEnd: () => { updateItems() },
            })
        }
    }

    initSortable()

    let updateItems = function () {
        let items = []
        $.each($('.photo-gallery-item'), (index, widget) => {
            let item = {
                img: $(widget).data('img'),
                description: $(widget).data('description'),
                type: $(widget).data('type') || 'image'
            }
            let thumb = $(widget).data('thumb')
            if (thumb) item.thumb = thumb
            items.push(item)
        })
        $('#gallery-data').val(JSON.stringify(items))
    }

    let $listPhotos = $('.list-photos-gallery')
    let $editGalleryItem = $('#edit-gallery-item')

    $(document).on('click', '.reset-gallery', function (event) {
        event.preventDefault()
        $('.list-photos-gallery .photo-gallery-item').remove()
        updateItems()
        $(this).addClass('hidden')
    })

    $listPhotos.on('click', '.photo-gallery-item', function () {
        let id = $(this).data('id')
        let type = $(this).data('type') || 'image'
        let thumb = $(this).data('thumb') || ''
        $('#delete-gallery-item').data('id', id)
        $('#update-gallery-item').data('id', id)
        $('#gallery-item-description').val($(this).data('description'))
        $('#gallery-item-type').val(type)
        $('#gallery-item-url').val($(this).data('img'))

        // Show/hide thumbnail row in edit modal (video + vr360)
        if (type === 'vr360' || type === 'video') {
            $('.edit-media-thumb-row').show()
            $('#edit-thumb-input').val(thumb)
            if (thumb) {
                $('#edit-thumb-preview').show().find('img').attr('src', thumb)
                $('.btn_clear_edit_thumb').show()
            } else {
                $('#edit-thumb-preview').hide().find('img').attr('src', '')
                $('.btn_clear_edit_thumb').hide()
            }
        } else {
            $('.edit-media-thumb-row').hide()
        }

        if (typeof bootstrap !== 'undefined') {
            new bootstrap.Modal($editGalleryItem[0]).show()
        }
    })

    $editGalleryItem.on('click', '#delete-gallery-item', function (event) {
        event.preventDefault()
        if (typeof bootstrap !== 'undefined') {
            var bsModal = bootstrap.Modal.getInstance($editGalleryItem[0])
            if (bsModal) bsModal.hide()
        }
        $listPhotos.find('.photo-gallery-item[data-id=' + $(this).data('id') + ']').remove()
        updateItems()
        if ($listPhotos.find('.photo-gallery-item').length === 0) {
            $('.reset-gallery').addClass('hidden')
        }
    })

    // Thumbnail picker for edit modal
    $(document).on('click', '.btn_pick_edit_thumb', function (e) {
        e.preventDefault()
        if (typeof $.fn.rvMedia !== 'function') return
        var $btn = $(this)
        if (!$btn.data('rv-init')) {
            $btn.data('rv-init', true)
            $btn.rvMedia({
                filter: 'image',
                view_in: 'all_media',
                onSelectFiles: function (files) {
                    if (files && files.length > 0) {
                        var f = files[0]
                        var displayUrl = f.full_url || f.thumb || f.url
                        $('#edit-thumb-input').val(displayUrl)
                        $('#edit-thumb-preview').show().find('img').attr('src', displayUrl)
                        $('.btn_clear_edit_thumb').show()
                        // Live-update gallery item preview immediately
                        var currentId = $('#update-gallery-item').data('id')
                        var currentType = $('#gallery-item-type').val()
                        if (currentId !== undefined) {
                            var badge = currentType === 'video'
                                ? '<span class="position-absolute top-0 start-0 badge bg-primary" style="font-size:9px;">VIDEO</span>'
                                : '<span class="position-absolute top-0 start-0 badge bg-info" style="font-size:9px;">VR360</span>'
                            $listPhotos.find('.photo-gallery-item[data-id=' + currentId + '] .gallery_image_wrapper').html(
                                '<img src="' + displayUrl + '" alt="' + currentType + '" loading="lazy" style="width:100%;aspect-ratio:1;object-fit:cover;border-radius:4px;">' +
                                badge
                            )
                        }
                    }
                },
            })
            $btn.trigger('click')
        }
    })

    $(document).on('click', '.btn_clear_edit_thumb', function () {
        $('#edit-thumb-input').val('')
        $('#edit-thumb-preview').hide().find('img').attr('src', '')
        $(this).hide()
        // Live-revert gallery item preview to icon
        var currentId = $('#update-gallery-item').data('id')
        var currentType = $('#gallery-item-type').val()
        if (currentId !== undefined) {
            var placeholder = currentType === 'video'
                ? '<div style="width:100%;aspect-ratio:1;background:#1a1a2e;display:flex;align-items:center;justify-content:center;border-radius:4px;"><i class="fas fa-video" style="font-size:28px;color:#0d6efd;"></i></div>' +
                  '<span class="position-absolute top-0 start-0 badge bg-primary" style="font-size:9px;">VIDEO</span>'
                : '<div style="width:100%;aspect-ratio:1;background:#1a1a2e;display:flex;align-items:center;justify-content:center;border-radius:4px;"><i class="fas fa-vr-cardboard" style="font-size:28px;color:#00d4ff;"></i></div>' +
                  '<span class="position-absolute top-0 start-0 badge bg-info" style="font-size:9px;">VR360</span>'
            $listPhotos.find('.photo-gallery-item[data-id=' + currentId + '] .gallery_image_wrapper').html(placeholder)
        }
    })

    $editGalleryItem.on('click', '#update-gallery-item', function (event) {
        event.preventDefault()
        if (typeof bootstrap !== 'undefined') {
            var bsModal = bootstrap.Modal.getInstance($editGalleryItem[0])
            if (bsModal) bsModal.hide()
        }
        var id = $(this).data('id')
        var $item = $listPhotos.find('.photo-gallery-item[data-id=' + id + ']')
        $item.data('description', $('#gallery-item-description').val())
        $item.attr('data-description', $('#gallery-item-description').val())
        var type = $('#gallery-item-type').val()
        $item.data('type', type)
        $item.attr('data-type', type)
        if (type === 'vr360' || type === 'video') {
            var newThumb = $('#edit-thumb-input').val().trim()
            $item.data('thumb', newThumb)
            $item.attr('data-thumb', newThumb)
            // Update admin preview visual
            var $wrapper = $item.find('.gallery_image_wrapper')
            if (newThumb) {
                var badge2 = type === 'video'
                    ? '<span class="position-absolute top-0 start-0 badge bg-primary" style="font-size:9px;">VIDEO</span>'
                    : '<span class="position-absolute top-0 start-0 badge bg-info" style="font-size:9px;">VR360</span>'
                $wrapper.html('<img src="' + newThumb + '" alt="' + type + '" loading="lazy" style="width:100%;aspect-ratio:1;object-fit:cover;border-radius:4px;">' + badge2)
            } else {
                var placeholder2 = type === 'video'
                    ? '<div style="width:100%;aspect-ratio:1;background:#1a1a2e;display:flex;align-items:center;justify-content:center;border-radius:4px;"><i class="fas fa-video" style="font-size:28px;color:#0d6efd;"></i></div>' +
                      '<span class="position-absolute top-0 start-0 badge bg-primary" style="font-size:9px;">VIDEO</span>'
                    : '<div style="width:100%;aspect-ratio:1;background:#1a1a2e;display:flex;align-items:center;justify-content:center;border-radius:4px;"><i class="fas fa-vr-cardboard" style="font-size:28px;color:#00d4ff;"></i></div>' +
                      '<span class="position-absolute top-0 start-0 badge bg-info" style="font-size:9px;">VR360</span>'
                $wrapper.html(placeholder2)
            }
        }
        updateItems()
    })
})
