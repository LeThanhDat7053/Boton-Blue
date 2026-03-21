<?php
    if (App::getLocale() !== 'en') {
        Theme::asset()
            ->container('footer')
            ->usePath(false)
            ->add('bootstrap-datepicker-locale', sprintf('//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/locales/bootstrap-datepicker.%s.min.js', App::getLocale()), ['datepicker-js']);
    }
?>

<?php if(is_plugin_active('hotel')): ?>
    <?php
        $minimumNumberOfGuests = HotelHelper::getMinimumNumberOfGuests();
        $maximumNumberOfGuests = HotelHelper::getMaximumNumberOfGuests();
        $startDate = request()->query('start_date', Carbon\Carbon::now()->format(HotelHelper::getDateFormat()));
        $endDate = request()->query('end_date', Carbon\Carbon::now()->addDay()->format(HotelHelper::getDateFormat()));
        $adults = request()->query('adults', $minimumNumberOfGuests);
    ?>

    <form action="<?php echo e($availableForBooking ? route('public.booking') : route('public.rooms')); ?>" method="<?php echo e($availableForBooking ? 'POST' : 'GET'); ?>" class="contact-form mt-30 form-booking" <?php if(!empty($room) && $room->external_rate_id): ?> data-rate-id="<?php echo e($room->external_rate_id); ?>" <?php endif; ?>>
        <?php if($availableForBooking): ?>
            <?php echo csrf_field(); ?>
            <input type="hidden" name="room_id" value="<?php echo e($room->id); ?>">
        <?php endif; ?>

        <?php switch($style):
            case (2): ?>
                <div class="row align-items-center">
                    <?php if(! empty($title)): ?>
                        <div class="col-lg-12">
                            <div class="section-title center-align mb-30">
                                <h2><?php echo BaseHelper::clean($title); ?></h2>
                            </div>
                        </div>
                    <?php endif; ?>
                    <div class="col-lg-2 col-md-6 mb-30">
                        <div class="contact-field p-relative c-name">
                            <label for="availability-form-start-date"><i class="fal fa-badge-check"></i><?php echo e(__('Check In Date')); ?></label>
                            <input
                                id="availability-form-start-date"
                                autocomplete="off"
                                type="text"
                                class="departure-date date-picker"
                                data-date-format="<?php echo e(HotelHelper::getBookingFormDateFormat()); ?>"
                                placeholder="<?php echo e(Carbon\Carbon::now()->format(HotelHelper::getDateFormat())); ?>"
                                data-locale="<?php echo e(App::getLocale()); ?>"
                                value="<?php echo e(BaseHelper::stringify($availableForBooking ? old('start_date', $startDate) : $startDate)); ?>"
                                name="start_date"
                            >
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 mb-30">
                        <div class="contact-field p-relative c-name">
                            <label for="availability-form-end-date"><i class="fal fa-times-octagon"></i><?php echo e(__('Check Out Date')); ?></label>
                            <input
                                type="text"
                                id="availability-form-end-date"
                                autocomplete="off"
                                class="arrival-date date-picker"
                                data-date-format="<?php echo e(HotelHelper::getBookingFormDateFormat()); ?>"
                                placeholder="<?php echo e(Carbon\Carbon::now()->addDay()->format(HotelHelper::getDateFormat())); ?>"
                                data-locale="<?php echo e(App::getLocale()); ?>"
                                value="<?php echo e(BaseHelper::clean($availableForBooking ? old('end_date', $endDate) : $endDate)); ?>"
                                name="end_date"
                            >
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-6 mb-30">
                        <div class="contact-field p-relative c-name form-guests-and-rooms-wrapper">
                            <label for="adults"><i class="fal fa-users"></i><?php echo e(__('Guests and Rooms')); ?></label>
                            <button data-bb-toggle="toggle-guests-and-rooms" class="text-truncate" type="button" data-target="#toggle-guests-and-rooms">
                                <span data-bb-toggle="filter-adults-count" class="me-1">1</span> <?php echo e(__('Adult(s)')); ?> ,
                                <span data-bb-toggle="filter-children-count" class="ms-1 me-1">0</span> <?php echo e(__('Child(ren)')); ?>,
                                <span data-bb-toggle="filter-rooms-count" class="me-1 ms-1">1</span> <?php echo e(__('Room(s)')); ?>

                            </button>

                            <div class="custom-dropdown dropdown-menu p-3" id="toggle-guests-and-rooms">
                                <div class="inputs-filed">
                                    <label for="adults"><?php echo e(__('Adults')); ?></label>
                                    <div class="input-quantity">
                                        <button type="button" class="main-btn btn" data-bb-toggle="decrement-room">-</button>
                                        <input type="number" id="adults" name="adults" readonly value="1" min="<?php echo e(HotelHelper::getMinimumNumberOfGuests()); ?>" max="<?php echo e(HotelHelper::getMaximumNumberOfGuests()); ?>">
                                        <button type="button" class="main-btn btn" data-bb-toggle="increment-room">+</button>
                                    </div>
                                </div>
                                <div class="inputs-filed mt-30">
                                    <label for="children"><?php echo e(__('Children')); ?></label>
                                    <div class="input-quantity">
                                        <button type="button" class="main-btn btn" data-bb-toggle="decrement-room">-</button>
                                        <input type="number" id="children" name="children" readonly value="0" min="0" max="<?php echo e(HotelHelper::getMaximumNumberOfGuests()); ?>">
                                        <button type="button" class="main-btn btn" data-bb-toggle="increment-room">+</button>
                                    </div>
                                </div>
                                <div class="inputs-filed mt-30">
                                    <label for="rooms"><?php echo e(__('Rooms')); ?></label>
                                    <div class="input-quantity">
                                        <button type="button" class="main-btn btn" data-bb-toggle="decrement-room">-</button>
                                        <input type="number" id="rooms" name="rooms" readonly value="1" min="1" max="<?php echo e(10); ?>">
                                        <button type="button" class="main-btn btn" data-bb-toggle="increment-room">+</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="slider-btn">
                            <button type="submit" class="btn ss-btn" data-animation="fadeInRight" data-delay=".8s">
                                <?php echo e($availableForBooking ? __('Book Now') : __('Check Availability')); ?>

                            </button>
                        </div>
                    </div>
                </div>
                <?php break; ?>
            <?php default: ?>
                <div class="row booking-area">
                    <?php if(! empty($title)): ?>
                        <div class="col-lg-12">
                            <div class="section-title center-align mb-30">
                                <h2><?php echo BaseHelper::clean($title); ?></h2>
                            </div>
                        </div>
                    <?php endif; ?>
                    <div class="col-lg-12">
                        <div class="contact-field p-relative c-name mb-20">
                            <label for="room-detail-booking-form-start-date"><i class="fal fa-badge-check"></i><?php echo e(__('Check In Date')); ?></label>
                            <input
                                type="text"
                                id="room-detail-booking-form-start-date"
                                class="departure-date date-picker"
                                autocomplete="off"
                                data-date-format="<?php echo e(HotelHelper::getBookingFormDateFormat()); ?>"
                                placeholder="<?php echo e(Carbon\Carbon::now()->format(HotelHelper::getDateFormat())); ?>"
                                data-locale="<?php echo e(App::getLocale()); ?>"
                                value="<?php echo e(BaseHelper::stringify($startDate ?: old('start_date', $startDate))); ?>"
                                name="start_date"
                            >
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="contact-field p-relative c-subject mb-20">
                            <label for="room-detail-booking-form-end-date"><i class="fal fa-times-octagon"></i><?php echo e(__('Check Out Date')); ?></label>
                            <input
                                type="text"
                                id="room-detail-booking-form-end-date"
                                class="arrival-date date-picker"
                                autocomplete="off"
                                data-date-format="<?php echo e(HotelHelper::getBookingFormDateFormat()); ?>"
                                placeholder="<?php echo e(Carbon\Carbon::now()->addDay()->format(HotelHelper::getDateFormat())); ?>"
                                data-locale="<?php echo e(App::getLocale()); ?>"
                                value="<?php echo e(BaseHelper::stringify($endDate ?: old('end_date', $endDate))); ?>"
                                name="end_date"
                            >
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="contact-field p-relative c-subject input-group input-group-two left-icon mb-20">
                            <label for="adults"><i class="fal fa-users"></i><?php echo e(__('Adults')); ?></label>
                            <div class="input-quantity">
                                <button type="button" class="main-btn btn" data-bb-toggle="decrement-room">-</button>
                                <input type="number" id="adults" name="adults" readonly value="<?php echo e(BaseHelper::stringify(request()->integer('adults', 1))); ?>" min="<?php echo e(HotelHelper::getMinimumNumberOfGuests()); ?>" max="<?php echo e(HotelHelper::getMaximumNumberOfGuests()); ?>">
                                <button type="button" class="main-btn btn" data-bb-toggle="increment-room">+</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <div class="contact-field p-relative c-subject input-group input-group-two left-icon mb-20">
                            <label for="children"><i class="fal fa-child"></i><?php echo e(__('Children')); ?></label>
                            <div class="input-quantity">
                                <button type="button" class="main-btn btn" data-bb-toggle="decrement-room">-</button>
                                <input type="number" id="children" name="children" readonly value="<?php echo e(BaseHelper::stringify(request()->integer('children')) ?: 0); ?>" min="0" max="<?php echo e(HotelHelper::getMaximumNumberOfGuests()); ?>">
                                <button type="button" class="main-btn btn" data-bb-toggle="increment-room">+</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <div class="contact-field p-relative c-subject input-group input-group-two left-icon mb-20">
                            <label for="rooms"><i class="fal fa-hotel"></i><?php echo e(__('Rooms')); ?></label>
                            <div class="input-quantity">
                                <button type="button" class="main-btn btn" data-bb-toggle="decrement-room">-</button>
                                <input type="number" id="rooms" name="rooms" readonly value="<?php echo e(BaseHelper::stringify(request()->integer('rooms', 1))); ?>" min="1" max="<?php echo e(10); ?>">
                                <button type="button" class="main-btn btn" data-bb-toggle="increment-room">+</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="slider-btn mt-15">
                            <button type="submit" class="btn ss-btn" data-animation="fadeInRight" data-delay=".8s">
                                <span><?php echo e($availableForBooking ? __('Book Now') : __('Check Availability')); ?></span>
                            </button>
                        </div>
                    </div>
                </div>
        <?php endswitch; ?>
    </form>
<?php endif; ?>
<?php /**PATH C:\laragon\www\main\platform\themes/riorelax/partials/hotel/forms/form.blade.php ENDPATH**/ ?>