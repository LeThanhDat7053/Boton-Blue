document.addEventListener('DOMContentLoaded', function () {
    var EXTERNAL_BOOKING_BASE = 'https://book-directonline.com/properties/botbluhotspadirect';

    function parseDateToISO(dateStr) {
        if (!dateStr) return '';
        // Try dd-mm-yyyy, dd/mm/yyyy, mm-dd-yyyy, yyyy-mm-dd
        var parts;
        if (dateStr.match(/^\d{4}[-/]\d{2}[-/]\d{2}$/)) {
            return dateStr.replace(/\//g, '-');
        }
        parts = dateStr.split(/[-/]/);
        if (parts.length === 3) {
            if (parts[0].length === 4) return parts.join('-');
            // dd-mm-yyyy
            return parts[2] + '-' + parts[1] + '-' + parts[0];
        }
        return dateStr;
    }

    function formatDDMMYYYY(isoDate) {
        if (!isoDate) return '';
        var parts = isoDate.split('-');
        if (parts.length === 3) return parts[2] + parts[1] + parts[0];
        return '';
    }

    function buildExternalUrl(startDate, endDate, adults, children, rateId) {
        var checkIn = parseDateToISO(startDate);
        var checkOut = parseDateToISO(endDate);
        var arrivalDate = formatDDMMYYYY(checkIn);

        var path = rateId ? '/book' : '';

        var params = [
            'locale=vi',
            'lang=en',
            'checkInDate=' + encodeURIComponent(checkIn),
            'arrivalDate=' + encodeURIComponent(arrivalDate),
            'nightsStay=',
            'checkOutDate=' + encodeURIComponent(checkOut),
            'items[0][adults]=' + encodeURIComponent(adults || 2),
            'items[0][children]=' + encodeURIComponent(children || 0),
            'items[0][infants]=0',
        ];

        if (rateId) {
            params.push('items[0][rateId]=' + encodeURIComponent(rateId));
        }

        params.push('currency=VND');
        params.push('trackPage=yes');

        if (rateId) {
            params.push('selected=0');
            params.push('step=step1');
        }

        return EXTERNAL_BOOKING_BASE + path + '?' + params.join('&');
    }

    function getFormValue(form, name) {
        var input = form.querySelector('[name="' + name + '"]');
        return input ? input.value : '';
    }

    // Intercept all .form-booking submit events
    document.querySelectorAll('.form-booking').forEach(function (form) {
        form.addEventListener('submit', function (e) {
            e.preventDefault();

            var startDate = getFormValue(form, 'start_date');
            var endDate = getFormValue(form, 'end_date');
            var adults = getFormValue(form, 'adults') || '2';
            var children = getFormValue(form, 'children') || '0';
            var rateId = form.getAttribute('data-rate-id') || '';

            var url = buildExternalUrl(startDate, endDate, adults, children, rateId);
            window.open(url, '_blank');
        });
    });
});
