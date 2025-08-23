import{c as pt,d as ft}from"./chunk-26UPGFCH.js";import{k as tt,l as vt}from"./chunk-M5TXJTAX.js";import{D as X,G as V,T as Y,Z as bt,ha as ut,i as J,ia as Z,l as lt,ra as I,t as ct,u as dt,ua as F,v as O}from"./chunk-CXB3TX3X.js";import{m as rt,q as D,u as H}from"./chunk-DCKQV6OX.js";import{Aa as nt,Cb as U,Db as L,Eb as N,Ec as s,Fb as j,Fc as ot,Ic as h,Kc as K,Lb as G,Mb as Q,Pc as C,Qb as E,Qc as st,Rb as v,Sb as x,Tb as w,Ub as z,Vb as B,Wa as f,Wb as b,Xb as u,aa as M,ba as g,ca as et,cc as l,fb as m,ga as r,gb as it,jb as y,kb as at,la as R,lb as W,lc as k,ma as S,ta as A,wb as d,xb as _,ya as c,yb as T}from"./chunk-XZ5S6H3X.js";var ht=`
    .p-tabs {
        display: flex;
        flex-direction: column;
    }

    .p-tablist {
        display: flex;
        position: relative;
    }

    .p-tabs-scrollable > .p-tablist {
        overflow: hidden;
    }

    .p-tablist-viewport {
        overflow-x: auto;
        overflow-y: hidden;
        scroll-behavior: smooth;
        scrollbar-width: none;
        overscroll-behavior: contain auto;
    }

    .p-tablist-viewport::-webkit-scrollbar {
        display: none;
    }

    .p-tablist-tab-list {
        position: relative;
        display: flex;
        background: dt('tabs.tablist.background');
        border-style: solid;
        border-color: dt('tabs.tablist.border.color');
        border-width: dt('tabs.tablist.border.width');
    }

    .p-tablist-content {
        flex-grow: 1;
    }

    .p-tablist-nav-button {
        all: unset;
        position: absolute !important;
        flex-shrink: 0;
        inset-block-start: 0;
        z-index: 2;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        background: dt('tabs.nav.button.background');
        color: dt('tabs.nav.button.color');
        width: dt('tabs.nav.button.width');
        transition:
            color dt('tabs.transition.duration'),
            outline-color dt('tabs.transition.duration'),
            box-shadow dt('tabs.transition.duration');
        box-shadow: dt('tabs.nav.button.shadow');
        outline-color: transparent;
        cursor: pointer;
    }

    .p-tablist-nav-button:focus-visible {
        z-index: 1;
        box-shadow: dt('tabs.nav.button.focus.ring.shadow');
        outline: dt('tabs.nav.button.focus.ring.width') dt('tabs.nav.button.focus.ring.style') dt('tabs.nav.button.focus.ring.color');
        outline-offset: dt('tabs.nav.button.focus.ring.offset');
    }

    .p-tablist-nav-button:hover {
        color: dt('tabs.nav.button.hover.color');
    }

    .p-tablist-prev-button {
        inset-inline-start: 0;
    }

    .p-tablist-next-button {
        inset-inline-end: 0;
    }

    .p-tablist-prev-button:dir(rtl),
    .p-tablist-next-button:dir(rtl) {
        transform: rotate(180deg);
    }

    .p-tab {
        flex-shrink: 0;
        cursor: pointer;
        user-select: none;
        position: relative;
        border-style: solid;
        white-space: nowrap;
        gap: dt('tabs.tab.gap');
        background: dt('tabs.tab.background');
        border-width: dt('tabs.tab.border.width');
        border-color: dt('tabs.tab.border.color');
        color: dt('tabs.tab.color');
        padding: dt('tabs.tab.padding');
        font-weight: dt('tabs.tab.font.weight');
        transition:
            background dt('tabs.transition.duration'),
            border-color dt('tabs.transition.duration'),
            color dt('tabs.transition.duration'),
            outline-color dt('tabs.transition.duration'),
            box-shadow dt('tabs.transition.duration');
        margin: dt('tabs.tab.margin');
        outline-color: transparent;
    }

    .p-tab:not(.p-disabled):focus-visible {
        z-index: 1;
        box-shadow: dt('tabs.tab.focus.ring.shadow');
        outline: dt('tabs.tab.focus.ring.width') dt('tabs.tab.focus.ring.style') dt('tabs.tab.focus.ring.color');
        outline-offset: dt('tabs.tab.focus.ring.offset');
    }

    .p-tab:not(.p-tab-active):not(.p-disabled):hover {
        background: dt('tabs.tab.hover.background');
        border-color: dt('tabs.tab.hover.border.color');
        color: dt('tabs.tab.hover.color');
    }

    .p-tab-active {
        background: dt('tabs.tab.active.background');
        border-color: dt('tabs.tab.active.border.color');
        color: dt('tabs.tab.active.color');
    }

    .p-tabpanels {
        background: dt('tabs.tabpanel.background');
        color: dt('tabs.tabpanel.color');
        padding: dt('tabs.tabpanel.padding');
        outline: 0 none;
    }

    .p-tabpanel:focus-visible {
        box-shadow: dt('tabs.tabpanel.focus.ring.shadow');
        outline: dt('tabs.tabpanel.focus.ring.width') dt('tabs.tabpanel.focus.ring.style') dt('tabs.tabpanel.focus.ring.color');
        outline-offset: dt('tabs.tabpanel.focus.ring.offset');
    }

    .p-tablist-active-bar {
        z-index: 1;
        display: block;
        position: absolute;
        inset-block-end: dt('tabs.active.bar.bottom');
        height: dt('tabs.active.bar.height');
        background: dt('tabs.active.bar.background');
        transition: 250ms cubic-bezier(0.35, 0, 0.25, 1);
    }
`;var wt=["previcon"],Bt=["nexticon"],kt=["content"],Ct=["prevButton"],Dt=["nextButton"],It=["inkbar"],Ft=["tabs"],P=["*"];function Mt(e,p){e&1&&G(0)}function Lt(e,p){if(e&1&&W(0,Mt,1,0,"ng-container",10),e&2){let t=v(2);U("ngTemplateOutlet",t.prevIconTemplate||t._prevIconTemplate)}}function Et(e,p){e&1&&j(0,"ChevronLeftIcon")}function Ot(e,p){if(e&1){let t=Q();L(0,"button",9,3),E("click",function(){R(t);let n=v();return S(n.onPrevButtonClick())}),_(2,Lt,1,1,"ng-container")(3,Et,1,0,"ChevronLeftIcon"),N()}if(e&2){let t=v();l(t.cx("prevButton")),d("aria-label",t.prevButtonAriaLabel)("tabindex",t.tabindex())("data-pc-group-section","navigator"),f(2),T(t.prevIconTemplate||t._prevIconTemplate?2:3)}}function Vt(e,p){e&1&&G(0)}function Pt(e,p){if(e&1&&W(0,Vt,1,0,"ng-container",10),e&2){let t=v(2);U("ngTemplateOutlet",t.nextIconTemplate||t._nextIconTemplate)}}function Rt(e,p){e&1&&j(0,"ChevronRightIcon")}function St(e,p){if(e&1){let t=Q();L(0,"button",9,4),E("click",function(){R(t);let n=v();return S(n.onNextButtonClick())}),_(2,Pt,1,1,"ng-container")(3,Rt,1,0,"ChevronRightIcon"),N()}if(e&2){let t=v();l(t.cx("nextButton")),d("aria-label",t.nextButtonAriaLabel)("tabindex",t.tabindex())("data-pc-group-section","navigator"),f(2),T(t.nextIconTemplate||t._nextIconTemplate?2:3)}}function At(e,p){e&1&&w(0)}var Nt={root:({instance:e})=>["p-tabs p-component",{"p-tabs-scrollable":e.scrollable()}]},gt=(()=>{class e extends I{name="tabs";theme=ht;classes=Nt;static \u0275fac=(()=>{let t;return function(n){return(t||(t=c(e)))(n||e)}})();static \u0275prov=g({token:e,factory:e.\u0275fac})}return e})();var jt={root:"p-tablist",content:({instance:e})=>["p-tablist-content",{"p-tablist-viewport":e.scrollable()}],tabList:"p-tablist-tab-list",activeBar:"p-tablist-active-bar",prevButton:"p-tablist-prev-button p-tablist-nav-button",nextButton:"p-tablist-next-button p-tablist-nav-button"},mt=(()=>{class e extends I{name="tablist";classes=jt;static \u0275fac=(()=>{let t;return function(n){return(t||(t=c(e)))(n||e)}})();static \u0275prov=g({token:e,factory:e.\u0275fac})}return e})();var xt=(()=>{class e extends F{prevIconTemplate;nextIconTemplate;templates;content;prevButton;nextButton;inkbar;tabs;pcTabs=r(M(()=>$));isPrevButtonEnabled=A(!1);isNextButtonEnabled=A(!1);resizeObserver;showNavigators=s(()=>this.pcTabs.showNavigators());tabindex=s(()=>this.pcTabs.tabindex());scrollable=s(()=>this.pcTabs.scrollable());_componentStyle=r(mt);constructor(){super(),ot(()=>{this.pcTabs.value(),H(this.platformId)&&setTimeout(()=>{this.updateInkBar()})})}get prevButtonAriaLabel(){return this.config.translation.aria.previous}get nextButtonAriaLabel(){return this.config.translation.aria.next}ngAfterViewInit(){super.ngAfterViewInit(),this.showNavigators()&&H(this.platformId)&&(this.updateButtonState(),this.bindResizeObserver())}_prevIconTemplate;_nextIconTemplate;ngAfterContentInit(){this.templates.forEach(t=>{switch(t.getType()){case"previcon":this._prevIconTemplate=t.template;break;case"nexticon":this._nextIconTemplate=t.template;break}})}ngOnDestroy(){this.unbindResizeObserver(),super.ngOnDestroy()}onScroll(t){this.showNavigators()&&this.updateButtonState(),t.preventDefault()}onPrevButtonClick(){let t=this.content.nativeElement,i=V(t),n=Math.abs(t.scrollLeft)-i,a=n<=0?0:n;t.scrollLeft=J(t)?-1*a:a}onNextButtonClick(){let t=this.content.nativeElement,i=V(t)-this.getVisibleButtonWidths(),n=t.scrollLeft+i,a=t.scrollWidth-i,o=n>=a?a:n;t.scrollLeft=J(t)?-1*o:o}updateButtonState(){let t=this.content?.nativeElement,i=this.el?.nativeElement,{scrollWidth:n,offsetWidth:a}=t,o=Math.abs(t.scrollLeft),q=V(t);this.isPrevButtonEnabled.set(o!==0),this.isNextButtonEnabled.set(i.offsetWidth>=a&&o!==n-q)}updateInkBar(){let t=this.content?.nativeElement,i=this.inkbar?.nativeElement,n=this.tabs?.nativeElement,a=ct(t,'[data-pc-name="tab"][data-p-active="true"]');i&&(i.style.width=lt(a)+"px",i.style.left=X(a).left-X(n).left+"px")}getVisibleButtonWidths(){let t=this.prevButton?.nativeElement,i=this.nextButton?.nativeElement;return[t,i].reduce((n,a)=>a?n+V(a):n,0)}bindResizeObserver(){this.resizeObserver=new ResizeObserver(()=>this.updateButtonState()),this.resizeObserver.observe(this.el.nativeElement)}unbindResizeObserver(){this.resizeObserver&&(this.resizeObserver.unobserve(this.el.nativeElement),this.resizeObserver=null)}static \u0275fac=function(i){return new(i||e)};static \u0275cmp=m({type:e,selectors:[["p-tablist"]],contentQueries:function(i,n,a){if(i&1&&(z(a,wt,4),z(a,Bt,4),z(a,ut,4)),i&2){let o;b(o=u())&&(n.prevIconTemplate=o.first),b(o=u())&&(n.nextIconTemplate=o.first),b(o=u())&&(n.templates=o)}},viewQuery:function(i,n){if(i&1&&(B(kt,5),B(Ct,5),B(Dt,5),B(It,5),B(Ft,5)),i&2){let a;b(a=u())&&(n.content=a.first),b(a=u())&&(n.prevButton=a.first),b(a=u())&&(n.nextButton=a.first),b(a=u())&&(n.inkbar=a.first),b(a=u())&&(n.tabs=a.first)}},hostVars:3,hostBindings:function(i,n){i&2&&(d("data-pc-name","tablist"),l(n.cx("root")))},features:[k([mt]),y],ngContentSelectors:P,decls:9,vars:9,consts:[["content",""],["tabs",""],["inkbar",""],["prevButton",""],["nextButton",""],["type","button","pRipple","",3,"class"],[3,"scroll"],["role","tablist"],["role","presentation"],["type","button","pRipple","",3,"click"],[4,"ngTemplateOutlet"]],template:function(i,n){if(i&1){let a=Q();x(),_(0,Ot,4,6,"button",5),L(1,"div",6,0),E("scroll",function(q){return R(a),S(n.onScroll(q))}),L(3,"div",7,1),w(5),j(6,"span",8,2),N()(),_(8,St,4,6,"button",5)}i&2&&(T(n.showNavigators()&&n.isPrevButtonEnabled()?0:-1),f(),l(n.cx("content")),f(2),l(n.cx("tabList")),f(3),l(n.cx("activeBar")),d("data-pc-section","inkbar"),f(2),T(n.showNavigators()&&n.isNextButtonEnabled()?8:-1))},dependencies:[D,rt,pt,ft,vt,tt,Z],encapsulation:2,changeDetection:0})}return e})(),Qt={root:({instance:e})=>["p-tab",{"p-tab-active":e.active(),"p-disabled":e.disabled()}]},yt=(()=>{class e extends I{name="tab";classes=Qt;static \u0275fac=(()=>{let t;return function(n){return(t||(t=c(e)))(n||e)}})();static \u0275prov=g({token:e,factory:e.\u0275fac})}return e})();var zt=(()=>{class e extends F{value=K();disabled=h(!1,{transform:C});pcTabs=r(M(()=>$));pcTabList=r(M(()=>xt));el=r(nt);_componentStyle=r(yt);ripple=s(()=>this.config.ripple());id=s(()=>`${this.pcTabs.id()}_tab_${this.value()}`);ariaControls=s(()=>`${this.pcTabs.id()}_tabpanel_${this.value()}`);active=s(()=>Y(this.pcTabs.value(),this.value()));tabindex=s(()=>this.active()?this.pcTabs.tabindex():-1);mutationObserver;onFocus(t){this.pcTabs.selectOnFocus()&&this.changeActiveValue()}onClick(t){this.changeActiveValue()}onKeyDown(t){switch(t.code){case"ArrowRight":this.onArrowRightKey(t);break;case"ArrowLeft":this.onArrowLeftKey(t);break;case"Home":this.onHomeKey(t);break;case"End":this.onEndKey(t);break;case"PageDown":this.onPageDownKey(t);break;case"PageUp":this.onPageUpKey(t);break;case"Enter":case"NumpadEnter":case"Space":this.onEnterKey(t);break;default:break}t.stopPropagation()}ngAfterViewInit(){super.ngAfterViewInit(),this.bindMutationObserver()}onArrowRightKey(t){let i=this.findNextTab(t.currentTarget);i?this.changeFocusedTab(t,i):this.onHomeKey(t),t.preventDefault()}onArrowLeftKey(t){let i=this.findPrevTab(t.currentTarget);i?this.changeFocusedTab(t,i):this.onEndKey(t),t.preventDefault()}onHomeKey(t){let i=this.findFirstTab();this.changeFocusedTab(t,i),t.preventDefault()}onEndKey(t){let i=this.findLastTab();this.changeFocusedTab(t,i),t.preventDefault()}onPageDownKey(t){this.scrollInView(this.findLastTab()),t.preventDefault()}onPageUpKey(t){this.scrollInView(this.findFirstTab()),t.preventDefault()}onEnterKey(t){this.changeActiveValue(),t.preventDefault()}findNextTab(t,i=!1){let n=i?t:t.nextElementSibling;return n?O(n,"data-p-disabled")||O(n,"data-pc-section")==="inkbar"?this.findNextTab(n):n:null}findPrevTab(t,i=!1){let n=i?t:t.previousElementSibling;return n?O(n,"data-p-disabled")||O(n,"data-pc-section")==="inkbar"?this.findPrevTab(n):n:null}findFirstTab(){return this.findNextTab(this.pcTabList?.tabs?.nativeElement?.firstElementChild,!0)}findLastTab(){return this.findPrevTab(this.pcTabList?.tabs?.nativeElement?.lastElementChild,!0)}changeActiveValue(){this.pcTabs.updateValue(this.value())}changeFocusedTab(t,i){dt(i),this.scrollInView(i)}scrollInView(t){t?.scrollIntoView?.({block:"nearest"})}bindMutationObserver(){H(this.platformId)&&(this.mutationObserver=new MutationObserver(t=>{t.forEach(()=>{this.active()&&this.pcTabList?.updateInkBar()})}),this.mutationObserver.observe(this.el.nativeElement,{childList:!0,characterData:!0,subtree:!0}))}unbindMutationObserver(){this.mutationObserver.disconnect()}ngOnDestroy(){this.mutationObserver&&this.unbindMutationObserver(),super.ngOnDestroy()}static \u0275fac=(()=>{let t;return function(n){return(t||(t=c(e)))(n||e)}})();static \u0275cmp=m({type:e,selectors:[["p-tab"]],hostVars:10,hostBindings:function(i,n){i&1&&E("focus",function(o){return n.onFocus(o)})("click",function(o){return n.onClick(o)})("keydown",function(o){return n.onKeyDown(o)}),i&2&&(d("data-pc-name","tab")("id",n.id())("aria-controls",n.ariaControls())("role","tab")("aria-selected",n.active())("data-p-disabled",n.disabled())("data-p-active",n.active())("tabindex",n.tabindex()),l(n.cx("root")))},inputs:{value:[1,"value"],disabled:[1,"disabled"]},outputs:{value:"valueChange"},features:[k([yt]),at([tt]),y],ngContentSelectors:P,decls:1,vars:0,template:function(i,n){i&1&&(x(),w(0))},dependencies:[D,Z],encapsulation:2,changeDetection:0})}return e})(),Kt={root:({instance:e})=>["p-tabpanel",{"p-tabpanel-active":e.active()}]},_t=(()=>{class e extends I{name="tabpanel";classes=Kt;static \u0275fac=(()=>{let t;return function(n){return(t||(t=c(e)))(n||e)}})();static \u0275prov=g({token:e,factory:e.\u0275fac})}return e})();var Ht=(()=>{class e extends F{pcTabs=r(M(()=>$));value=K(void 0);id=s(()=>`${this.pcTabs.id()}_tabpanel_${this.value()}`);ariaLabelledby=s(()=>`${this.pcTabs.id()}_tab_${this.value()}`);active=s(()=>Y(this.pcTabs.value(),this.value()));_componentStyle=r(_t);static \u0275fac=(()=>{let t;return function(n){return(t||(t=c(e)))(n||e)}})();static \u0275cmp=m({type:e,selectors:[["p-tabpanel"]],hostVars:7,hostBindings:function(i,n){i&2&&(d("data-pc-name","tabpanel")("id",n.id())("role","tabpanel")("aria-labelledby",n.ariaLabelledby())("data-p-active",n.active()),l(n.cx("root")))},inputs:{value:[1,"value"]},outputs:{value:"valueChange"},features:[k([_t]),y],ngContentSelectors:P,decls:1,vars:1,template:function(i,n){i&1&&(x(),_(0,At,1,0)),i&2&&T(n.active()?0:-1)},dependencies:[D],encapsulation:2,changeDetection:0})}return e})(),$t={root:"p-tabpanels"},Tt=(()=>{class e extends I{name="tabpanels";classes=$t;static \u0275fac=(()=>{let t;return function(n){return(t||(t=c(e)))(n||e)}})();static \u0275prov=g({token:e,factory:e.\u0275fac})}return e})();var qt=(()=>{class e extends F{_componentStyle=r(Tt);static \u0275fac=(()=>{let t;return function(n){return(t||(t=c(e)))(n||e)}})();static \u0275cmp=m({type:e,selectors:[["p-tabpanels"]],hostVars:4,hostBindings:function(i,n){i&2&&(d("data-pc-name","tabpanels")("role","presentation"),l(n.cx("root")))},features:[k([Tt]),y],ngContentSelectors:P,decls:1,vars:0,template:function(i,n){i&1&&(x(),w(0))},dependencies:[D],encapsulation:2,changeDetection:0})}return e})(),$=(()=>{class e extends F{value=K(void 0);scrollable=h(!1,{transform:C});lazy=h(!1,{transform:C});selectOnFocus=h(!1,{transform:C});showNavigators=h(!0,{transform:C});tabindex=h(0,{transform:st});id=A(bt("pn_id_"));_componentStyle=r(gt);updateValue(t){this.value.update(()=>t)}static \u0275fac=(()=>{let t;return function(n){return(t||(t=c(e)))(n||e)}})();static \u0275cmp=m({type:e,selectors:[["p-tabs"]],hostVars:4,hostBindings:function(i,n){i&2&&(d("data-pc-name","tabs")("id",n.id()),l(n.cx("root")))},inputs:{value:[1,"value"],scrollable:[1,"scrollable"],lazy:[1,"lazy"],selectOnFocus:[1,"selectOnFocus"],showNavigators:[1,"showNavigators"],tabindex:[1,"tabindex"]},outputs:{value:"valueChange"},features:[k([gt]),y],ngContentSelectors:P,decls:1,vars:0,template:function(i,n){i&1&&(x(),w(0))},dependencies:[D],encapsulation:2,changeDetection:0})}return e})(),he=(()=>{class e{static \u0275fac=function(i){return new(i||e)};static \u0275mod=it({type:e});static \u0275inj=et({imports:[$,qt,Ht,xt,zt]})}return e})();export{xt as a,zt as b,Ht as c,qt as d,$ as e,he as f};
