<div id="button-contact-vr" class="d-none d-sm-block">
    <div id="gom-all-in-one">
        <?php if($facebook = theme_option('chat_btn_facebook')): ?>
            <div id="fanpage-vr" class="button-contact">
                <a target="_blank" href="<?php echo e($facebook); ?>">
                    <div class="phone-vr">
                        <div class="phone-vr-circle-fill"></div>
                        <div class="phone-vr-img-circle">
                            <img data-bb-lazy="true" width="200" height="200" loading="lazy"
                                 src="/vendor/core/plugins/popup-chat/images/Facebook.png"
                                 alt="<?php echo e($facebook); ?>">

                        </div>
                    </div>
                </a>
            </div>
        <?php endif; ?>
        <?php if($tiktok = theme_option('chat_btn_tiktok')): ?>
            <div id="tiktok-vr" class="button-contact">
                <a target="_blank" href="<?php echo e($tiktok); ?>">

                    <div class="phone-vr">
                        <div class="phone-vr-circle-fill"></div>
                        <div class="phone-vr-img-circle">
                            <img data-bb-lazy="true" width="200" height="200" loading="lazy"
                                 src="/vendor/core/plugins/popup-chat/images/tiktok.png"
                                 alt="<?php echo e($tiktok); ?>">

                        </div>
                    </div>
                </a>
            </div>
        <?php endif; ?>
        <?php if($zalo = theme_option('chat_btn_zalo')): ?>
            <div id="zalo-vr" class="button-contact">
                <a target="_blank" href="<?php echo e($zalo); ?>">
                    <div class="phone-vr">
                        <div class="phone-vr-circle-fill"></div>
                        <div class="phone-vr-img-circle">

                            <img data-bb-lazy="true" width="200" height="200" loading="lazy"
                                 src="/vendor/core/plugins/popup-chat/images/zalo.png"
                                 alt="<?php echo e($zalo); ?>">
                        </div>
                    </div>
                </a>

            </div>
        <?php endif; ?>
        <?php if($inta = theme_option('chat_btn_instagram')): ?>
            <div id="instagram-vr" class="button-contact">
                <a target="_blank" href="<?php echo e($inta); ?>">

                    <div class="phone-vr">
                        <div class="phone-vr-circle-fill"></div>
                        <div class="phone-vr-img-circle">
                            <img data-bb-lazy="true" width="200" height="200" loading="lazy"
                                 src="/vendor/core/plugins/popup-chat/images/instagram.png"
                                 alt="<?php echo e($inta); ?>">

                        </div>
                    </div>
                </a>
            </div>
        <?php endif; ?>

        <?php if($telegram = theme_option('chat_btn_telegram')): ?>
            <div id="telegram-vr" class="button-contact">
                <a target="_blank" href="<?php echo e($telegram); ?>">
                    <div class="phone-vr">
                        <div class="phone-vr-circle-fill"></div>
                        <div class="phone-vr-img-circle">
                            <img data-bb-lazy="true" width="200" height="200" loading="lazy"
                                 src="/vendor/core/plugins/popup-chat/images/telegram.svg"
                                 alt="Telegram">
                        </div>
                    </div>
                </a>
            </div>
        <?php endif; ?>
        <?php if($whatsapp = theme_option('chat_btn_whatsapp')): ?>
            <div id="whatsapp-vr" class="button-contact">
                <a target="_blank" href="<?php echo e($whatsapp); ?>">
                    <div class="phone-vr">
                        <div class="phone-vr-circle-fill"></div>
                        <div class="phone-vr-img-circle">
                            <img data-bb-lazy="true" width="200" height="200" loading="lazy"
                                 src="/vendor/core/plugins/popup-chat/images/whatsapp.svg"
                                 alt="WhatsApp">
                        </div>
                    </div>
                </a>
            </div>
        <?php endif; ?>
        <?php if($hotline = theme_option('hotline')): ?>
            <div id="phone-vr" class="button-contact">
                <a href="tel:<?php echo e($hotline); ?>">
                    <div class="phone-vr">
                        <div class="phone-vr-circle-fill"></div>
                        <div class="phone-vr-img-circle">
                            <img data-bb-lazy="true" width="200" height="200" loading="lazy"
                                 src="/vendor/core/plugins/popup-chat/images/phone.png"
                                 alt="<?php echo e($hotline); ?>">
                        </div>
                    </div>
                </a>
            </div>
        <?php endif; ?>

    </div>
</div>

<?php /**PATH C:\laragon\www\main\platform\plugins\botble-popup-chat-icon/resources/views/show.blade.php ENDPATH**/ ?>