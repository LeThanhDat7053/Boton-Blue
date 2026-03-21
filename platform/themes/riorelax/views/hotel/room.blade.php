@php
    Theme::asset()->container('footer')->usePath()->add('lightgallery-css', 'plugins/lightgallery/css/lightgallery.min.css');
    Theme::asset()->container('footer')->usePath()->add('lightgallery-js', 'plugins/lightgallery/js/lightgallery.min.js');

    Theme::set('pageTitle', $room->name);
    $nights = (int) $startDate->diffInDays($endDate);

    $roomGalleryItems = function_exists('gallery_meta_data') ? gallery_meta_data($room) : [];
    $roomGalleryVideos = collect($roomGalleryItems)->filter(fn($item) => Arr::get($item, 'type') === 'video');
    $roomGalleryVr360s = collect($roomGalleryItems)->filter(fn($item) => Arr::get($item, 'type') === 'vr360');
@endphp
<div class="about-area5 about-p p-relative room-details">
    <div class="container pt-60 pb-40">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-4 order-2">
                <aside class="sidebar services-sidebar">
                    @if (!empty($room->vr360_url))
                        <div class="sidebar-widget categories mb-20">
                            <div class="widget-content text-center">
                                <a href="{{ $room->vr360_url }}" target="_blank" rel="noopener noreferrer" class="btn ss-btn w-100" style="display:inline-flex;align-items:center;justify-content:center;gap:8px;text-decoration:none;">
                                    <i class="fal fa-vr-cardboard" style="line-height:1;"></i> <span style="text-decoration:none;">{{ __('View VR360') }}</span>
                                </a>
                            </div>
                        </div>
                    @endif
                    @if (HotelHelper::isBookingEnabled())
                        <div class="sidebar-widget categories">
                            <div class="widget-content">
                                <h2 class="widget-title"> {{ __('Booking form') }} </h2>
                                <div class="booking">
                                    <div class="contact-bg">
                                        {!! Theme::partial('hotel.forms.form', ['availableForBooking' => true, 'style' => 1, 'room' => $room]) !!}
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif
                    {!! dynamic_sidebar('room_sidebar') !!}
                </aside>
            </div>

            <div class="col-lg-8 col-md-12 col-sm-12 order-1">
                <div class="service-detail">
                    <div class="thumb">
                        <div class="room-details-slider">
                            @foreach ($room->images as $img)
                                <a href="{{ RvMedia::getImageUrl($img) }}">
                                    <img src="{{ RvMedia::getImageUrl($img, 'room-image') }}" alt="{{ $room->name }}">
                                </a>
                            @endforeach
                        </div>
                        <div class="room-details-slider-nav">
                            @foreach ($room->images as $img)
                                <img src="{{ RvMedia::getImageUrl($img, 'thumb') }}" alt="{{ $room->name }}">
                            @endforeach
                        </div>
                    </div>

                    @if ($roomGalleryVideos->isNotEmpty() || $roomGalleryVr360s->isNotEmpty())
                        @php
                            $videoAndVr360Items = $roomGalleryVideos->merge($roomGalleryVr360s)->values()->toArray();
                        @endphp
                        {!! Theme::partial('media-gallery', ['items' => $videoAndVr360Items, 'id' => 'room-gallery']) !!}
                    @endif
                    <div class="content-box">
                        <div class="row align-items-center mb-50">
                            <div class="col-12">
                                <div class="price">
                                    <h2>{{ $room->name }}</h2>
                                </div>
                            </div>
                        </div>

                        {!! BaseHelper::clean($room->content) !!}

                        @if ($room->amenities->isNotEmpty())
                            <div class="room-block-content shadow-block mt-50 amenities-list">
                                <h3>{{ __('Amenities') }}</h3>
                                <div class="row">
                                    @foreach ($room->amenities as $amenity)
                                        @php
                                            $image = $amenity->getMetaData('icon_image', true)
                                        @endphp

                                        <div class="col-xl-4 col-lg-6 col-12 d-flex align-items-center mb-3">
                                            @if ($image)
                                                <img width="20px" class="d-block" src="{{ RvMedia::getImageUrl($image) }}" alt="{{ $amenity->name }}">
                                            @elseif($amenity->icon)
                                                <x-core::icon :name="$amenity->icon"/>
                                            @endif
                                            <span class="ms-2">{{ $amenity->name }}</span>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        @endif

                        @if ($rules = theme_option('hotel_rules'))
                            <div class="room-block-content shadow-block">
                                <div class="hotel-rules-box">
                                    <h3>{{ __('Hotel Rules') }}</h3>
                                    {!! BaseHelper::clean($rules) !!}
                                </div>
                            </div>
                        @endif

                        @if ($cancellation = theme_option('cancellation'))
                            <div class="room-block-content shadow-block">
                                <h3>{{ __('Cancellation') }}</h3>
                                {!! BaseHelper::clean($cancellation) !!}
                            </div>
                        @endif


                        <div class="content-box related-room">
                            <h3>{{ __('Related Rooms') }}</h3>
                            <div class="row">
                                @foreach($relatedRooms as $room)
                                    <div class="col-lg-6 mb-20">
                                        {!! Theme::partial('rooms.item', compact('room', 'startDate', 'endDate', 'nights', 'adults')) !!}
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
