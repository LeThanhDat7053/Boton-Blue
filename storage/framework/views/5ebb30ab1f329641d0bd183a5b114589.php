<?php
    Theme::set('pageTitle', $page->name);
    Theme::set('pageDescription', $page->description);
    Theme::set('breadcrumbBackgroundImage', $page->getMetaData('breadcrumb_background', true));
    Theme::set('breadcrumb', $page->getMetaData('breadcrumb', true))
?>

<?php echo apply_filters(
        PAGE_FILTER_FRONT_PAGE_CONTENT,
        Html::tag('div', BaseHelper::clean($page->content), ['class' => 'ck-content'])->toHtml(),
        $page
    ); ?>


<?php if($page->custom_html): ?>
    <?php echo $page->custom_html; ?>

<?php endif; ?>
<?php /**PATH C:\laragon\www\main\platform\themes/riorelax/views/page.blade.php ENDPATH**/ ?>