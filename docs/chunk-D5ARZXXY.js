import{A as G,j as q,r as P}from"./chunk-M5TXJTAX.js";import{ha as A,ia as S,ma as w,na as $,ra as F,ua as L}from"./chunk-CXB3TX3X.js";import{k as H,m as N,q as V}from"./chunk-DCKQV6OX.js";import{Cb as o,Db as T,Eb as _,Ec as Q,Ic as k,Lb as C,Pc as I,Qb as R,Rb as z,Sb as j,Tb as O,Ub as m,Wa as i,Wb as g,Xb as b,ba as h,ca as x,cc as l,fb as D,ga as d,gb as v,hb as E,jb as y,lb as u,lc as M,nb as B,wb as f,ya as s}from"./chunk-XZ5S6H3X.js";var Y=`
    .p-toolbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
        padding: dt('toolbar.padding');
        background: dt('toolbar.background');
        border: 1px solid dt('toolbar.border.color');
        color: dt('toolbar.color');
        border-radius: dt('toolbar.border.radius');
        gap: dt('toolbar.gap');
    }

    .p-toolbar-start,
    .p-toolbar-center,
    .p-toolbar-end {
        display: flex;
        align-items: center;
    }
`;var X=["start"],Z=["end"],ee=["center"],te=["*"];function ne(e,c){e&1&&C(0)}function ae(e,c){if(e&1&&(T(0,"div"),u(1,ne,1,0,"ng-container",1),_()),e&2){let t=z();l(t.cx("start")),f("data-pc-section","start"),i(),o("ngTemplateOutlet",t.startTemplate||t._startTemplate)}}function re(e,c){e&1&&C(0)}function ie(e,c){if(e&1&&(T(0,"div"),u(1,re,1,0,"ng-container",1),_()),e&2){let t=z();l(t.cx("center")),f("data-pc-section","center"),i(),o("ngTemplateOutlet",t.centerTemplate||t._centerTemplate)}}function oe(e,c){e&1&&C(0)}function le(e,c){if(e&1&&(T(0,"div"),u(1,oe,1,0,"ng-container",1),_()),e&2){let t=z();l(t.cx("end")),f("data-pc-section","end"),i(),o("ngTemplateOutlet",t.endTemplate||t._endTemplate)}}var de={root:()=>["p-toolbar p-component"],start:"p-toolbar-start",center:"p-toolbar-center",end:"p-toolbar-end"},J=(()=>{class e extends F{name="toolbar";theme=Y;classes=de;static \u0275fac=(()=>{let t;return function(n){return(t||(t=s(e)))(n||e)}})();static \u0275prov=h({token:e,factory:e.\u0275fac})}return e})();var se=(()=>{class e extends L{styleClass;ariaLabelledBy;_componentStyle=d(J);getBlockableElement(){return this.el.nativeElement.children[0]}startTemplate;endTemplate;centerTemplate;templates;_startTemplate;_endTemplate;_centerTemplate;ngAfterContentInit(){this.templates.forEach(t=>{switch(t.getType()){case"start":case"left":this._startTemplate=t.template;break;case"end":case"right":this._endTemplate=t.template;break;case"center":this._centerTemplate=t.template;break}})}static \u0275fac=(()=>{let t;return function(n){return(t||(t=s(e)))(n||e)}})();static \u0275cmp=D({type:e,selectors:[["p-toolbar"]],contentQueries:function(a,n,p){if(a&1&&(m(p,X,4),m(p,Z,4),m(p,ee,4),m(p,A,4)),a&2){let r;g(r=b())&&(n.startTemplate=r.first),g(r=b())&&(n.endTemplate=r.first),g(r=b())&&(n.centerTemplate=r.first),g(r=b())&&(n.templates=r)}},hostAttrs:["data-pc-section","root","data-pc-name","toolbar","role","toolbar"],hostVars:3,hostBindings:function(a,n){a&2&&(f("aria-labelledby",n.ariaLabelledBy),l(n.cn(n.cx("root"),n.styleClass)))},inputs:{styleClass:"styleClass",ariaLabelledBy:"ariaLabelledBy"},features:[M([J]),y],ngContentSelectors:te,decls:4,vars:3,consts:[[3,"class",4,"ngIf"],[4,"ngTemplateOutlet"]],template:function(a,n){a&1&&(j(),O(0),u(1,ae,2,4,"div",0)(2,ie,2,4,"div",0)(3,le,2,4,"div",0)),a&2&&(i(),o("ngIf",n.startTemplate||n._startTemplate),i(),o("ngIf",n.centerTemplate||n._centerTemplate),i(),o("ngIf",n.endTemplate||n._endTemplate))},dependencies:[V,H,N,S],encapsulation:2,changeDetection:0})}return e})(),ke=(()=>{class e{static \u0275fac=function(a){return new(a||e)};static \u0275mod=v({type:e});static \u0275inj=x({imports:[se,S,S]})}return e})();var K=`
    .p-textarea {
        font-family: inherit;
        font-feature-settings: inherit;
        font-size: 1rem;
        color: dt('textarea.color');
        background: dt('textarea.background');
        padding-block: dt('textarea.padding.y');
        padding-inline: dt('textarea.padding.x');
        border: 1px solid dt('textarea.border.color');
        transition:
            background dt('textarea.transition.duration'),
            color dt('textarea.transition.duration'),
            border-color dt('textarea.transition.duration'),
            outline-color dt('textarea.transition.duration'),
            box-shadow dt('textarea.transition.duration');
        appearance: none;
        border-radius: dt('textarea.border.radius');
        outline-color: transparent;
        box-shadow: dt('textarea.shadow');
    }

    .p-textarea:enabled:hover {
        border-color: dt('textarea.hover.border.color');
    }

    .p-textarea:enabled:focus {
        border-color: dt('textarea.focus.border.color');
        box-shadow: dt('textarea.focus.ring.shadow');
        outline: dt('textarea.focus.ring.width') dt('textarea.focus.ring.style') dt('textarea.focus.ring.color');
        outline-offset: dt('textarea.focus.ring.offset');
    }

    .p-textarea.p-invalid {
        border-color: dt('textarea.invalid.border.color');
    }

    .p-textarea.p-variant-filled {
        background: dt('textarea.filled.background');
    }

    .p-textarea.p-variant-filled:enabled:hover {
        background: dt('textarea.filled.hover.background');
    }

    .p-textarea.p-variant-filled:enabled:focus {
        background: dt('textarea.filled.focus.background');
    }

    .p-textarea:disabled {
        opacity: 1;
        background: dt('textarea.disabled.background');
        color: dt('textarea.disabled.color');
    }

    .p-textarea::placeholder {
        color: dt('textarea.placeholder.color');
    }

    .p-textarea.p-invalid::placeholder {
        color: dt('textarea.invalid.placeholder.color');
    }

    .p-textarea-fluid {
        width: 100%;
    }

    .p-textarea-resizable {
        overflow: hidden;
        resize: none;
    }

    .p-textarea-sm {
        font-size: dt('textarea.sm.font.size');
        padding-block: dt('textarea.sm.padding.y');
        padding-inline: dt('textarea.sm.padding.x');
    }

    .p-textarea-lg {
        font-size: dt('textarea.lg.font.size');
        padding-block: dt('textarea.lg.padding.y');
        padding-inline: dt('textarea.lg.padding.x');
    }
`;var ce=$`
    ${K}

    /* For PrimeNG */
    .p-textarea.ng-invalid.ng-dirty {
        border-color: ${w("textarea.invalid.border.color")};
    }
    .p-textarea.ng-invalid.ng-dirty::placeholder {
        color: ${w("textarea.invalid.placeholder.color")};
    }
`,pe={root:({instance:e})=>["p-textarea p-component",{"p-filled":e.$filled(),"p-textarea-resizable ":e.autoResize,"p-variant-filled":e.$variant()==="filled","p-textarea-fluid":e.hasFluid,"p-inputfield-sm p-textarea-sm":e.pSize==="small","p-textarea-lg p-inputfield-lg":e.pSize==="large","p-invalid":e.invalid(),"p-disabled":e.disabled()}]},U=(()=>{class e extends F{name="textarea";theme=ce;classes=pe;static \u0275fac=(()=>{let t;return function(n){return(t||(t=s(e)))(n||e)}})();static \u0275prov=h({token:e,factory:e.\u0275fac})}return e})();var qe=(()=>{class e extends G{autoResize;pSize;variant=k();fluid=k(void 0,{transform:I});$variant=Q(()=>this.variant()||this.config.inputStyle()||this.config.inputVariant());onResize=new B;ngModelSubscription;ngControlSubscription;_componentStyle=d(U);ngControl=d(P,{optional:!0,self:!0});pcFluid=d(q,{optional:!0,host:!0,skipSelf:!0});get hasFluid(){return this.fluid()??!!this.pcFluid}ngOnInit(){super.ngOnInit(),this.ngControl&&(this.ngControlSubscription=this.ngControl.valueChanges.subscribe(()=>{this.updateState()}))}ngAfterViewInit(){super.ngAfterViewInit(),this.autoResize&&this.resize(),this.cd.detectChanges()}ngAfterViewChecked(){this.autoResize&&this.resize()}onInput(t){this.writeModelValue(t.target.value),this.updateState()}resize(t){this.el.nativeElement.style.height="auto",this.el.nativeElement.style.height=this.el.nativeElement.scrollHeight+"px",parseFloat(this.el.nativeElement.style.height)>=parseFloat(this.el.nativeElement.style.maxHeight)?(this.el.nativeElement.style.overflowY="scroll",this.el.nativeElement.style.height=this.el.nativeElement.style.maxHeight):this.el.nativeElement.style.overflow="hidden",this.onResize.emit(t||{})}updateState(){this.autoResize&&this.resize()}ngOnDestroy(){this.ngModelSubscription&&this.ngModelSubscription.unsubscribe(),this.ngControlSubscription&&this.ngControlSubscription.unsubscribe(),super.ngOnDestroy()}static \u0275fac=(()=>{let t;return function(n){return(t||(t=s(e)))(n||e)}})();static \u0275dir=E({type:e,selectors:[["","pTextarea",""],["","pInputTextarea",""]],hostVars:2,hostBindings:function(a,n){a&1&&R("input",function(r){return n.onInput(r)}),a&2&&l(n.cx("root"))},inputs:{autoResize:[2,"autoResize","autoResize",I],pSize:"pSize",variant:[1,"variant"],fluid:[1,"fluid"]},outputs:{onResize:"onResize"},features:[M([U]),y]})}return e})(),Pe=(()=>{class e{static \u0275fac=function(a){return new(a||e)};static \u0275mod=v({type:e});static \u0275inj=x({})}return e})();export{se as a,ke as b,qe as c,Pe as d};
