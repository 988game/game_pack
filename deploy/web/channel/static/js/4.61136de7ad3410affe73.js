webpackJsonp([4],{"15mY":function(t,a){},L55r:function(t,a,e){"use strict";var s=e("GQaK"),i={name:"ScrollxData",props:{scrollxData:{type:Array}},created:function(){var t=this;window.addEventListener("resize",function(){t._initScroll()})},watch:{scrollxData:function(){this._initScroll()}},mounted:function(){var t=this;this.$nextTick(function(){t._initScroll()})},methods:{_initScroll:function(){this.Scrollx?this.Scrollx.refresh():this.Scrollx=new s.a(this.$refs.scrollxWrapper,{scrollX:!0,eventPassthrough:"vertical"})}}},l={render:function(){var t=this.$createElement;return(this._self._c||t)("div",{ref:"scrollxWrapper",staticClass:"scrollx-wrap"},[this._t("default")],2)},staticRenderFns:[]};var n=e("VU/8")(i,l,!1,function(t){e("TqdA")},"data-v-1e21c198",null);a.a=n.exports},TqdA:function(t,a){},ycLi:function(t,a,e){"use strict";Object.defineProperty(a,"__esModule",{value:!0});e("GQaK");var s=e("QDJF"),i=e("vR+E"),l=e("pMNZ"),n=e("teIl"),c=e("L55r"),o=e("/bMK"),r=e("rhdv"),d={name:"member",data:function(){return{tabsLabel:["玩家ID","代理级别","充值金额","账户余额","代理自营业绩","代理团队业绩","代理继承业绩","业绩佣金","代理团队人数","账户注册时间","账户状态"],tabsIndex:0,clubDataAllData:[],isloding:!0,nocontent:!1,isOpen:!0,packInfoData:[],page:1,size:10,uid:"",week:"",total:0,sumpage:0,stime:Object(i.f)(0),etime:Object(i.f)(0),selectData:[{text:"本周",value:0},{text:"上周",value:1},{text:"上上周",value:2},{text:"上上上周",value:3}],selectedText:"",selectedIndex:[[0]],seActive:0,modalPayDetail:{show:!1,payCol:["流水单号","充值金额","充值时间","充值方式"],uid:"",name:"",payData:[],total:0,sumpage:0,page:1,limit:7,isloding:!1}}},filters:{FormatStatus:function(t){return 0==t?"正常":1==t?"封号":void 0},FormatMoney:function(t){return t/100},FormatRate:function(t){return Math.round(100*t*100)/100+"%"},FormatPay:function(t){return 0==t?"VIP充值":1==t?"线上充值":void 0}},mounted:function(){this.selectedText=this.selectData[this.seActive].text,this.$refs.picker.setData([this.selectData]),this.$refs.picker.setSelectedIndex([this.seActive])},created:function(){var t=this;this.isOpen=!0,window.addEventListener("resize",function(){}),this.$nextTick(function(){t.tabsList(2)})},activated:function(){this.getPackUserData()},destroyed:function(){this.isOpen=!1},methods:{tabsList:function(t){this.tabsIndex=t,this.getData()},getPackUserData:function(){var t=this;this.http({data:{_mod:"jcmanager",_func:"GetPackUserCount",_check:"",_param:{}}}).then(function(a){t.packInfoData=a.data._param})},getData:function(t){var a=this;null==t&&(this.page=1),this.clubDataAllData=[],this.nocontent=!1,this.isloding=!0;var e={_mod:"jcmanager",_func:"GetUserPackList",_check:"",_param:{page:Number(this.page),limit:Number(this.size),week:Number(this.week),find_uid:Number(this.uid)}};this.http({data:e}).then(function(t){a.isloding=!1,a.clubDataAllData=t.data._param.data||[],0==a.clubDataAllData.length?a.nocontent=!0:a.nocontent=!1,1==t.data._param.page&&(a.total=t.data._param.total,a.sumpage=Math.ceil(a.total/a.size)),a.$nextTick(function(){a._initHeight(a.tabsIndex)})})},_initHeight:function(t){if(this.isOpen){if(!this.$refs.tabsH2||!this.$refs.wrapH2)return;if(2==t)return this.$refs.wrapH2.style.height=this.$refs.tabsH2.offsetHeight+2+"px"}},pagelist:function(t){t.target.value!=this.size&&(this.size=t.target.value,this.page=1,this.getData())},pageprev:function(){if(1==this.page)return this.popupFn("已经第一页啦");this.page--,this.getData(this.page)},pagenext:function(){if(this.page>=this.sumpage)return this.popupFn("已经最后一页啦");this.page++,this.getData(this.page)},showPicker:function(){this.$refs.picker.show()},handleSelect:function(t){this.selectedText=t[2][0],this.week=this.selectData[t[1][0]].value,this.getData()},showPayDetail:function(t,a){this.modalPayDetail.show=!0,this.modalPayDetail.page=1,this.modalPayDetail.total=0,this.modalPayDetail.sumpage=0,this.modalPayDetail.uid=t,this.modalPayDetail.name=a,this.getUserPay()},getUserPay:function(){var t=this;this.modalPayDetail.payData=[],this.modalPayDetail.isloding=!0;var a={_mod:"jcmanager",_func:"GetPackUserPay",_check:"",_param:{page:Number(this.modalPayDetail.page),limit:this.modalPayDetail.limit,week:Number(this.week),uid:Number(this.modalPayDetail.uid)}};this.http({data:a}).then(function(a){t.modalPayDetail.isloding=!1,t.modalPayDetail.payData=a.data._param.data||[],t.modalPayDetail.total=a.data._param.total||0,t.modalPayDetail.sumpage=Math.ceil(t.modalPayDetail.total/t.modalPayDetail.limit)})},payPageprev:function(){if(1==this.modalPayDetail.page)return this.popupFn("已经第一页啦");this.modalPayDetail.page--,this.getUserPay()},payPagenext:function(){if(this.modalPayDetail.page>=this.modalPayDetail.sumpage)return this.popupFn("已经最后一页啦");this.modalPayDetail.page++,this.getUserPay()},popupFn:function(t){Object(s.a)({type:"toast",msg:t})}},components:{Page:l.a,Header:n.a,ScrollxData:c.a,Picker:o.a,Card:r.a}},u={render:function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("div",{staticClass:"main"},[e("Header",{attrs:{title:t.$route.meta.title}}),t._v(" "),e("div",{staticClass:"pack-card"},[e("div",{staticClass:"line-row"},[e("li",{staticClass:"flex flex-justify-content"},[e("Card",{staticClass:"item",attrs:{title:"渠道玩家人数",value:t.packInfoData.count}}),t._v(" "),e("Card",{staticClass:"item",attrs:{title:"一级代理人数",value:t.packInfoData.under_count}})],1)]),t._v(" "),e("div",{staticClass:"line-row"},[e("li",{staticClass:"flex flex-justify-content"},[e("Card",{staticClass:"item",attrs:{title:"代理团队人数",value:t.packInfoData.team_count}}),t._v(" "),e("Card",{staticClass:"item",attrs:{title:"本周新增人数",value:t.packInfoData.week_count}}),t._v(" "),e("Card",{staticClass:"item",attrs:{title:"当前玩家账户余额",value:t._f("FormatMoney")(t.packInfoData.total_point)}})],1)])]),t._v(" "),e("div",{staticClass:"searchbar"},[e("ul",{staticClass:"list"},[e("li",{staticClass:"item flex"},[e("div",{staticClass:"label"},[t._v("时间")]),t._v(" "),e("div",{staticClass:"selectDate",on:{click:t.showPicker}},[e("p",[t._v(t._s(t.selectedText))]),e("i")]),t._v(" "),e("picker",{ref:"picker",attrs:{"selected-index":t.selectedIndex[0],title:"快速选择时间"},on:{select:function(a){t.handleSelect(arguments)}}}),t._v(" "),e("div",{staticClass:"label uid"},[t._v("玩家ID")]),t._v(" "),e("input",{directives:[{name:"model",rawName:"v-model",value:t.uid,expression:"uid"}],staticClass:"flex-1",attrs:{type:"tel",placeholder:"查询玩家ID"},domProps:{value:t.uid},on:{input:function(a){a.target.composing||(t.uid=a.target.value)}}}),t._v(" "),e("span",{staticClass:"search flex-vertical flex-pack-center",on:{click:t.getData}},[e("p",[t._v("查询")])])],1)])]),t._v(" "),2==t.tabsIndex?e("div",{ref:"wrapH2",staticClass:"data-wrap"},[e("ul",{ref:"tabsH2",staticClass:"datalist-left"},[e("li",{staticClass:"name"},[e("div",{staticClass:"flex-center flex-justify-content"},[t._v("玩家昵称")]),t._v(" "),t._l(t.clubDataAllData,function(a,s){return e("div",{key:s,staticClass:"flex-center flex-justify-content"},[t._v(" "+t._s(a.nickname)+" ")])})],2)]),t._v(" "),e("ScrollxData",{attrs:{scrollxData:t.clubDataAllData}},[e("ul",{staticClass:"datalist-right-h"},[e("li",{staticClass:"flex-center name"},t._l(t.tabsLabel,function(a,s){return e("div",{key:s,staticClass:"flex-center flex-justify-content"},[e("i"),t._v(t._s(a))])})),t._v(" "),t._l(t.clubDataAllData,function(a,s){return e("li",{key:s,staticClass:"flex"},[e("div",{staticClass:"flex-center flex-justify-content"},[t._v(t._s(a.uid))]),t._v(" "),e("div",{staticClass:"flex-center flex-justify-content"},[t._v(t._s(a.level)+"级")]),t._v(" "),e("div",{staticClass:"flex-center flex-justify-content color-blue underline",on:{click:function(e){t.showPayDetail(a.uid,a.nickname)}}},[t._v(t._s(t._f("FormatMoney")(a.pay_point)))]),t._v(" "),e("div",{staticClass:"flex-center flex-justify-content"},[t._v(t._s(t._f("FormatMoney")(a.point)))]),t._v(" "),e("div",{staticClass:"flex-center flex-justify-content color-yellow"},[t._v(t._s(t._f("FormatMoney")(a.under_record)))]),t._v(" "),e("div",{staticClass:"flex-center flex-justify-content color-yellow"},[t._v(t._s(t._f("FormatMoney")(a.team_record)))]),t._v(" "),e("div",{staticClass:"flex-center flex-justify-content"},[t._v(t._s(t._f("FormatMoney")(a.inherit_record)))]),t._v(" "),e("div",{staticClass:"flex-center flex-justify-content"},[t._v(t._s(t._f("FormatMoney")(a.commi)))]),t._v(" "),e("div",{staticClass:"flex-center flex-justify-content"},[t._v(t._s(a.team_user))]),t._v(" "),e("div",{staticClass:"flex-center flex-justify-content"},[t._v(t._s(a.ctime))]),t._v(" "),1!=a.status?e("div",{staticClass:"flex-center flex-justify-content color-green"},[t._v(t._s(t._f("FormatStatus")(a.status)))]):t._e(),t._v(" "),1==a.status?e("div",{staticClass:"flex-center flex-justify-content color-red"},[t._v(t._s(t._f("FormatStatus")(a.status)))]):t._e()])})],2)])],1):t._e(),t._v(" "),e("div",{directives:[{name:"show",rawName:"v-show",value:t.nocontent,expression:"nocontent"}],staticClass:"nocontent"},[t._v("暂无数据")]),t._v(" "),t.isloding?e("div",{staticClass:"nocontent"},[e("i",{staticClass:"fa fa-spinner fa-pulse"}),t._v("拼命加载中...\n    ")]):t._e(),t._v(" "),e("page",{attrs:{total:t.total,sumpage:t.sumpage,size:t.size,page:t.page},on:{pageprev:t.pageprev,pagenext:t.pagenext,pagelist:t.pagelist}}),t._v(" "),t.modalPayDetail.show?e("div",{staticClass:"modal-detail"},[e("div",{staticClass:"modal-container"},[e("div",{staticClass:"modal-header"},[e("h2",[t._v("充值明细")]),t._v(" "),e("div",{staticClass:"modal-close",on:{click:function(a){t.modalPayDetail.show=!1}}})]),t._v(" "),e("div",{staticClass:"info"},[e("span",[t._v("玩家昵称："+t._s(t.modalPayDetail.name))]),t._v("   "),e("span",[t._v("玩家ID："+t._s(t.modalPayDetail.uid))])]),t._v(" "),e("div",{directives:[{name:"show",rawName:"v-show",value:t.modalPayDetail.payData.length,expression:"modalPayDetail.payData.length"}],staticClass:"data"},[e("li",{staticClass:"flex-center name"},t._l(t.modalPayDetail.payCol,function(a,s){return e("div",{key:s,staticClass:"flex-center flex-justify-content"},[e("i"),t._v(t._s(a))])})),t._v(" "),t._l(t.modalPayDetail.payData,function(a,s){return e("li",{key:s,staticClass:"flex"},[e("div",{staticClass:"flex-center flex-justify-content"},[t._v(t._s(a.orderNo))]),t._v(" "),e("div",{staticClass:"flex-center flex-justify-content"},[t._v(t._s(t._f("FormatMoney")(a.point)))]),t._v(" "),e("div",{staticClass:"flex-center flex-justify-content"},[t._v(t._s(a.ctime))]),t._v(" "),e("div",{staticClass:"flex-center flex-justify-content"},[t._v(t._s(t._f("FormatPay")(a.payType)))])])})],2),t._v(" "),e("div",{directives:[{name:"show",rawName:"v-show",value:!t.modalPayDetail.payData.length,expression:"!modalPayDetail.payData.length"}],staticClass:"nocontent"},[t._v("暂无数据")]),t._v(" "),t.modalPayDetail.isloding?e("div",{staticClass:"nocontent"},[e("i",{staticClass:"fa fa-spinner fa-pulse"}),t._v("拼命加载中...\n            ")]):t._e(),t._v(" "),e("page",{attrs:{total:t.modalPayDetail.total,sumpage:t.modalPayDetail.sumpage,page:t.modalPayDetail.page,isShowLimit:!1},on:{pageprev:t.payPageprev,pagenext:t.payPagenext}})],1)]):t._e()],1)},staticRenderFns:[]};var f=e("VU/8")(d,u,!1,function(t){e("15mY")},"data-v-489361a6",null);a.default=f.exports}});