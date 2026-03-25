@if (is_plugin_active('hotel'))
<div id="booking-mask-wrapper" class="no-mobile">
    <div class="booking closed" id="booking-mask">
        <div class="booking-header">
            <button type="button" class="booking-button" id="booking-toggle">
                <span class="booking-button-text">{{ __('Book Now') }}</span>
            </button>
        </div>
        <div class="booking-body" id="booking-body">
            <h4 class="bm-title">{{ __('MAKE RESERVATION') }}</h4>

            <form id="booking-form" class="form-booking" method="GET" action="{{ route('public.rooms') }}">
                <div class="bm-dates-row">
                    <div class="bm-date-field active" id="bm-checkin-field">
                        <label>{{ __('Check In') }}</label>
                        <input type="text" id="bm-start-date" name="start_date" placeholder="..." readonly
                               data-date-format="{{ HotelHelper::getBookingFormDateFormat() }}"
                               data-locale="{{ App::getLocale() }}">
                    </div>
                    <div class="bm-date-field" id="bm-checkout-field">
                        <label>{{ __('Check Out') }}</label>
                        <input type="text" id="bm-end-date" name="end_date" placeholder="..." readonly>
                    </div>
                </div>

                <div id="bm-calendar"></div>

                <div class="bm-guests-row">
                    <div class="bm-guest-field">
                        <label>{{ __('ADULTS') }}</label>
                        <select name="adults">
                            <option value="1">1</option>
                            <option value="2" selected>2</option>
                            @for ($i = 3; $i <= 10; $i++)
                                <option value="{{ $i }}">{{ $i }}</option>
                            @endfor
                        </select>
                    </div>
                    <div class="bm-guest-field">
                        <label>{{ __('CHILDREN') }}</label>
                        <select name="children">
                            @for ($i = 0; $i <= 10; $i++)
                                <option value="{{ $i }}" @if($i === 0) selected @endif>{{ $i }}</option>
                            @endfor
                        </select>
                    </div>
                </div>

                <button type="submit" class="booking-submit">{{ __('Check Rates') }}</button>
            </form>

            <button type="button" class="booking-close" id="booking-close">&times;</button>
        </div>
    </div>
</div>
@endif
