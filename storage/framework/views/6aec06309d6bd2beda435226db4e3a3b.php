<?php
    $style = in_array($shortcode->style, ['style-1', 'style-2']) ? $shortcode->style : 'style-1';
?>

<?php echo Theme::partial("shortcodes.about-us.styles.$style", compact('shortcode', 'highlightArray')); ?>

<?php /**PATH C:\laragon\www\main\platform\themes/riorelax/partials/shortcodes/about-us/index.blade.php ENDPATH**/ ?>