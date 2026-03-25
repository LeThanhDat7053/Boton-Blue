<?php
    $bannerRaw = theme_option('popup_banner_image');
    $bannerImg = $bannerRaw ? \Botble\Media\Facades\RvMedia::getImageUrl($bannerRaw) : null;
?>
<?php if(theme_option('popup_banner_enabled') && $bannerImg): ?>


<div id="bannerFullscreen" class="popup-banner-overlay">
    <div class="popup-banner-modal">
        <button type="button" class="popup-banner-close" id="popup-banner-close">
            <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" width="16" height="16"><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"/></svg>
        </button>
        <a id="bannerFullscreenLink" href="#" target="_blank" rel="noopener">
            <img class="popup-banner-img" src="<?php echo e($bannerImg); ?>" alt="<?php echo e(__('Special Offer')); ?>">
        </a>
    </div>
</div>


<div id="bannerPanel" class="banner-panel">
    <div class="banner-panel-actions">
        <button type="button" class="banner-panel-btn" id="bannerPanelExpand" title="Xem toàn màn hình">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="2.2"><polyline points="15 3 21 3 21 9"/><polyline points="9 21 3 21 3 15"/><line x1="21" y1="3" x2="14" y2="10"/><line x1="3" y1="21" x2="10" y2="14"/></svg>
        </button>
        <button type="button" class="banner-panel-btn" id="bannerPanelClose" title="Đóng">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" width="12" height="12" fill="currentColor"><path d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"/></svg>
        </button>
    </div>
    <a id="bannerPanelLink" href="#" target="_blank" rel="noopener">
        <img src="<?php echo e($bannerImg); ?>" alt="<?php echo e(__('Special Offer')); ?>">
    </a>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var overlay      = document.getElementById('bannerFullscreen');
        var fullClose    = document.getElementById('popup-banner-close');
        var panel        = document.getElementById('bannerPanel');
        var panelClose   = document.getElementById('bannerPanelClose');
        var panelExpand  = document.getElementById('bannerPanelExpand');

        if (!overlay || !panel) return;

        /* ---- Build booking URL with today/tomorrow dates ---- */
        function buildBookingUrl() {
            var now      = new Date();
            var tomorrow = new Date(now);
            tomorrow.setDate(now.getDate() + 1);
            function fmt(d) {
                var y = d.getFullYear();
                var m = String(d.getMonth() + 1).padStart(2, '0');
                var day = String(d.getDate()).padStart(2, '0');
                return y + '-' + m + '-' + day;
            }
            return 'https://book-directonline.com/properties/botbluhotspadirect'
                + '?locale=vi'
                + '&items[0][adults]=2'
                + '&items[0][children]=0'
                + '&items[0][infants]=0'
                + '&currency=VND'
                + '&checkInDate=' + fmt(now)
                + '&checkOutDate=' + fmt(tomorrow)
                + '&trackPage=yes';
        }

        var bookingUrl = buildBookingUrl();
        var fullLink  = document.getElementById('bannerFullscreenLink');
        var panelLink = document.getElementById('bannerPanelLink');
        if (fullLink)  fullLink.href  = bookingUrl;
        if (panelLink) panelLink.href = bookingUrl;

        var autoTimer;
        var panelOpen = false;

        /* ---- Inject banner icon into #gom-all-in-one (below phone icon) ---- */
        var gomGroup = document.getElementById('gom-all-in-one');
        var iconWrap = document.createElement('div');
        iconWrap.className = 'button-contact';
        iconWrap.id = 'banner-icon-wrap';
        iconWrap.innerHTML =
            '<div class="phone-vr" id="bannerIconBtn" title="Special Offer" style="cursor:pointer">'
            + '<div class="phone-vr-circle-fill"></div>'
            + '<div class="phone-vr-img-circle banner-icon-circle">'
            + '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="#fff" stroke-width="1.8">'
            + '<path d="M20 12v10H4V12"/>'
            + '<path d="M22 7H2v5h20V7z"/>'
            + '<path d="M12 22V7"/>'
            + '<path d="M12 7H7.5a2.5 2.5 0 0 1 0-5C11 2 12 7 12 7z"/>'
            + '<path d="M12 7h4.5a2.5 2.5 0 0 0 0-5C13 2 12 7 12 7z"/>'
            + '</svg>'
            + '</div></div>';
        if (gomGroup) {
            gomGroup.appendChild(iconWrap);
        }

        /* ---- Panel positioning: appears to the right of the icon ---- */
        function positionPanel() {
            var iconEl = document.getElementById('bannerIconBtn');
            if (!iconEl) return;
            var r = iconEl.getBoundingClientRect();
            panel.style.left  = (r.right + 10) + 'px';
            panel.style.bottom = (window.innerHeight - r.bottom) + 'px';
            panel.style.top   = 'auto';
        }

        /* ---- Toggle panel ---- */
        var iconBtn = document.getElementById('bannerIconBtn');
        if (iconBtn) {
            iconBtn.addEventListener('click', function () {
                if (panelOpen) {
                    closePanel();
                } else {
                    positionPanel();
                    panel.classList.add('banner-panel-visible');
                    panelOpen = true;
                    /* highlight active state */
                    iconWrap.classList.add('banner-icon-active');
                }
            });
        }

        function closePanel() {
            panel.classList.remove('banner-panel-visible');
            panelOpen = false;
            iconWrap.classList.remove('banner-icon-active');
        }

        /* ---- Close panel button ---- */
        if (panelClose) {
            panelClose.addEventListener('click', function () {
                closePanel();
            });
        }

        /* ---- Expand panel to fullscreen ---- */
        if (panelExpand) {
            panelExpand.addEventListener('click', function () {
                closePanel();
                openFullscreen();
            });
        }

        /* ---- Close panel when clicking outside ---- */
        document.addEventListener('click', function (e) {
            if (panelOpen && !panel.contains(e.target) && !iconWrap.contains(e.target)) {
                closePanel();
            }
        });

        /* ---- Fullscreen logic ---- */
        function openFullscreen() {
            overlay.classList.remove('popup-banner-hiding');
            overlay.style.display = 'flex';
        }

        function closeBanner() {
            overlay.classList.add('popup-banner-hiding');
            setTimeout(function () {
                overlay.style.display = 'none';
                overlay.classList.remove('popup-banner-hiding');
                sessionStorage.setItem('popup_banner_shown', '1');
            }, 300);
        }

        fullClose.addEventListener('click', function (e) {
            e.preventDefault();
            clearTimeout(autoTimer);
            closeBanner();
        });

        overlay.addEventListener('click', function (e) {
            if (e.target === overlay) {
                clearTimeout(autoTimer);
                closeBanner();
            }
        });

        /* ---- First visit: show fullscreen, then auto-collapse ---- */
        if (!sessionStorage.getItem('popup_banner_shown')) {
            overlay.style.display = 'flex';
            autoTimer = setTimeout(function () {
                closeBanner();
            }, 3000);
        }
    });
</script>
<?php endif; ?>
<?php /**PATH C:\laragon\www\main\platform\themes/riorelax/partials/popup-banner.blade.php ENDPATH**/ ?>