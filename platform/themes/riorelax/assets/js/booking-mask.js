document.addEventListener('DOMContentLoaded', function () {
    var mask = document.getElementById('booking-mask');
    var toggleBtn = document.getElementById('booking-toggle');
    var closeBtn = document.getElementById('booking-close');

    if (!mask || !toggleBtn || !closeBtn) return;

    toggleBtn.addEventListener('click', function () {
        mask.classList.remove('closed');
        mask.classList.add('open');
    });

    closeBtn.addEventListener('click', function () {
        mask.classList.remove('open');
        mask.classList.add('closed');
    });

    initBookingCalendar();

    function initBookingCalendar() {
        if (typeof jQuery === 'undefined' || typeof jQuery.fn.datepicker === 'undefined') {
            setTimeout(initBookingCalendar, 200);
            return;
        }

        var $ = jQuery;
        var $cal = $('#bm-calendar');
        var $startInput = $('#bm-start-date');
        var $endInput = $('#bm-end-date');
        var $checkinField = $('#bm-checkin-field');
        var $checkoutField = $('#bm-checkout-field');

        if (!$cal.length) return;

        var locale = $startInput.data('locale') || 'en';
        var format = $startInput.data('date-format') || 'dd-mm-yyyy';
        var activeField = 'checkin'; // 'checkin' or 'checkout'
        var today = new Date();
        today.setHours(0, 0, 0, 0);

        // Render inline calendar inside #bm-calendar div
        $cal.datepicker({
            todayHighlight: true,
            format: format,
            language: locale,
            startDate: today
        });

        var checkinDate = null;
        var checkoutDate = null;

        // When a date is selected on the inline calendar
        $cal.on('changeDate', function (e) {
            var selectedDate = e.date;
            if (!selectedDate) return;
            var formatted = $cal.datepicker('getFormattedDate');

            if (activeField === 'checkin') {
                checkinDate = selectedDate;
                $startInput.val(formatted);

                // Auto-switch to checkout
                activeField = 'checkout';
                $checkinField.removeClass('active');
                $checkoutField.addClass('active');

                // Clear checkout if it's before new checkin
                if (checkoutDate && checkoutDate <= selectedDate) {
                    checkoutDate = null;
                    $endInput.val('');
                }
            } else {
                if (checkinDate && selectedDate <= checkinDate) {
                    return; // Don't allow checkout <= checkin
                }
                checkoutDate = selectedDate;
                $endInput.val(formatted);
            }
        });

        // Click on Check In field → switch mode
        $checkinField.on('click', function () {
            activeField = 'checkin';
            $checkinField.addClass('active');
            $checkoutField.removeClass('active');
        });

        // Click on Check Out field → switch mode
        $checkoutField.on('click', function () {
            activeField = 'checkout';
            $checkoutField.addClass('active');
            $checkinField.removeClass('active');
        });
    }
});
