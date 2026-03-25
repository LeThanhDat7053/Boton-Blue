@php
    Theme::set('pageTitle', $page->name);
    Theme::set('pageDescription', $page->description);
    Theme::set('breadcrumbBackgroundImage', $page->getMetaData('breadcrumb_background', true));
    Theme::set('breadcrumb', $page->getMetaData('breadcrumb', true))
@endphp

@if ($page->content_mode === 'html')
    <div class="custom-html-content" style="margin-top:80px;">
        <iframe
            id="custom-html-frame"
            style="width:100%;border:none;display:block;overflow:hidden;min-height:80vh;"
        ></iframe>
        <script>
            (function(){
                var f=document.getElementById('custom-html-frame');
                if(!f)return;
                var html=@json($page->custom_html);
                var doc=f.contentDocument||f.contentWindow.document;
                doc.open();doc.write(html);doc.close();
                function resize(){
                    try{f.style.height=doc.documentElement.scrollHeight+'px';}catch(e){}
                }
                f.onload=function(){resize();};
                setTimeout(resize,300);
                setInterval(resize,800);
            })();
        </script>
    </div>
@else
    {!!
        apply_filters(
            PAGE_FILTER_FRONT_PAGE_CONTENT,
            Html::tag('div', BaseHelper::clean($page->content), ['class' => 'ck-content'])->toHtml(),
            $page
        )
    !!}
@endif
