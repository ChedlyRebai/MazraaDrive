import{b as Fe,m as qe,n as He}from"./chunk-26UPGFCH.js";import{D as Be,E as Pe,a as De,f as Ke,k as Re,p as Qe}from"./chunk-M5TXJTAX.js";import{a as ae}from"./chunk-OZ4B4EWW.js";import{P as Ve,R as B,S as D,T as me,V as _e,Z as ke,ea as Me,ha as ie,ia as P,ja as oe,ma as q,na as Ee,ra as le,sa as Ae,t as ne,u as k,ua as Le,xa as ze}from"./chunk-CXB3TX3X.js";import{i as X,j as Oe,k as Y,l as Se,m as ee,q as te}from"./chunk-DCKQV6OX.js";import{$a as se,$b as N,Ac as E,Cb as p,Db as m,Eb as _,Ec as J,Fb as A,Ic as Te,Jb as T,Kb as O,Lb as S,Mb as v,Pc as x,Qb as b,Qc as F,Rb as l,Sb as xe,Ta as fe,Tb as be,Ub as C,Vb as M,Wa as s,Wb as f,Xb as y,_b as R,aa as he,ba as H,bc as j,ca as pe,cc as h,dc as L,ec as Q,fb as G,fc as ue,ga as z,gb as ce,hc as ve,ic as Ce,jb as U,jc as we,la as c,lb as d,lc as Z,ma as u,mc as Ie,nb as w,nc as V,ob as ye,oc as W,pc as de,ta as $,wb as g,xa as ge,ya as K}from"./chunk-XZ5S6H3X.js";var $e=`
    .p-chip {
        display: inline-flex;
        align-items: center;
        background: dt('chip.background');
        color: dt('chip.color');
        border-radius: dt('chip.border.radius');
        padding-block: dt('chip.padding.y');
        padding-inline: dt('chip.padding.x');
        gap: dt('chip.gap');
    }

    .p-chip-icon {
        color: dt('chip.icon.color');
        font-size: dt('chip.icon.font.size');
        width: dt('chip.icon.size');
        height: dt('chip.icon.size');
    }

    .p-chip-image {
        border-radius: 50%;
        width: dt('chip.image.width');
        height: dt('chip.image.height');
        margin-inline-start: calc(-1 * dt('chip.padding.y'));
    }

    .p-chip:has(.p-chip-remove-icon) {
        padding-inline-end: dt('chip.padding.y');
    }

    .p-chip:has(.p-chip-image) {
        padding-block-start: calc(dt('chip.padding.y') / 2);
        padding-block-end: calc(dt('chip.padding.y') / 2);
    }

    .p-chip-remove-icon {
        cursor: pointer;
        font-size: dt('chip.remove.icon.size');
        width: dt('chip.remove.icon.size');
        height: dt('chip.remove.icon.size');
        color: dt('chip.remove.icon.color');
        border-radius: 50%;
        transition:
            outline-color dt('chip.transition.duration'),
            box-shadow dt('chip.transition.duration');
        outline-color: transparent;
    }

    .p-chip-remove-icon:focus-visible {
        box-shadow: dt('chip.remove.icon.focus.ring.shadow');
        outline: dt('chip.remove.icon.focus.ring.width') dt('chip.remove.icon.focus.ring.style') dt('chip.remove.icon.focus.ring.color');
        outline-offset: dt('chip.remove.icon.focus.ring.offset');
    }
`;var et=["removeicon"],tt=["*"];function nt(t,a){if(t&1){let e=v();m(0,"img",4),b("error",function(i){c(e);let o=l();return u(o.imageError(i))}),_()}if(t&2){let e=l();h(e.cx("image")),p("src",e.image,fe)("alt",e.alt)}}function it(t,a){if(t&1&&A(0,"span",6),t&2){let e=l(2);h(e.icon),p("ngClass",e.cx("icon")),g("data-pc-section","icon")}}function ot(t,a){if(t&1&&d(0,it,1,4,"span",5),t&2){let e=l();p("ngIf",e.icon)}}function lt(t,a){if(t&1&&(m(0,"div"),L(1),_()),t&2){let e=l();h(e.cx("label")),g("data-pc-section","label"),s(),Q(e.label)}}function at(t,a){if(t&1){let e=v();m(0,"span",9),b("click",function(i){c(e);let o=l(3);return u(o.close(i))})("keydown",function(i){c(e);let o=l(3);return u(o.onKeydown(i))}),_()}if(t&2){let e=l(3);h(e.removeIcon),p("ngClass",e.cx("removeIcon")),g("data-pc-section","removeicon")("aria-label",e.removeAriaLabel)}}function rt(t,a){if(t&1){let e=v();m(0,"TimesCircleIcon",10),b("click",function(i){c(e);let o=l(3);return u(o.close(i))})("keydown",function(i){c(e);let o=l(3);return u(o.onKeydown(i))}),_()}if(t&2){let e=l(3);h(e.cx("removeIcon")),g("data-pc-section","removeicon")("aria-label",e.removeAriaLabel)}}function pt(t,a){if(t&1&&(T(0),d(1,at,1,5,"span",8)(2,rt,1,4,"TimesCircleIcon",7),O()),t&2){let e=l(2);s(),p("ngIf",e.removeIcon),s(),p("ngIf",!e.removeIcon)}}function st(t,a){}function ct(t,a){t&1&&d(0,st,0,0,"ng-template")}function ut(t,a){if(t&1){let e=v();m(0,"span",10),b("click",function(i){c(e);let o=l(2);return u(o.close(i))})("keydown",function(i){c(e);let o=l(2);return u(o.onKeydown(i))}),d(1,ct,1,0,null,11),_()}if(t&2){let e=l(2);h(e.cx("removeIcon")),g("data-pc-section","removeicon")("aria-label",e.removeAriaLabel),s(),p("ngTemplateOutlet",e.removeIconTemplate||e._removeIconTemplate)}}function dt(t,a){if(t&1&&(T(0),d(1,pt,3,2,"ng-container",3)(2,ut,2,5,"span",7),O()),t&2){let e=l();s(),p("ngIf",!e.removeIconTemplate&&!e._removeIconTemplate),s(),p("ngIf",e.removeIconTemplate||e._removeIconTemplate)}}var mt={root:()=>["p-chip p-component"],image:"p-chip-image",icon:"p-chip-icon",label:"p-chip-label",removeIcon:"p-chip-remove-icon"},Ge=(()=>{class t extends le{name="chip";theme=$e;classes=mt;static \u0275fac=(()=>{let e;return function(i){return(e||(e=K(t)))(i||t)}})();static \u0275prov=H({token:t,factory:t.\u0275fac})}return t})();var Ue=(()=>{class t extends Le{label;icon;image;alt;styleClass;removable=!1;removeIcon;onRemove=new w;onImageError=new w;visible=!0;get removeAriaLabel(){return this.config.getTranslation(oe.ARIA).removeLabel}get chipProps(){return this._chipProps}set chipProps(e){this._chipProps=e,e&&typeof e=="object"&&Object.entries(e).forEach(([n,i])=>this[`_${n}`]!==i&&(this[`_${n}`]=i))}_chipProps;_componentStyle=z(Ge);removeIconTemplate;templates;_removeIconTemplate;ngAfterContentInit(){this.templates.forEach(e=>{switch(e.getType()){case"removeicon":this._removeIconTemplate=e.template;break;default:this._removeIconTemplate=e.template;break}})}ngOnChanges(e){if(super.ngOnChanges(e),e.chipProps&&e.chipProps.currentValue){let{currentValue:n}=e.chipProps;n.label!==void 0&&(this.label=n.label),n.icon!==void 0&&(this.icon=n.icon),n.image!==void 0&&(this.image=n.image),n.alt!==void 0&&(this.alt=n.alt),n.styleClass!==void 0&&(this.styleClass=n.styleClass),n.removable!==void 0&&(this.removable=n.removable),n.removeIcon!==void 0&&(this.removeIcon=n.removeIcon)}}close(e){this.visible=!1,this.onRemove.emit(e)}onKeydown(e){(e.key==="Enter"||e.key==="Backspace")&&this.close(e)}imageError(e){this.onImageError.emit(e)}static \u0275fac=(()=>{let e;return function(i){return(e||(e=K(t)))(i||t)}})();static \u0275cmp=G({type:t,selectors:[["p-chip"]],contentQueries:function(n,i,o){if(n&1&&(C(o,et,4),C(o,ie,4)),n&2){let r;f(r=y())&&(i.removeIconTemplate=r.first),f(r=y())&&(i.templates=r)}},hostVars:7,hostBindings:function(n,i){n&2&&(g("data-pc-name","chip")("aria-label",i.label)("data-pc-section","root"),h(i.cn(i.cx("root"),i.styleClass)),N("display",!i.visible&&"none"))},inputs:{label:"label",icon:"icon",image:"image",alt:"alt",styleClass:"styleClass",removable:[2,"removable","removable",x],removeIcon:"removeIcon",chipProps:"chipProps"},outputs:{onRemove:"onRemove",onImageError:"onImageError"},features:[Z([Ge]),U,ge],ngContentSelectors:tt,decls:6,vars:4,consts:[["iconTemplate",""],[3,"class","src","alt","error",4,"ngIf","ngIfElse"],[3,"class",4,"ngIf"],[4,"ngIf"],[3,"error","src","alt"],[3,"class","ngClass",4,"ngIf"],[3,"ngClass"],["tabindex","0","role","button",3,"class","click","keydown",4,"ngIf"],["tabindex","0","role","button",3,"class","ngClass","click","keydown",4,"ngIf"],["tabindex","0","role","button",3,"click","keydown","ngClass"],["tabindex","0","role","button",3,"click","keydown"],[4,"ngTemplateOutlet"]],template:function(n,i){if(n&1&&(xe(),be(0),d(1,nt,1,4,"img",1)(2,ot,1,1,"ng-template",null,0,E)(4,lt,2,4,"div",2)(5,dt,3,2,"ng-container",3)),n&2){let o=R(3);s(),p("ngIf",i.image)("ngIfElse",o),s(3),p("ngIf",i.label),s(),p("ngIf",i.removable)}},dependencies:[te,X,Y,ee,ae,P],encapsulation:2,changeDetection:0})}return t})();var Ne=`
    .p-autocomplete {
        display: inline-flex;
    }

    .p-autocomplete-loader {
        position: absolute;
        top: 50%;
        margin-top: -0.5rem;
        inset-inline-end: dt('autocomplete.padding.x');
    }

    .p-autocomplete:has(.p-autocomplete-dropdown) .p-autocomplete-loader {
        inset-inline-end: calc(dt('autocomplete.dropdown.width') + dt('autocomplete.padding.x'));
    }

    .p-autocomplete:has(.p-autocomplete-dropdown) .p-autocomplete-input {
        flex: 1 1 auto;
        width: 1%;
    }

    .p-autocomplete:has(.p-autocomplete-dropdown) .p-autocomplete-input,
    .p-autocomplete:has(.p-autocomplete-dropdown) .p-autocomplete-input-multiple {
        border-start-end-radius: 0;
        border-end-end-radius: 0;
    }

    .p-autocomplete-dropdown {
        cursor: pointer;
        display: inline-flex;
        user-select: none;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        position: relative;
        width: dt('autocomplete.dropdown.width');
        border-start-end-radius: dt('autocomplete.dropdown.border.radius');
        border-end-end-radius: dt('autocomplete.dropdown.border.radius');
        background: dt('autocomplete.dropdown.background');
        border: 1px solid dt('autocomplete.dropdown.border.color');
        border-inline-start: 0 none;
        color: dt('autocomplete.dropdown.color');
        transition:
            background dt('autocomplete.transition.duration'),
            color dt('autocomplete.transition.duration'),
            border-color dt('autocomplete.transition.duration'),
            outline-color dt('autocomplete.transition.duration'),
            box-shadow dt('autocomplete.transition.duration');
        outline-color: transparent;
    }

    .p-autocomplete-dropdown:not(:disabled):hover {
        background: dt('autocomplete.dropdown.hover.background');
        border-color: dt('autocomplete.dropdown.hover.border.color');
        color: dt('autocomplete.dropdown.hover.color');
    }

    .p-autocomplete-dropdown:not(:disabled):active {
        background: dt('autocomplete.dropdown.active.background');
        border-color: dt('autocomplete.dropdown.active.border.color');
        color: dt('autocomplete.dropdown.active.color');
    }

    .p-autocomplete-dropdown:focus-visible {
        box-shadow: dt('autocomplete.dropdown.focus.ring.shadow');
        outline: dt('autocomplete.dropdown.focus.ring.width') dt('autocomplete.dropdown.focus.ring.style') dt('autocomplete.dropdown.focus.ring.color');
        outline-offset: dt('autocomplete.dropdown.focus.ring.offset');
    }

    .p-autocomplete-overlay {
        position: absolute;
        top: 0;
        left: 0;
        background: dt('autocomplete.overlay.background');
        color: dt('autocomplete.overlay.color');
        border: 1px solid dt('autocomplete.overlay.border.color');
        border-radius: dt('autocomplete.overlay.border.radius');
        box-shadow: dt('autocomplete.overlay.shadow');
        min-width: 100%;
    }

    .p-autocomplete-list-container {
        overflow: auto;
    }

    .p-autocomplete-list {
        margin: 0;
        list-style-type: none;
        display: flex;
        flex-direction: column;
        gap: dt('autocomplete.list.gap');
        padding: dt('autocomplete.list.padding');
    }

    .p-autocomplete-option {
        cursor: pointer;
        white-space: nowrap;
        position: relative;
        overflow: hidden;
        display: flex;
        align-items: center;
        padding: dt('autocomplete.option.padding');
        border: 0 none;
        color: dt('autocomplete.option.color');
        background: transparent;
        transition:
            background dt('autocomplete.transition.duration'),
            color dt('autocomplete.transition.duration'),
            border-color dt('autocomplete.transition.duration');
        border-radius: dt('autocomplete.option.border.radius');
    }

    .p-autocomplete-option:not(.p-autocomplete-option-selected):not(.p-disabled).p-focus {
        background: dt('autocomplete.option.focus.background');
        color: dt('autocomplete.option.focus.color');
    }

    .p-autocomplete-option-selected {
        background: dt('autocomplete.option.selected.background');
        color: dt('autocomplete.option.selected.color');
    }

    .p-autocomplete-option-selected.p-focus {
        background: dt('autocomplete.option.selected.focus.background');
        color: dt('autocomplete.option.selected.focus.color');
    }

    .p-autocomplete-option-group {
        margin: 0;
        padding: dt('autocomplete.option.group.padding');
        color: dt('autocomplete.option.group.color');
        background: dt('autocomplete.option.group.background');
        font-weight: dt('autocomplete.option.group.font.weight');
    }

    .p-autocomplete-input-multiple {
        margin: 0;
        list-style-type: none;
        cursor: text;
        overflow: hidden;
        display: flex;
        align-items: center;
        flex-wrap: wrap;
        padding: calc(dt('autocomplete.padding.y') / 2) dt('autocomplete.padding.x');
        gap: calc(dt('autocomplete.padding.y') / 2);
        color: dt('autocomplete.color');
        background: dt('autocomplete.background');
        border: 1px solid dt('autocomplete.border.color');
        border-radius: dt('autocomplete.border.radius');
        width: 100%;
        transition:
            background dt('autocomplete.transition.duration'),
            color dt('autocomplete.transition.duration'),
            border-color dt('autocomplete.transition.duration'),
            outline-color dt('autocomplete.transition.duration'),
            box-shadow dt('autocomplete.transition.duration');
        outline-color: transparent;
        box-shadow: dt('autocomplete.shadow');
    }

    .p-autocomplete-input-multiple.p-disabled {
        opacity: 1;
        background: dt('inputtext.disabled.background');
        color: dt('inputtext.disabled.color');
    }

    .p-autocomplete:not(.p-disabled):hover .p-autocomplete-input-multiple {
        border-color: dt('autocomplete.hover.border.color');
    }

    .p-autocomplete:not(.p-disabled).p-focus .p-autocomplete-input-multiple {
        border-color: dt('autocomplete.focus.border.color');
        box-shadow: dt('autocomplete.focus.ring.shadow');
        outline: dt('autocomplete.focus.ring.width') dt('autocomplete.focus.ring.style') dt('autocomplete.focus.ring.color');
        outline-offset: dt('autocomplete.focus.ring.offset');
    }

    .p-autocomplete.p-invalid .p-autocomplete-input-multiple {
        border-color: dt('autocomplete.invalid.border.color');
    }

    .p-variant-filled.p-autocomplete-input-multiple {
        background: dt('autocomplete.filled.background');
    }

    .p-autocomplete:not(.p-disabled):hover .p-variant-filled.p-autocomplete-input-multiple {
        background: dt('autocomplete.filled.hover.background');
    }

    .p-autocomplete:not(.p-disabled).p-focus .p-variant-filled.p-autocomplete-input-multiple {
        background: dt('autocomplete.filled.focus.background');
    }

    .p-autocomplete.p-disabled .p-autocomplete-input-multiple {
        opacity: 1;
        background: dt('autocomplete.disabled.background');
        color: dt('autocomplete.disabled.color');
    }

    .p-autocomplete-chip.p-chip {
        padding-block-start: calc(dt('autocomplete.padding.y') / 2);
        padding-block-end: calc(dt('autocomplete.padding.y') / 2);
        border-radius: dt('autocomplete.chip.border.radius');
    }

    .p-autocomplete-input-multiple:has(.p-autocomplete-chip) {
        padding-inline-start: calc(dt('autocomplete.padding.y') / 2);
        padding-inline-end: calc(dt('autocomplete.padding.y') / 2);
    }

    .p-autocomplete-chip-item.p-focus .p-autocomplete-chip {
        background: dt('autocomplete.chip.focus.background');
        color: dt('autocomplete.chip.focus.color');
    }

    .p-autocomplete-input-chip {
        flex: 1 1 auto;
        display: inline-flex;
        padding-block-start: calc(dt('autocomplete.padding.y') / 2);
        padding-block-end: calc(dt('autocomplete.padding.y') / 2);
    }

    .p-autocomplete-input-chip input {
        border: 0 none;
        outline: 0 none;
        background: transparent;
        margin: 0;
        padding: 0;
        box-shadow: none;
        border-radius: 0;
        width: 100%;
        font-family: inherit;
        font-feature-settings: inherit;
        font-size: 1rem;
        color: inherit;
    }

    .p-autocomplete-input-chip input::placeholder {
        color: dt('autocomplete.placeholder.color');
    }

    .p-autocomplete.p-invalid .p-autocomplete-input-chip input::placeholder {
        color: dt('autocomplete.invalid.placeholder.color');
    }

    .p-autocomplete-empty-message {
        padding: dt('autocomplete.empty.message.padding');
    }

    .p-autocomplete-fluid {
        display: flex;
    }

    .p-autocomplete-fluid:has(.p-autocomplete-dropdown) .p-autocomplete-input {
        width: 1%;
    }

    .p-autocomplete:has(.p-inputtext-sm) .p-autocomplete-dropdown {
        width: dt('autocomplete.dropdown.sm.width');
    }

    .p-autocomplete:has(.p-inputtext-sm) .p-autocomplete-dropdown .p-icon {
        font-size: dt('form.field.sm.font.size');
        width: dt('form.field.sm.font.size');
        height: dt('form.field.sm.font.size');
    }

    .p-autocomplete:has(.p-inputtext-lg) .p-autocomplete-dropdown {
        width: dt('autocomplete.dropdown.lg.width');
    }

    .p-autocomplete:has(.p-inputtext-lg) .p-autocomplete-dropdown .p-icon {
        font-size: dt('form.field.lg.font.size');
        width: dt('form.field.lg.font.size');
        height: dt('form.field.lg.font.size');
    }

    .p-autocomplete-clear-icon {
        position: absolute;
        top: 50%;
        margin-top: -0.5rem;
        cursor: pointer;
        color: dt('autocomplete.dropdown.color');
        inset-inline-end: dt('autocomplete.padding.x');
    }

    .p-autocomplete:has(.p-autocomplete-dropdown) .p-autocomplete-clear-icon {
        inset-inline-end: calc(dt('autocomplete.padding.x') + dt('autocomplete.dropdown.width'));
    }
`;var _t=["item"],ht=["empty"],gt=["header"],ft=["footer"],yt=["selecteditem"],xt=["group"],bt=["loader"],vt=["removeicon"],Ct=["loadingicon"],wt=["clearicon"],It=["dropdownicon"],Tt=["focusInput"],Ot=["multiIn"],St=["multiContainer"],Vt=["ddBtn"],kt=["items"],Mt=["scroller"],Et=["overlay"],At=t=>({i:t}),Ze=t=>({$implicit:t}),Lt=(t,a,e)=>({removeCallback:t,index:a,class:e}),re=t=>({height:t}),We=(t,a)=>({$implicit:t,options:a}),Ft=t=>({options:t}),Dt=()=>({}),zt=(t,a,e)=>({option:t,i:a,scrollerOptions:e}),Kt=(t,a)=>({$implicit:t,index:a});function Rt(t,a){if(t&1){let e=v();m(0,"input",17,2),b("input",function(i){c(e);let o=l();return u(o.onInput(i))})("keydown",function(i){c(e);let o=l();return u(o.onKeyDown(i))})("change",function(i){c(e);let o=l();return u(o.onInputChange(i))})("focus",function(i){c(e);let o=l();return u(o.onInputFocus(i))})("blur",function(i){c(e);let o=l();return u(o.onInputBlur(i))})("paste",function(i){c(e);let o=l();return u(o.onInputPaste(i))})("keyup",function(i){c(e);let o=l();return u(o.onInputKeyUp(i))}),_()}if(t&2){let e=l();h(e.cn(e.cx("pcInputText"),e.inputStyleClass)),p("pAutoFocus",e.autofocus)("ngStyle",e.inputStyle)("variant",e.$variant())("invalid",e.invalid())("pSize",e.size())("fluid",e.hasFluid),g("type",e.type)("value",e.inputValue())("id",e.inputId)("autocomplete",e.autocomplete)("placeholder",e.placeholder)("name",e.name())("minlength",e.minlength())("min",e.min())("max",e.max())("pattern",e.pattern())("size",e.inputSize())("maxlength",e.maxlength())("tabindex",e.disabled()?-1:e.tabindex)("required",e.required()?"":void 0)("readonly",e.readonly?"":void 0)("disabled",e.disabled()?"":void 0)("aria-label",e.ariaLabel)("aria-labelledby",e.ariaLabelledBy)("aria-required",e.required())("aria-expanded",e.overlayVisible??!1)("aria-controls",e.overlayVisible?e.id+"_list":null)("aria-activedescendant",e.focused?e.focusedOptionId:void 0)}}function Qt(t,a){if(t&1){let e=v();m(0,"TimesIcon",20),b("click",function(){c(e);let i=l(2);return u(i.clear())}),_()}if(t&2){let e=l(2);p("styleClass",e.cx("clearIcon")),g("aria-hidden",!0)}}function Bt(t,a){}function Pt(t,a){t&1&&d(0,Bt,0,0,"ng-template")}function qt(t,a){if(t&1){let e=v();m(0,"span",21),b("click",function(){c(e);let i=l(2);return u(i.clear())}),d(1,Pt,1,0,null,22),_()}if(t&2){let e=l(2);h(e.cx("clearIcon")),g("aria-hidden",!0),s(),p("ngTemplateOutlet",e.clearIconTemplate||e._clearIconTemplate)}}function Ht(t,a){if(t&1&&(T(0),d(1,Qt,1,2,"TimesIcon",18)(2,qt,2,4,"span",19),O()),t&2){let e=l();s(),p("ngIf",!e.clearIconTemplate&&!e._clearIconTemplate),s(),p("ngIf",e.clearIconTemplate||e._clearIconTemplate)}}function $t(t,a){t&1&&S(0)}function Gt(t,a){if(t&1){let e=v();m(0,"span",21),b("click",function(i){c(e);let o=l(2).index,r=l(2);return u(r.readonly?"":r.removeOption(i,o))}),A(1,"TimesCircleIcon",29),_()}if(t&2){let e=l(4);h(e.cx("chipIcon")),s(),p("styleClass",e.cx("chipIcon")),g("aria-hidden",!0)}}function Ut(t,a){}function Nt(t,a){t&1&&d(0,Ut,0,0,"ng-template")}function jt(t,a){if(t&1&&(m(0,"span"),d(1,Nt,1,0,null,28),_()),t&2){let e=l(2).index,n=l(2);g("aria-hidden",!0),s(),p("ngTemplateOutlet",n.removeIconTemplate||n._removeIconTemplate)("ngTemplateOutletContext",de(3,Lt,n.removeOption.bind(n),e,n.cx("chipIcon")))}}function Zt(t,a){if(t&1&&d(0,Gt,2,4,"span",19)(1,jt,2,7,"span",13),t&2){let e=l(3);p("ngIf",!e.removeIconTemplate&&!e._removeIconTemplate),s(),p("ngIf",e.removeIconTemplate||e._removeIconTemplate)}}function Wt(t,a){if(t&1){let e=v();m(0,"li",25,4)(2,"p-chip",27),b("onRemove",function(i){let o=c(e).index,r=l(2);return u(r.readonly?"":r.removeOption(i,o))}),d(3,$t,1,0,"ng-container",28)(4,Zt,2,2,"ng-template",null,5,E),_()()}if(t&2){let e=a.$implicit,n=a.index,i=l(2);h(i.cx("chipItem",V(13,At,n))),g("id",i.id+"_multiple_option_"+n)("aria-label",i.getOptionLabel(e))("aria-setsize",i.modelValue().length)("aria-posinset",n+1)("aria-selected",!0),s(2),h(i.cx("pcChip")),p("label",!i.selectedItemTemplate&&!i._selectedItemTemplate&&i.getOptionLabel(e))("removable",!0),s(),p("ngTemplateOutlet",i.selectedItemTemplate||i._selectedItemTemplate)("ngTemplateOutletContext",V(15,Ze,e))}}function Jt(t,a){if(t&1){let e=v();m(0,"ul",23,3),b("focus",function(i){c(e);let o=l();return u(o.onMultipleContainerFocus(i))})("blur",function(i){c(e);let o=l();return u(o.onMultipleContainerBlur(i))})("keydown",function(i){c(e);let o=l();return u(o.onMultipleContainerKeyDown(i))}),d(2,Wt,6,17,"li",24),m(3,"li",25)(4,"input",26,2),b("input",function(i){c(e);let o=l();return u(o.onInput(i))})("keydown",function(i){c(e);let o=l();return u(o.onKeyDown(i))})("change",function(i){c(e);let o=l();return u(o.onInputChange(i))})("focus",function(i){c(e);let o=l();return u(o.onInputFocus(i))})("blur",function(i){c(e);let o=l();return u(o.onInputBlur(i))})("paste",function(i){c(e);let o=l();return u(o.onInputPaste(i))})("keyup",function(i){c(e);let o=l();return u(o.onInputKeyUp(i))}),_()()()}if(t&2){let e=l();h(e.cx("inputMultiple")),p("tabindex",-1),g("aria-orientation","horizontal")("aria-activedescendant",e.focused?e.focusedMultipleOptionId:void 0),s(2),p("ngForOf",e.modelValue()),s(),h(e.cx("inputChip")),s(),h(e.cx("pcInputText")),p("pAutoFocus",e.autofocus)("ngStyle",e.inputStyle),g("type",e.type)("id",e.inputId)("autocomplete",e.autocomplete)("name",e.name())("minlength",e.minlength())("maxlength",e.maxlength())("size",e.size())("min",e.min())("max",e.max())("pattern",e.pattern())("placeholder",e.$filled()?null:e.placeholder)("tabindex",e.disabled()?-1:e.tabindex)("required",e.required()?"":void 0)("readonly",e.readonly?"":void 0)("disabled",e.disabled()?"":void 0)("aria-label",e.ariaLabel)("aria-labelledby",e.ariaLabelledBy)("aria-required",e.required())("aria-expanded",e.overlayVisible??!1)("aria-controls",e.overlayVisible?e.id+"_list":null)("aria-activedescendant",e.focused?e.focusedOptionId:void 0)}}function Xt(t,a){if(t&1&&A(0,"SpinnerIcon",32),t&2){let e=l(2);p("styleClass",e.cx("loader"))("spin",!0),g("aria-hidden",!0)}}function Yt(t,a){}function en(t,a){t&1&&d(0,Yt,0,0,"ng-template")}function tn(t,a){if(t&1&&(m(0,"span"),d(1,en,1,0,null,22),_()),t&2){let e=l(2);h(e.cx("loader")),g("aria-hidden",!0),s(),p("ngTemplateOutlet",e.loadingIconTemplate||e._loadingIconTemplate)}}function nn(t,a){if(t&1&&(T(0),d(1,Xt,1,3,"SpinnerIcon",30)(2,tn,2,4,"span",31),O()),t&2){let e=l();s(),p("ngIf",!e.loadingIconTemplate&&!e._loadingIconTemplate),s(),p("ngIf",e.loadingIconTemplate||e._loadingIconTemplate)}}function on(t,a){if(t&1&&A(0,"span",35),t&2){let e=l(2);p("ngClass",e.dropdownIcon),g("aria-hidden",!0)}}function ln(t,a){t&1&&A(0,"ChevronDownIcon")}function an(t,a){}function rn(t,a){t&1&&d(0,an,0,0,"ng-template")}function pn(t,a){if(t&1&&(T(0),d(1,ln,1,0,"ChevronDownIcon",13)(2,rn,1,0,null,22),O()),t&2){let e=l(2);s(),p("ngIf",!e.dropdownIconTemplate&&!e._dropdownIconTemplate),s(),p("ngTemplateOutlet",e.dropdownIconTemplate||e._dropdownIconTemplate)}}function sn(t,a){if(t&1){let e=v();m(0,"button",33,6),b("click",function(i){c(e);let o=l();return u(o.handleDropdownClick(i))}),d(2,on,1,2,"span",34)(3,pn,3,2,"ng-container",13),_()}if(t&2){let e=l();h(e.cx("dropdown")),p("disabled",e.disabled()),g("aria-label",e.dropdownAriaLabel)("tabindex",e.tabindex),s(2),p("ngIf",e.dropdownIcon),s(),p("ngIf",!e.dropdownIcon)}}function cn(t,a){t&1&&S(0)}function un(t,a){t&1&&S(0)}function dn(t,a){if(t&1&&d(0,un,1,0,"ng-container",28),t&2){let e=a.$implicit,n=a.options;l(2);let i=R(6);p("ngTemplateOutlet",i)("ngTemplateOutletContext",W(2,We,e,n))}}function mn(t,a){t&1&&S(0)}function _n(t,a){if(t&1&&d(0,mn,1,0,"ng-container",28),t&2){let e=a.options,n=l(4);p("ngTemplateOutlet",n.loaderTemplate||n._loaderTemplate)("ngTemplateOutletContext",V(2,Ft,e))}}function hn(t,a){t&1&&(T(0),d(1,_n,1,4,"ng-template",null,9,E),O())}function gn(t,a){if(t&1){let e=v();m(0,"p-scroller",39,8),b("onLazyLoad",function(i){c(e);let o=l(2);return u(o.onLazyLoad.emit(i))}),d(2,dn,1,5,"ng-template",null,1,E)(4,hn,3,0,"ng-container",13),_()}if(t&2){let e=l(2);j(V(8,re,e.scrollHeight)),p("items",e.visibleOptions())("itemSize",e.virtualScrollItemSize)("autoSize",!0)("lazy",e.lazy)("options",e.virtualScrollOptions),s(4),p("ngIf",e.loaderTemplate||e._loaderTemplate)}}function fn(t,a){t&1&&S(0)}function yn(t,a){if(t&1&&(T(0),d(1,fn,1,0,"ng-container",28),O()),t&2){l();let e=R(6),n=l();s(),p("ngTemplateOutlet",e)("ngTemplateOutletContext",W(3,We,n.visibleOptions(),Ie(2,Dt)))}}function xn(t,a){if(t&1&&(m(0,"span"),L(1),_()),t&2){let e=l(2).$implicit,n=l(3);s(),Q(n.getOptionGroupLabel(e.optionGroup))}}function bn(t,a){t&1&&S(0)}function vn(t,a){if(t&1&&(T(0),m(1,"li",43),d(2,xn,2,1,"span",13)(3,bn,1,0,"ng-container",28),_(),O()),t&2){let e=l(),n=e.$implicit,i=e.index,o=l().options,r=l(2);s(),h(r.cx("optionGroup")),p("ngStyle",V(7,re,o.itemSize+"px")),g("id",r.id+"_"+r.getOptionIndex(i,o)),s(),p("ngIf",!r.groupTemplate),s(),p("ngTemplateOutlet",r.groupTemplate)("ngTemplateOutletContext",V(9,Ze,n.optionGroup))}}function Cn(t,a){if(t&1&&(m(0,"span"),L(1),_()),t&2){let e=l(2).$implicit,n=l(3);s(),Q(n.getOptionLabel(e))}}function wn(t,a){t&1&&S(0)}function In(t,a){if(t&1){let e=v();T(0),m(1,"li",44),b("click",function(i){c(e);let o=l().$implicit,r=l(3);return u(r.onOptionSelect(i,o))})("mouseenter",function(i){c(e);let o=l().index,r=l().options,I=l(2);return u(I.onOptionMouseEnter(i,I.getOptionIndex(o,r)))}),d(2,Cn,2,1,"span",13)(3,wn,1,0,"ng-container",28),_(),O()}if(t&2){let e=l(),n=e.$implicit,i=e.index,o=l().options,r=l(2);s(),h(r.cx("option",de(13,zt,n,i,o))),p("ngStyle",V(17,re,o.itemSize+"px")),g("id",r.id+"_"+r.getOptionIndex(i,o))("aria-label",r.getOptionLabel(n))("aria-selected",r.isSelected(n))("aria-disabled",r.isOptionDisabled(n))("data-p-focused",r.focusedOptionIndex()===r.getOptionIndex(i,o))("aria-setsize",r.ariaSetSize)("aria-posinset",r.getAriaPosInset(r.getOptionIndex(i,o))),s(),p("ngIf",!r.itemTemplate&&!r._itemTemplate),s(),p("ngTemplateOutlet",r.itemTemplate||r._itemTemplate)("ngTemplateOutletContext",W(19,Kt,n,o.getOptions?o.getOptions(i):i))}}function Tn(t,a){if(t&1&&d(0,vn,4,11,"ng-container",13)(1,In,4,22,"ng-container",13),t&2){let e=a.$implicit,n=l(3);p("ngIf",n.isOptionGroup(e)),s(),p("ngIf",!n.isOptionGroup(e))}}function On(t,a){if(t&1&&(T(0),L(1),O()),t&2){let e=l(4);s(),ue(" ",e.searchResultMessageText," ")}}function Sn(t,a){t&1&&S(0,null,11)}function Vn(t,a){if(t&1&&(m(0,"li",43),d(1,On,2,1,"ng-container",45)(2,Sn,2,0,"ng-container",22),_()),t&2){let e=l().options,n=l(2);h(n.cx("emptyMessage")),p("ngStyle",V(6,re,e.itemSize+"px")),s(),p("ngIf",!n.emptyTemplate&&!n._emptyTemplate)("ngIfElse",n.empty),s(),p("ngTemplateOutlet",n.emptyTemplate||n._emptyTemplate)}}function kn(t,a){if(t&1&&(m(0,"ul",40,10),d(2,Tn,2,2,"ng-template",41)(3,Vn,3,8,"li",42),_()),t&2){let e=a.$implicit,n=a.options,i=l(2);j(n.contentStyle),h(i.cn(i.cx("list"),n.contentStyleClass)),g("id",i.id+"_list")("aria-label",i.listLabel),s(2),p("ngForOf",e),s(),p("ngIf",!e||e&&e.length===0&&i.showEmptyMessage)}}function Mn(t,a){t&1&&S(0)}function En(t,a){if(t&1&&(m(0,"div",36),d(1,cn,1,0,"ng-container",22),m(2,"div"),d(3,gn,5,10,"p-scroller",37)(4,yn,2,6,"ng-container",13),_(),d(5,kn,4,8,"ng-template",null,7,E)(7,Mn,1,0,"ng-container",22),_(),m(8,"span",38),L(9),_()),t&2){let e=l();h(e.cn(e.cx("overlay"),e.panelStyleClass)),p("ngStyle",e.panelStyle),s(),p("ngTemplateOutlet",e.headerTemplate||e._headerTemplate),s(),h(e.cx("listContainer")),N("max-height",e.virtualScroll?"auto":e.scrollHeight),s(),p("ngIf",e.virtualScroll),s(),p("ngIf",!e.virtualScroll),s(3),p("ngTemplateOutlet",e.footerTemplate||e._footerTemplate),s(2),ue(" ",e.selectedMessageText," ")}}var An=Ee`
    ${Ne}

    /* For PrimeNG */
    p-autoComplete.ng-invalid.ng-dirty .p-autocomplete-input,
    p-autoComplete.ng-invalid.ng-dirty .p-autocomplete-input-multiple,
    p-auto-complete.ng-invalid.ng-dirty .p-autocomplete-input,
    p-auto-complete.ng-invalid.ng-dirty .p-autocomplete-input-multiple p-autocomplete.ng-invalid.ng-dirty .p-autocomplete-input,
    p-autocomplete.ng-invalid.ng-dirty .p-autocomplete-input-multiple {
        border-color: ${q("autocomplete.invalid.border.color")};
    }

    p-autoComplete.ng-invalid.ng-dirty .p-autocomplete-input:enabled:focus,
    p-autoComplete.ng-invalid.ng-dirty:not(.p-disabled).p-focus .p-autocomplete-input-multiple,
    p-auto-complete.ng-invalid.ng-dirty .p-autocomplete-input:enabled:focus,
    p-auto-complete.ng-invalid.ng-dirty:not(.p-disabled).p-focus .p-autocomplete-input-multiple,
    p-autocomplete.ng-invalid.ng-dirty .p-autocomplete-input:enabled:focus,
    p-autocomplete.ng-invalid.ng-dirty:not(.p-disabled).p-focus .p-autocomplete-input-multiple {
        border-color: ${q("autocomplete.focus.border.color")};
    }

    p-autoComplete.ng-invalid.ng-dirty .p-autocomplete-input-chip input::placeholder,
    p-auto-complete.ng-invalid.ng-dirty .p-autocomplete-input-chip input::placeholder,
    p-autocomplete.ng-invalid.ng-dirty .p-autocomplete-input-chip input::placeholder {
        color: ${q("autocomplete.invalid.placeholder.color")};
    }

    p-autoComplete.ng-invalid.ng-dirty .p-autocomplete-input::placeholder,
    p-auto-complete.ng-invalid.ng-dirty .p-autocomplete-input::placeholder,
    p-autocomplete.ng-invalid.ng-dirty .p-autocomplete-input::placeholder {
        color: ${q("autocomplete.invalid.placeholder.color")};
    }
`,Ln={root:{position:"relative"}},Fn={root:({instance:t})=>["p-autocomplete p-component p-inputwrapper",{"p-invalid":t.invalid(),"p-focus":t.focused,"p-inputwrapper-filled":t.$filled(),"p-inputwrapper-focus":t.focused&&!t.disabled()||t.autofocus||t.overlayVisible,"p-autocomplete-open":t.overlayVisible,"p-autocomplete-clearable":t.showClear&&!t.disabled(),"p-autocomplete-fluid":t.hasFluid}],pcInputText:"p-autocomplete-input",inputMultiple:({instance:t})=>["p-autocomplete-input-multiple",{"p-disabled":t.disabled(),"p-variant-filled":t.$variant()==="filled"}],chipItem:({instance:t,i:a})=>["p-autocomplete-chip-item",{"p-focus":t.focusedMultipleOptionIndex()===a}],pcChip:"p-autocomplete-chip",chipIcon:"p-autocomplete-chip-icon",inputChip:"p-autocomplete-input-chip",loader:"p-autocomplete-loader",dropdown:"p-autocomplete-dropdown",overlay:({instance:t})=>["p-autocomplete-overlay p-component",{"p-input-filled":t.$variant()==="filled","p-ripple-disabled":t.config.ripple()===!1}],listContainer:"p-autocomplete-list-container",list:"p-autocomplete-list",optionGroup:"p-autocomplete-option-group",option:({instance:t,option:a,i:e,scrollerOptions:n})=>({"p-autocomplete-option":!0,"p-autocomplete-option-selected":t.isSelected(a),"p-focus":t.focusedOptionIndex()===t.getOptionIndex(e,n),"p-disabled":t.isOptionDisabled(a)}),emptyMessage:"p-autocomplete-empty-message",clearIcon:"p-autocomplete-clear-icon"},je=(()=>{class t extends le{name="autocomplete";theme=An;classes=Fn;inlineStyles=Ln;static \u0275fac=(()=>{let e;return function(i){return(e||(e=K(t)))(i||t)}})();static \u0275prov=H({token:t,factory:t.\u0275fac})}return t})();var Dn={provide:Qe,useExisting:he(()=>Je),multi:!0},Je=(()=>{class t extends Be{overlayService;zone;minLength=1;minQueryLength;delay=300;panelStyle;styleClass;panelStyleClass;inputStyle;inputId;inputStyleClass;placeholder;readonly;scrollHeight="200px";lazy=!1;virtualScroll;virtualScrollItemSize;virtualScrollOptions;autoHighlight;forceSelection;type="text";autoZIndex=!0;baseZIndex=0;ariaLabel;dropdownAriaLabel;ariaLabelledBy;dropdownIcon;unique=!0;group;completeOnFocus=!1;showClear=!1;dropdown;showEmptyMessage=!0;dropdownMode="blank";multiple;tabindex;dataKey;emptyMessage;showTransitionOptions=".12s cubic-bezier(0, 0, 0.2, 1)";hideTransitionOptions=".1s linear";autofocus;autocomplete="off";optionGroupChildren="items";optionGroupLabel="label";overlayOptions;get suggestions(){return this._suggestions()}set suggestions(e){this._suggestions.set(e),this.handleSuggestionsChange()}optionLabel;optionValue;id;searchMessage;emptySelectionMessage;selectionMessage;autoOptionFocus=!1;selectOnFocus;searchLocale;optionDisabled;focusOnHover=!0;typeahead=!0;appendTo=Te(void 0);completeMethod=new w;onSelect=new w;onUnselect=new w;onFocus=new w;onBlur=new w;onDropdownClick=new w;onClear=new w;onKeyUp=new w;onShow=new w;onHide=new w;onLazyLoad=new w;inputEL;multiInputEl;multiContainerEL;dropdownButton;itemsViewChild;scroller;overlayViewChild;itemsWrapper;itemTemplate;emptyTemplate;headerTemplate;footerTemplate;selectedItemTemplate;groupTemplate;loaderTemplate;removeIconTemplate;loadingIconTemplate;clearIconTemplate;dropdownIconTemplate;onHostClick(e){this.onContainerClick(e)}primeng=z(Ae);value;_suggestions=$(null);onModelChange=()=>{};onModelTouched=()=>{};timeout;overlayVisible;suggestionsUpdated;highlightOption;highlightOptionChanged;focused=!1;loading;scrollHandler;listId;searchTimeout;dirty=!1;_itemTemplate;_groupTemplate;_selectedItemTemplate;_headerTemplate;_emptyTemplate;_footerTemplate;_loaderTemplate;_removeIconTemplate;_loadingIconTemplate;_clearIconTemplate;_dropdownIconTemplate;focusedMultipleOptionIndex=$(-1);focusedOptionIndex=$(-1);_componentStyle=z(je);$appendTo=J(()=>this.appendTo()||this.config.overlayAppendTo());visibleOptions=J(()=>this.group?this.flatOptions(this._suggestions()):this._suggestions()||[]);inputValue=J(()=>{let e=this.modelValue(),n=this.optionValueSelected?(this.suggestions||[]).find(i=>D(i,this.optionValue)===e):e;if(B(e))if(typeof e=="object"||this.optionValueSelected){let i=this.getOptionLabel(n);return i??e}else return e;else return""});get focusedMultipleOptionId(){return this.focusedMultipleOptionIndex()!==-1?`${this.id}_multiple_option_${this.focusedMultipleOptionIndex()}`:null}get focusedOptionId(){return this.focusedOptionIndex()!==-1?`${this.id}_${this.focusedOptionIndex()}`:null}get searchResultMessageText(){return B(this.visibleOptions())&&this.overlayVisible?this.searchMessageText.replaceAll("{0}",this.visibleOptions().length):this.emptySearchMessageText}get searchMessageText(){return this.searchMessage||this.config.translation.searchMessage||""}get emptySearchMessageText(){return this.emptyMessage||this.config.translation.emptySearchMessage||""}get selectionMessageText(){return this.selectionMessage||this.config.translation.selectionMessage||""}get emptySelectionMessageText(){return this.emptySelectionMessage||this.config.translation.emptySelectionMessage||""}get selectedMessageText(){return this.hasSelectedOption()?this.selectionMessageText.replaceAll("{0}",this.multiple?this.modelValue()?.length:"1"):this.emptySelectionMessageText}get ariaSetSize(){return this.visibleOptions().filter(e=>!this.isOptionGroup(e)).length}get listLabel(){return this.config.getTranslation(oe.ARIA).listLabel}get virtualScrollerDisabled(){return!this.virtualScroll}get optionValueSelected(){return typeof this.modelValue()=="string"&&this.optionValue}chipItemClass(e){return this._componentStyle.classes.chipItem({instance:this,i:e})}constructor(e,n){super(),this.overlayService=e,this.zone=n}ngOnInit(){super.ngOnInit(),this.id=this.id||ke("pn_id_"),this.cd.detectChanges()}templates;ngAfterContentInit(){this.templates.forEach(e=>{switch(e.getType()){case"item":this._itemTemplate=e.template;break;case"group":this._groupTemplate=e.template;break;case"selecteditem":this._selectedItemTemplate=e.template;break;case"selectedItem":this._selectedItemTemplate=e.template;break;case"header":this._headerTemplate=e.template;break;case"empty":this._emptyTemplate=e.template;break;case"footer":this._footerTemplate=e.template;break;case"loader":this._loaderTemplate=e.template;break;case"removetokenicon":this._removeIconTemplate=e.template;break;case"loadingicon":this._loadingIconTemplate=e.template;break;case"clearicon":this._clearIconTemplate=e.template;break;case"dropdownicon":this._dropdownIconTemplate=e.template;break;default:this._itemTemplate=e.template;break}})}ngAfterViewChecked(){this.suggestionsUpdated&&this.overlayViewChild&&this.zone.runOutsideAngular(()=>{setTimeout(()=>{this.overlayViewChild&&this.overlayViewChild.alignOverlay()},1),this.suggestionsUpdated=!1})}handleSuggestionsChange(){if(this.loading){this._suggestions()?.length>0||this.showEmptyMessage||this.emptyTemplate?this.show():this.hide();let e=this.overlayVisible&&this.autoOptionFocus?this.findFirstFocusedOptionIndex():-1;this.focusedOptionIndex.set(e),this.suggestionsUpdated=!0,this.loading=!1,this.cd.markForCheck()}}flatOptions(e){return(e||[]).reduce((n,i,o)=>{n.push({optionGroup:i,group:!0,index:o});let r=this.getOptionGroupChildren(i);return r&&r.forEach(I=>n.push(I)),n},[])}isOptionGroup(e){return this.optionGroupLabel&&e.optionGroup&&e.group}findFirstOptionIndex(){return this.visibleOptions().findIndex(e=>this.isValidOption(e))}findLastOptionIndex(){return _e(this.visibleOptions(),e=>this.isValidOption(e))}findFirstFocusedOptionIndex(){let e=this.findSelectedOptionIndex();return e<0?this.findFirstOptionIndex():e}findLastFocusedOptionIndex(){let e=this.findSelectedOptionIndex();return e<0?this.findLastOptionIndex():e}findSelectedOptionIndex(){return this.hasSelectedOption()?this.visibleOptions().findIndex(e=>this.isValidSelectedOption(e)):-1}findNextOptionIndex(e){let n=e<this.visibleOptions().length-1?this.visibleOptions().slice(e+1).findIndex(i=>this.isValidOption(i)):-1;return n>-1?n+e+1:e}findPrevOptionIndex(e){let n=e>0?_e(this.visibleOptions().slice(0,e),i=>this.isValidOption(i)):-1;return n>-1?n:e}isValidSelectedOption(e){return this.isValidOption(e)&&this.isSelected(e)}isValidOption(e){return e&&!(this.isOptionDisabled(e)||this.isOptionGroup(e))}isOptionDisabled(e){return this.optionDisabled?D(e,this.optionDisabled):!1}isSelected(e){return this.multiple?this.unique?this.modelValue()?.find(n=>me(n,this.getOptionValue(e),this.equalityKey())):!1:me(this.modelValue(),this.getOptionValue(e),this.equalityKey())}isOptionMatched(e,n){return this.isValidOption(e)&&this.getOptionLabel(e).toLocaleLowerCase(this.searchLocale)===n.toLocaleLowerCase(this.searchLocale)}isInputClicked(e){return e.target===this.inputEL.nativeElement}isDropdownClicked(e){return this.dropdownButton?.nativeElement?e.target===this.dropdownButton.nativeElement||this.dropdownButton.nativeElement.contains(e.target):!1}equalityKey(){return this.dataKey}onContainerClick(e){this.disabled()||this.loading||this.isInputClicked(e)||this.isDropdownClicked(e)||(!this.overlayViewChild||!this.overlayViewChild.overlayViewChild?.nativeElement.contains(e.target))&&k(this.inputEL.nativeElement)}handleDropdownClick(e){let n;this.overlayVisible?this.hide(!0):(k(this.inputEL.nativeElement),n=this.inputEL.nativeElement.value,this.dropdownMode==="blank"?this.search(e,"","dropdown"):this.dropdownMode==="current"&&this.search(e,n,"dropdown")),this.onDropdownClick.emit({originalEvent:e,query:n})}onInput(e){if(this.typeahead){let n=this.minQueryLength||this.minLength;this.searchTimeout&&clearTimeout(this.searchTimeout);let i=e.target.value;this.maxlength()!==null&&(i=i.split("").slice(0,this.maxlength()).join("")),!this.multiple&&!this.forceSelection&&this.updateModel(i),i.length===0&&!this.multiple?(this.onClear.emit(),setTimeout(()=>{this.hide()},this.delay/2)):i.length>=n?(this.focusedOptionIndex.set(-1),this.searchTimeout=setTimeout(()=>{this.search(e,i,"input")},this.delay)):this.hide()}}onInputChange(e){if(this.forceSelection){let n=!1;if(this.visibleOptions()){let i=this.visibleOptions().find(o=>this.isOptionMatched(o,this.inputEL.nativeElement.value||""));i!==void 0&&(n=!0,!this.isSelected(i)&&this.onOptionSelect(e,i))}n||(this.inputEL.nativeElement.value="",!this.multiple&&this.updateModel(null))}}onInputFocus(e){if(this.disabled())return;!this.dirty&&this.completeOnFocus&&this.search(e,e.target.value,"focus"),this.dirty=!0,this.focused=!0;let n=this.focusedOptionIndex()!==-1?this.focusedOptionIndex():this.overlayVisible&&this.autoOptionFocus?this.findFirstFocusedOptionIndex():-1;this.focusedOptionIndex.set(n),this.overlayVisible&&this.scrollInView(this.focusedOptionIndex()),this.onFocus.emit(e)}onMultipleContainerFocus(e){this.disabled()||(this.focused=!0)}onMultipleContainerBlur(e){this.focusedMultipleOptionIndex.set(-1),this.focused=!1}onMultipleContainerKeyDown(e){if(this.disabled()){e.preventDefault();return}switch(e.code){case"ArrowLeft":this.onArrowLeftKeyOnMultiple(e);break;case"ArrowRight":this.onArrowRightKeyOnMultiple(e);break;case"Backspace":this.onBackspaceKeyOnMultiple(e);break;default:break}}onInputBlur(e){this.dirty=!1,this.focused=!1,this.focusedOptionIndex.set(-1),this.onModelTouched(),this.onBlur.emit(e)}onInputPaste(e){this.onKeyDown(e)}onInputKeyUp(e){this.onKeyUp.emit(e)}onKeyDown(e){if(this.disabled()){e.preventDefault();return}switch(e.code){case"ArrowDown":this.onArrowDownKey(e);break;case"ArrowUp":this.onArrowUpKey(e);break;case"ArrowLeft":this.onArrowLeftKey(e);break;case"ArrowRight":this.onArrowRightKey(e);break;case"Home":this.onHomeKey(e);break;case"End":this.onEndKey(e);break;case"PageDown":this.onPageDownKey(e);break;case"PageUp":this.onPageUpKey(e);break;case"Enter":case"NumpadEnter":this.onEnterKey(e);break;case"Escape":this.onEscapeKey(e);break;case"Tab":this.onTabKey(e);break;case"Backspace":this.onBackspaceKey(e);break;case"ShiftLeft":case"ShiftRight":break;default:break}}onArrowDownKey(e){if(!this.overlayVisible)return;let n=this.focusedOptionIndex()!==-1?this.findNextOptionIndex(this.focusedOptionIndex()):this.findFirstFocusedOptionIndex();this.changeFocusedOptionIndex(e,n),e.preventDefault(),e.stopPropagation()}onArrowUpKey(e){if(this.overlayVisible)if(e.altKey)this.focusedOptionIndex()!==-1&&this.onOptionSelect(e,this.visibleOptions()[this.focusedOptionIndex()]),this.overlayVisible&&this.hide(),e.preventDefault();else{let n=this.focusedOptionIndex()!==-1?this.findPrevOptionIndex(this.focusedOptionIndex()):this.findLastFocusedOptionIndex();this.changeFocusedOptionIndex(e,n),e.preventDefault(),e.stopPropagation()}}onArrowLeftKey(e){let n=e.currentTarget;this.focusedOptionIndex.set(-1),this.multiple&&(Ve(n.value)&&this.hasSelectedOption()?(k(this.multiContainerEL.nativeElement),this.focusedMultipleOptionIndex.set(this.modelValue().length)):e.stopPropagation())}onArrowRightKey(e){this.focusedOptionIndex.set(-1),this.multiple&&e.stopPropagation()}onHomeKey(e){let{currentTarget:n}=e,i=n.value.length;n.setSelectionRange(0,e.shiftKey?i:0),this.focusedOptionIndex.set(-1),e.preventDefault()}onEndKey(e){let{currentTarget:n}=e,i=n.value.length;n.setSelectionRange(e.shiftKey?0:i,i),this.focusedOptionIndex.set(-1),e.preventDefault()}onPageDownKey(e){this.scrollInView(this.visibleOptions().length-1),e.preventDefault()}onPageUpKey(e){this.scrollInView(0),e.preventDefault()}onEnterKey(e){this.typeahead||this.multiple&&(this.updateModel([...this.modelValue()||[],e.target.value]),this.inputEL.nativeElement.value=""),this.overlayVisible?(this.focusedOptionIndex()!==-1&&this.onOptionSelect(e,this.visibleOptions()[this.focusedOptionIndex()]),this.hide()):this.onArrowDownKey(e),e.preventDefault()}onEscapeKey(e){this.overlayVisible&&this.hide(!0),e.preventDefault()}onTabKey(e){this.focusedOptionIndex()!==-1&&this.onOptionSelect(e,this.visibleOptions()[this.focusedOptionIndex()]),this.overlayVisible&&this.hide()}onBackspaceKey(e){if(this.multiple){if(B(this.modelValue())&&!this.inputEL.nativeElement.value){let n=this.modelValue()[this.modelValue().length-1],i=this.modelValue().slice(0,-1);this.updateModel(i),this.onUnselect.emit({originalEvent:e,value:n})}e.stopPropagation()}!this.multiple&&this.showClear&&this.findSelectedOptionIndex()!=-1&&this.clear()}onArrowLeftKeyOnMultiple(e){let n=this.focusedMultipleOptionIndex()<1?0:this.focusedMultipleOptionIndex()-1;this.focusedMultipleOptionIndex.set(n)}onArrowRightKeyOnMultiple(e){let n=this.focusedMultipleOptionIndex();n++,this.focusedMultipleOptionIndex.set(n),n>this.modelValue().length-1&&(this.focusedMultipleOptionIndex.set(-1),k(this.inputEL.nativeElement))}onBackspaceKeyOnMultiple(e){this.focusedMultipleOptionIndex()!==-1&&this.removeOption(e,this.focusedMultipleOptionIndex())}onOptionSelect(e,n,i=!0){let o=this.getOptionValue(n);this.multiple?(this.inputEL.nativeElement.value="",this.isSelected(n)||this.updateModel([...this.modelValue()||[],o])):this.updateModel(o),this.onSelect.emit({originalEvent:e,value:n}),i&&this.hide(!0)}onOptionMouseEnter(e,n){this.focusOnHover&&this.changeFocusedOptionIndex(e,n)}search(e,n,i){n!=null&&(i==="input"&&n.trim().length===0||(this.loading=!0,this.completeMethod.emit({originalEvent:e,query:n})))}removeOption(e,n){e.stopPropagation();let i=this.modelValue()[n],o=this.modelValue().filter((r,I)=>I!==n);this.updateModel(o),this.onUnselect.emit({originalEvent:e,value:i}),k(this.inputEL.nativeElement)}updateModel(e){this.value=e,this.writeModelValue(e),this.onModelChange(e),this.updateInputValue(),this.cd.markForCheck()}updateInputValue(){this.inputEL&&this.inputEL.nativeElement&&(this.multiple?this.inputEL.nativeElement.value="":this.inputEL.nativeElement.value=this.inputValue())}autoUpdateModel(){if((this.selectOnFocus||this.autoHighlight)&&this.autoOptionFocus&&!this.hasSelectedOption()){let e=this.findFirstFocusedOptionIndex();this.focusedOptionIndex.set(e),this.onOptionSelect(null,this.visibleOptions()[this.focusedOptionIndex()],!1)}}scrollInView(e=-1){let n=e!==-1?`${this.id}_${e}`:this.focusedOptionId;if(this.itemsViewChild&&this.itemsViewChild.nativeElement){let i=ne(this.itemsViewChild.nativeElement,`li[id="${n}"]`);i?i.scrollIntoView&&i.scrollIntoView({block:"nearest",inline:"nearest"}):this.virtualScrollerDisabled||setTimeout(()=>{this.virtualScroll&&this.scroller?.scrollToIndex(e!==-1?e:this.focusedOptionIndex())},0)}}changeFocusedOptionIndex(e,n){this.focusedOptionIndex()!==n&&(this.focusedOptionIndex.set(n),this.scrollInView(),this.selectOnFocus&&this.onOptionSelect(e,this.visibleOptions()[n],!1))}show(e=!1){this.dirty=!0,this.overlayVisible=!0;let n=this.focusedOptionIndex()!==-1?this.focusedOptionIndex():this.autoOptionFocus?this.findFirstFocusedOptionIndex():-1;this.focusedOptionIndex.set(n),e&&k(this.inputEL.nativeElement),e&&k(this.inputEL.nativeElement),this.onShow.emit(),this.cd.markForCheck()}hide(e=!1){let n=()=>{this.dirty=e,this.overlayVisible=!1,this.focusedOptionIndex.set(-1),e&&k(this.inputEL.nativeElement),this.onHide.emit(),this.cd.markForCheck()};setTimeout(()=>{n()},0)}clear(){this.updateModel(null),this.inputEL.nativeElement.value="",this.onClear.emit()}writeValue(e){this.value=e,this.writeModelValue(e),this.updateInputValue(),this.cd.markForCheck()}hasSelectedOption(){return B(this.modelValue())}getAriaPosInset(e){return(this.optionGroupLabel?e-this.visibleOptions().slice(0,e).filter(n=>this.isOptionGroup(n)).length:e)+1}getOptionLabel(e){return this.optionLabel?D(e,this.optionLabel):e&&e.label!=null?e.label:e}getOptionValue(e){return this.optionValue?D(e,this.optionValue):e&&e.value!=null?e.value:e}getOptionIndex(e,n){return this.virtualScrollerDisabled?e:n&&n.getItemOptions(e).index}getOptionGroupLabel(e){return this.optionGroupLabel?D(e,this.optionGroupLabel):e&&e.label!=null?e.label:e}getOptionGroupChildren(e){return this.optionGroupChildren?D(e,this.optionGroupChildren):e.items}registerOnChange(e){this.onModelChange=e}registerOnTouched(e){this.onModelTouched=e}onOverlayAnimationStart(e){if(e.toState==="visible"&&(this.itemsWrapper=ne(this.overlayViewChild.overlayViewChild?.nativeElement,this.virtualScroll?".p-scroller":".p-autocomplete-panel"),this.virtualScroll&&(this.scroller?.setContentEl(this.itemsViewChild?.nativeElement),this.scroller.viewInit()),this.visibleOptions()&&this.visibleOptions().length))if(this.virtualScroll){let n=this.modelValue()?this.focusedOptionIndex():-1;n!==-1&&this.scroller?.scrollToIndex(n)}else{let n=ne(this.itemsWrapper,".p-autocomplete-item.p-highlight");n&&n.scrollIntoView({block:"nearest",inline:"center"})}}ngOnDestroy(){this.scrollHandler&&(this.scrollHandler.destroy(),this.scrollHandler=null),super.ngOnDestroy()}static \u0275fac=function(n){return new(n||t)(se(Me),se(ye))};static \u0275cmp=G({type:t,selectors:[["p-autoComplete"],["p-autocomplete"],["p-auto-complete"]],contentQueries:function(n,i,o){if(n&1&&(C(o,_t,5),C(o,ht,5),C(o,gt,5),C(o,ft,5),C(o,yt,5),C(o,xt,5),C(o,bt,5),C(o,vt,5),C(o,Ct,5),C(o,wt,5),C(o,It,5),C(o,ie,4)),n&2){let r;f(r=y())&&(i.itemTemplate=r.first),f(r=y())&&(i.emptyTemplate=r.first),f(r=y())&&(i.headerTemplate=r.first),f(r=y())&&(i.footerTemplate=r.first),f(r=y())&&(i.selectedItemTemplate=r.first),f(r=y())&&(i.groupTemplate=r.first),f(r=y())&&(i.loaderTemplate=r.first),f(r=y())&&(i.removeIconTemplate=r.first),f(r=y())&&(i.loadingIconTemplate=r.first),f(r=y())&&(i.clearIconTemplate=r.first),f(r=y())&&(i.dropdownIconTemplate=r.first),f(r=y())&&(i.templates=r)}},viewQuery:function(n,i){if(n&1&&(M(Tt,5),M(Ot,5),M(St,5),M(Vt,5),M(kt,5),M(Mt,5),M(Et,5)),n&2){let o;f(o=y())&&(i.inputEL=o.first),f(o=y())&&(i.multiInputEl=o.first),f(o=y())&&(i.multiContainerEL=o.first),f(o=y())&&(i.dropdownButton=o.first),f(o=y())&&(i.itemsViewChild=o.first),f(o=y())&&(i.scroller=o.first),f(o=y())&&(i.overlayViewChild=o.first)}},hostVars:4,hostBindings:function(n,i){n&1&&b("click",function(r){return i.onHostClick(r)}),n&2&&(j(i.sx("root")),h(i.cn(i.cx("root"),i.styleClass)))},inputs:{minLength:[2,"minLength","minLength",F],minQueryLength:[2,"minQueryLength","minQueryLength",F],delay:[2,"delay","delay",F],panelStyle:"panelStyle",styleClass:"styleClass",panelStyleClass:"panelStyleClass",inputStyle:"inputStyle",inputId:"inputId",inputStyleClass:"inputStyleClass",placeholder:"placeholder",readonly:[2,"readonly","readonly",x],scrollHeight:"scrollHeight",lazy:[2,"lazy","lazy",x],virtualScroll:[2,"virtualScroll","virtualScroll",x],virtualScrollItemSize:[2,"virtualScrollItemSize","virtualScrollItemSize",F],virtualScrollOptions:"virtualScrollOptions",autoHighlight:[2,"autoHighlight","autoHighlight",x],forceSelection:[2,"forceSelection","forceSelection",x],type:"type",autoZIndex:[2,"autoZIndex","autoZIndex",x],baseZIndex:[2,"baseZIndex","baseZIndex",F],ariaLabel:"ariaLabel",dropdownAriaLabel:"dropdownAriaLabel",ariaLabelledBy:"ariaLabelledBy",dropdownIcon:"dropdownIcon",unique:[2,"unique","unique",x],group:[2,"group","group",x],completeOnFocus:[2,"completeOnFocus","completeOnFocus",x],showClear:[2,"showClear","showClear",x],dropdown:[2,"dropdown","dropdown",x],showEmptyMessage:[2,"showEmptyMessage","showEmptyMessage",x],dropdownMode:"dropdownMode",multiple:[2,"multiple","multiple",x],tabindex:[2,"tabindex","tabindex",F],dataKey:"dataKey",emptyMessage:"emptyMessage",showTransitionOptions:"showTransitionOptions",hideTransitionOptions:"hideTransitionOptions",autofocus:[2,"autofocus","autofocus",x],autocomplete:"autocomplete",optionGroupChildren:"optionGroupChildren",optionGroupLabel:"optionGroupLabel",overlayOptions:"overlayOptions",suggestions:"suggestions",optionLabel:"optionLabel",optionValue:"optionValue",id:"id",searchMessage:"searchMessage",emptySelectionMessage:"emptySelectionMessage",selectionMessage:"selectionMessage",autoOptionFocus:[2,"autoOptionFocus","autoOptionFocus",x],selectOnFocus:[2,"selectOnFocus","selectOnFocus",x],searchLocale:[2,"searchLocale","searchLocale",x],optionDisabled:"optionDisabled",focusOnHover:[2,"focusOnHover","focusOnHover",x],typeahead:[2,"typeahead","typeahead",x],appendTo:[1,"appendTo"]},outputs:{completeMethod:"completeMethod",onSelect:"onSelect",onUnselect:"onUnselect",onFocus:"onFocus",onBlur:"onBlur",onDropdownClick:"onDropdownClick",onClear:"onClear",onKeyUp:"onKeyUp",onShow:"onShow",onHide:"onHide",onLazyLoad:"onLazyLoad"},features:[Z([Dn,je]),U],decls:9,vars:12,consts:[["overlay",""],["content",""],["focusInput",""],["multiContainer",""],["token",""],["removeicon",""],["ddBtn",""],["buildInItems",""],["scroller",""],["loader",""],["items",""],["empty",""],["pInputText","","aria-autocomplete","list","role","combobox",3,"pAutoFocus","class","ngStyle","variant","invalid","pSize","fluid","input","keydown","change","focus","blur","paste","keyup",4,"ngIf"],[4,"ngIf"],["role","listbox",3,"class","tabindex","focus","blur","keydown",4,"ngIf"],["type","button","pRipple","",3,"class","disabled","click",4,"ngIf"],[3,"visibleChange","onAnimationStart","onHide","hostAttrSelector","visible","options","target","appendTo","showTransitionOptions","hideTransitionOptions"],["pInputText","","aria-autocomplete","list","role","combobox",3,"input","keydown","change","focus","blur","paste","keyup","pAutoFocus","ngStyle","variant","invalid","pSize","fluid"],[3,"styleClass","click",4,"ngIf"],[3,"class","click",4,"ngIf"],[3,"click","styleClass"],[3,"click"],[4,"ngTemplateOutlet"],["role","listbox",3,"focus","blur","keydown","tabindex"],["role","option",3,"class",4,"ngFor","ngForOf"],["role","option"],["role","combobox","aria-autocomplete","list",3,"input","keydown","change","focus","blur","paste","keyup","pAutoFocus","ngStyle"],[3,"onRemove","label","removable"],[4,"ngTemplateOutlet","ngTemplateOutletContext"],[3,"styleClass"],[3,"styleClass","spin",4,"ngIf"],[3,"class",4,"ngIf"],[3,"styleClass","spin"],["type","button","pRipple","",3,"click","disabled"],[3,"ngClass",4,"ngIf"],[3,"ngClass"],[3,"ngStyle"],[3,"items","style","itemSize","autoSize","lazy","options","onLazyLoad",4,"ngIf"],["role","status","aria-live","polite",1,"p-hidden-accessible"],[3,"onLazyLoad","items","itemSize","autoSize","lazy","options"],["role","listbox"],["ngFor","",3,"ngForOf"],["role","option",3,"class","ngStyle",4,"ngIf"],["role","option",3,"ngStyle"],["pRipple","","role","option",3,"click","mouseenter","ngStyle"],[4,"ngIf","ngIfElse"]],template:function(n,i){if(n&1){let o=v();d(0,Rt,2,30,"input",12)(1,Ht,3,2,"ng-container",13)(2,Jt,6,33,"ul",14)(3,nn,3,2,"ng-container",13)(4,sn,4,7,"button",15),m(5,"p-overlay",16,0),we("visibleChange",function(I){return c(o),Ce(i.overlayVisible,I)||(i.overlayVisible=I),u(I)}),b("onAnimationStart",function(I){return c(o),u(i.onOverlayAnimationStart(I))})("onHide",function(){return c(o),u(i.hide())}),d(7,En,10,12,"ng-template",null,1,E),_()}n&2&&(p("ngIf",!i.multiple),s(),p("ngIf",i.$filled()&&!i.disabled()&&i.showClear&&!i.loading),s(),p("ngIf",i.multiple),s(),p("ngIf",i.loading),s(),p("ngIf",i.dropdown),s(),p("hostAttrSelector",i.attrSelector),ve("visible",i.overlayVisible),p("options",i.overlayOptions)("target","@parent")("appendTo",i.$appendTo())("showTransitionOptions",i.showTransitionOptions)("hideTransitionOptions",i.hideTransitionOptions))},dependencies:[te,X,Oe,Y,ee,Se,qe,Pe,Re,He,Ke,ae,De,ze,Fe,Ue,P],encapsulation:2,changeDetection:0})}return t})(),Mi=(()=>{class t{static \u0275fac=function(n){return new(n||t)};static \u0275mod=ce({type:t});static \u0275inj=pe({imports:[Je,P]})}return t})();export{Je as a,Mi as b};
