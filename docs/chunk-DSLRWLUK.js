import{T as P,fa as z,ga as H,ha as V,ia as g,na as A,ra as $,ua as G}from"./chunk-CXB3TX3X.js";import{k as B,m as O,q as N}from"./chunk-DCKQV6OX.js";import{Cb as r,Db as u,Eb as _,Jb as v,Kb as C,Lb as h,Nb as j,Rb as y,Sb as q,Tb as T,Ub as p,Wa as i,Wb as d,Xb as s,ba as Q,bc as R,ca as F,cc as f,dc as x,ec as M,fb as I,ga as S,gb as k,jb as D,lb as c,lc as w,ta as E,ya as b}from"./chunk-XZ5S6H3X.js";var J=`
    .p-card {
        background: dt('card.background');
        color: dt('card.color');
        box-shadow: dt('card.shadow');
        border-radius: dt('card.border.radius');
        display: flex;
        flex-direction: column;
    }

    .p-card-caption {
        display: flex;
        flex-direction: column;
        gap: dt('card.caption.gap');
    }

    .p-card-body {
        padding: dt('card.body.padding');
        display: flex;
        flex-direction: column;
        gap: dt('card.body.gap');
    }

    .p-card-title {
        font-size: dt('card.title.font.size');
        font-weight: dt('card.title.font.weight');
    }

    .p-card-subtitle {
        color: dt('card.subtitle.color');
    }
`;var L=["header"],U=["title"],W=["subtitle"],X=["content"],Y=["footer"],Z=["*",[["p-header"]],[["p-footer"]]],ee=["*","p-header","p-footer"];function te(t,l){t&1&&h(0)}function ne(t,l){if(t&1&&(u(0,"div"),T(1,1),c(2,te,1,0,"ng-container",1),_()),t&2){let e=y();f(e.cx("header")),i(2),r("ngTemplateOutlet",e.headerTemplate||e._headerTemplate)}}function ae(t,l){if(t&1&&(v(0),x(1),C()),t&2){let e=y(2);i(),M(e.header)}}function ie(t,l){t&1&&h(0)}function re(t,l){if(t&1&&(u(0,"div"),c(1,ae,2,1,"ng-container",2)(2,ie,1,0,"ng-container",1),_()),t&2){let e=y();f(e.cx("title")),i(),r("ngIf",e.header&&!e._titleTemplate&&!e.titleTemplate),i(),r("ngTemplateOutlet",e.titleTemplate||e._titleTemplate)}}function oe(t,l){if(t&1&&(v(0),x(1),C()),t&2){let e=y(2);i(),M(e.subheader)}}function le(t,l){t&1&&h(0)}function ce(t,l){if(t&1&&(u(0,"div"),c(1,oe,2,1,"ng-container",2)(2,le,1,0,"ng-container",1),_()),t&2){let e=y();f(e.cx("subtitle")),i(),r("ngIf",e.subheader&&!e._subtitleTemplate&&!e.subtitleTemplate),i(),r("ngTemplateOutlet",e.subtitleTemplate||e._subtitleTemplate)}}function pe(t,l){t&1&&h(0)}function de(t,l){t&1&&h(0)}function se(t,l){if(t&1&&(u(0,"div"),T(1,2),c(2,de,1,0,"ng-container",1),_()),t&2){let e=y();f(e.cx("footer")),i(2),r("ngTemplateOutlet",e.footerTemplate||e._footerTemplate)}}var me=A`
    ${J}

    .p-card {
        display: block;
    }
`,fe={root:"p-card p-component",header:"p-card-header",body:"p-card-body",caption:"p-card-caption",title:"p-card-title",subtitle:"p-card-subtitle",content:"p-card-content",footer:"p-card-footer"},K=(()=>{class t extends ${name="card";theme=me;classes=fe;static \u0275fac=(()=>{let e;return function(n){return(e||(e=b(t)))(n||t)}})();static \u0275prov=Q({token:t,factory:t.\u0275fac})}return t})();var ue=(()=>{class t extends G{header;subheader;set style(e){P(this._style(),e)||this._style.set(e)}styleClass;headerFacet;footerFacet;headerTemplate;titleTemplate;subtitleTemplate;contentTemplate;footerTemplate;_headerTemplate;_titleTemplate;_subtitleTemplate;_contentTemplate;_footerTemplate;_style=E(null);_componentStyle=S(K);getBlockableElement(){return this.el.nativeElement.children[0]}templates;ngAfterContentInit(){this.templates.forEach(e=>{switch(e.getType()){case"header":this._headerTemplate=e.template;break;case"title":this._titleTemplate=e.template;break;case"subtitle":this._subtitleTemplate=e.template;break;case"content":this._contentTemplate=e.template;break;case"footer":this._footerTemplate=e.template;break;default:this._contentTemplate=e.template;break}})}static \u0275fac=(()=>{let e;return function(n){return(e||(e=b(t)))(n||t)}})();static \u0275cmp=I({type:t,selectors:[["p-card"]],contentQueries:function(o,n,m){if(o&1&&(p(m,z,5),p(m,H,5),p(m,L,4),p(m,U,4),p(m,W,4),p(m,X,4),p(m,Y,4),p(m,V,4)),o&2){let a;d(a=s())&&(n.headerFacet=a.first),d(a=s())&&(n.footerFacet=a.first),d(a=s())&&(n.headerTemplate=a.first),d(a=s())&&(n.titleTemplate=a.first),d(a=s())&&(n.subtitleTemplate=a.first),d(a=s())&&(n.contentTemplate=a.first),d(a=s())&&(n.footerTemplate=a.first),d(a=s())&&(n.templates=a)}},hostVars:5,hostBindings:function(o,n){o&2&&(j("data-pc-name","card"),R(n._style()),f(n.cn(n.cx("root"),n.styleClass)))},inputs:{header:"header",subheader:"subheader",style:"style",styleClass:"styleClass"},features:[w([K]),D],ngContentSelectors:ee,decls:8,vars:9,consts:[[3,"class",4,"ngIf"],[4,"ngTemplateOutlet"],[4,"ngIf"]],template:function(o,n){o&1&&(q(Z),c(0,ne,3,3,"div",0),u(1,"div"),c(2,re,3,4,"div",0)(3,ce,3,4,"div",0),u(4,"div"),T(5),c(6,pe,1,0,"ng-container",1),_(),c(7,se,3,3,"div",0),_()),o&2&&(r("ngIf",n.headerFacet||n.headerTemplate||n._headerTemplate),i(),f(n.cx("body")),i(),r("ngIf",n.header||n.titleTemplate||n._titleTemplate),i(),r("ngIf",n.subheader||n.subtitleTemplate||n._subtitleTemplate),i(),f(n.cx("content")),i(2),r("ngTemplateOutlet",n.contentTemplate||n._contentTemplate),i(),r("ngIf",n.footerFacet||n.footerTemplate||n._footerTemplate))},dependencies:[N,B,O,g],encapsulation:2,changeDetection:0})}return t})(),Re=(()=>{class t{static \u0275fac=function(o){return new(o||t)};static \u0275mod=k({type:t});static \u0275inj=F({imports:[ue,g,g]})}return t})();export{Re as a};
