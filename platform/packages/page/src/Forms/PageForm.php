<?php

namespace Botble\Page\Forms;

use Botble\Base\Forms\FieldOptions\ContentFieldOption;
use Botble\Base\Forms\FieldOptions\DescriptionFieldOption;
use Botble\Base\Forms\FieldOptions\MediaImageFieldOption;
use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\Fields\EditorField;
use Botble\Base\Forms\Fields\HtmlField;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\Page\Http\Requests\PageRequest;
use Botble\Page\Models\Page;
use Botble\Page\Supports\Template;

class PageForm extends FormAbstract
{
    public function setup(): void
    {
        $model  = $this->getModel();
        $mode   = ($model && !empty($model->content_mode)) ? $model->content_mode : 'blocks';

        $this
            ->model(Page::class)
            ->setValidatorClass(PageRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->maxLength(120)->required())
            ->add('description', TextareaField::class, DescriptionFieldOption::make())
            ->add('content_mode_ui', HtmlField::class, [
                'html' => $this->buildToggleWidget($mode),
            ])
            ->add('content', EditorField::class, ContentFieldOption::make()->allowedShortcodes())
            ->add('custom_html', TextareaField::class, [
                'label' => 'Content',
                'attr' => [
                    'rows'        => 28,
                    'placeholder' => "Nhap toan bo HTML thuan tai day...\nBao gom <style>...</style> va <script>...</script>",
                    'style'       => 'font-family:"Consolas","Fira Code",monospace;font-size:13px;line-height:1.7;background:#1e1e2e;color:#cdd6f4;border-radius:8px;padding:16px;white-space:pre;resize:vertical;',
                    'id'          => 'custom_html',
                    'spellcheck'  => 'false',
                ],
            ])
            ->add('html_preview_block', HtmlField::class, [
                'html' => '<div id="html-preview-wrap" style="display:none;margin-bottom:8px;"><div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:6px;"><span style="font-size:13px;font-weight:600;color:#495057;">Live Preview</span><button type="button" onclick="window._refreshHtmlPreview()" style="font-size:12px;padding:3px 10px;border:1px solid #dee2e6;border-radius:5px;background:#f8f9fa;cursor:pointer;">&#8635; Refresh</button></div><iframe id="html-preview-frame" style="width:100%;min-height:560px;border:1px solid #dee2e6;border-radius:8px;background:#fff;" sandbox="allow-scripts allow-same-origin"></iframe></div>',
            ])
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->when(Template::getPageTemplates(), function (PageForm $form, array $templates) {
                return $form
                    ->add(
                        'template',
                        SelectField::class,
                        SelectFieldOption::make()
                            ->label(trans('core/base::forms.template'))
                            ->required()
                            ->choices($templates)
                    );
            })
            ->add('image', MediaImageField::class, MediaImageFieldOption::make())
            ->setBreakFieldPoint('status');
    }

    protected function buildToggleWidget(string $currentMode): string
    {
        $blocksActive = $currentMode === 'blocks' ? 'background:#0d6efd;color:#fff;border-color:#0d6efd;' : 'background:#f8f9fa;color:#6c757d;';
        $htmlActive   = $currentMode === 'html'   ? 'background:#0d6efd;color:#fff;border-color:#0d6efd;' : 'background:#f8f9fa;color:#6c757d;';
        $bClass = $currentMode === 'blocks' ? ' active' : '';
        $hClass = $currentMode === 'html'   ? ' active' : '';

        $html = '<input type="hidden" name="content_mode" id="bb-content-mode" value="' . e($currentMode) . '">';
        $html .= '<style>#bb-mode-tabs{display:inline-flex;border:1px solid #dee2e6;border-radius:7px;overflow:hidden;vertical-align:middle;}#bb-mode-tabs .bb-tab{padding:5px 20px;font-size:13px;font-weight:500;border:none;cursor:pointer;transition:all .15s;line-height:1.5;}#bb-mode-tabs .bb-tab:hover:not(.active){background:#e9ecef!important;color:#333!important;}</style>';
        $html .= '<div style="display:flex;align-items:center;gap:10px;margin-bottom:2px;"><span style="font-size:13px;font-weight:600;color:#212529;">Content</span><div id="bb-mode-tabs">';
        $html .= '<button type="button" class="bb-tab' . $bClass . '" id="bb-tab-blocks" style="' . $blocksActive . '" onclick="window._bbSetMode(\'blocks\')">UI Blocks</button>';
        $html .= '<button type="button" class="bb-tab' . $hClass . '" id="bb-tab-html" style="' . $htmlActive . '" onclick="window._bbSetMode(\'html\')">HTML</button>';
        $html .= '</div></div>';

        $html .= '<script>
(function(){
    var mode=document.getElementById("bb-content-mode").value;
    function getEdWrap(){var el=document.getElementById("content");return el?el.closest(".mb-3"):null;}
    function getHWrap(){var el=document.getElementById("custom_html");return el?el.closest(".mb-3"):null;}
    function getPWrap(){return document.getElementById("html-preview-wrap");}
    function refreshPreview(){
        var ta=document.getElementById("custom_html");
        var fr=document.getElementById("html-preview-frame");
        if(!ta||!fr)return;
        var d=fr.contentDocument||fr.contentWindow.document;
        d.open();d.write(ta.value);d.close();
    }
    function applyMode(m){
        mode=m;
        document.getElementById("bb-content-mode").value=m;
        var tb=document.getElementById("bb-tab-blocks");
        var th=document.getElementById("bb-tab-html");
        if(tb){tb.className="bb-tab"+(m==="blocks"?" active":"");tb.style.cssText=m==="blocks"?"background:#0d6efd;color:#fff;":"background:#f8f9fa;color:#6c757d;";}
        if(th){th.className="bb-tab"+(m==="html"?" active":"");th.style.cssText=m==="html"?"background:#0d6efd;color:#fff;":"background:#f8f9fa;color:#6c757d;";}
        var edW=getEdWrap();var hW=getHWrap();var pW=getPWrap();
        if(hW){var lbl=hW.querySelector("label");if(lbl)lbl.style.display="none";}
        if(edW)edW.style.display=m==="blocks"?"":"none";
        if(hW)hW.style.display=m==="html"?"":"none";
        if(pW){pW.style.display=m==="html"?"":"none";if(m==="html")refreshPreview();}
    }
    window._bbSetMode=applyMode;
    window._refreshHtmlPreview=refreshPreview;
    var t;
    document.addEventListener("input",function(e){if(e.target&&e.target.id==="custom_html"){clearTimeout(t);t=setTimeout(refreshPreview,500);}});
    function init(){
        var el=document.getElementById("content");
        if(el&&el.closest(".mb-3")){applyMode(mode);}
        else{setTimeout(init,300);}
    }
    if(document.readyState==="loading"){document.addEventListener("DOMContentLoaded",function(){setTimeout(init,1000);});}
    else{setTimeout(init,1000);}
})();
</script>';

        return $html;
    }
}
