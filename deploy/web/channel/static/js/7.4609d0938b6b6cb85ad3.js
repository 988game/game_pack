webpackJsonp([7],{RVOx:function(t,e){},iluT:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var s=a("QDJF"),i=a("vR+E"),c=a("pMNZ"),l=a("teIl"),r=a("/bMK"),n={name:"member",data:function(){return{selectData:[{text:"上周",value:1},{text:"上上周",value:2},{text:"上上上周",value:3}],selectedText:"",selectedIndex:[[0]],seActive:0,week:1,curData:[],timeStr:""}},filters:{FormatMoney:function(t){return t/100},FormatRate:function(t){return Math.round(100*t*100)/100+"%"}},mounted:function(){this.selectedText=this.selectData[this.seActive].text,this.$refs.picker.setData([this.selectData]),this.$refs.picker.setSelectedIndex([this.seActive]);var t=Object(i.p)(this.week);this.timeStr=Object(i.h)(t[0])+"~"+Object(i.h)(t[1])},activated:function(){var t=this;this.$nextTick(function(){t.getData()})},methods:{getData:function(){var t=this,e={_mod:"jcmanager",_func:"GetPackBalance",_check:"",_param:{week:Number(this.week)}};this.http({data:e}).then(function(e){t.curData=e.data._param})},showPicker:function(){this.$refs.picker.show()},handleSelect:function(t){this.selectedText=t[2][0],this.week=this.selectData[t[1][0]].value;var e=Object(i.p)(this.week);this.timeStr=Object(i.h)(e[0])+"~"+Object(i.h)(e[1]),this.getData()},popupFn:function(t){Object(s.a)({type:"toast",msg:t})}},components:{Page:c.a,Header:l.a,Picker:r.a}},o={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"main"},[a("Header",{attrs:{title:t.$route.meta.title}}),t._v(" "),a("div",{staticClass:"searchbar"},[a("ul",{staticClass:"list"},[a("li",{staticClass:"item flex"},[a("div",{staticClass:"label"},[t._v("时间")]),t._v(" "),a("div",{staticClass:"selectDate",on:{click:t.showPicker}},[a("p",[t._v(t._s(t.selectedText))]),a("i")]),t._v(" "),a("picker",{ref:"picker",attrs:{"selected-index":t.selectedIndex[0],title:"快速选择时间"},on:{select:function(e){t.handleSelect(arguments)}}}),t._v(" "),a("span",{staticClass:"time-tag"},[t._v(t._s(t.timeStr))])],1)])]),t._v(" "),a("div",{staticClass:"data"},[a("div",{staticClass:"mode-1"},[a("h3",[t._v("业绩分成模式")]),t._v(" "),a("div",{staticClass:"row flex-center flex-justify-content"},[a("div",{staticClass:"item flex-1"},[a("h4",[t._v("总业绩")]),t._v(" "),a("div",{staticClass:"color-yellow"},[t._v(t._s(t._f("FormatMoney")(t.curData.record)))])]),t._v(" "),a("div",{staticClass:"item flex-1"},[a("h4",[t._v("玩家佣金分成")]),t._v(" "),a("div",{staticClass:"color-yellow"},[t._v(t._s(t._f("FormatMoney")(t.curData.commi)))])])]),t._v(" "),a("div",{staticClass:"ps"},[a("span",{staticClass:"color-red"},[t._v("业绩分成模式应得")]),t._v("="),a("br"),t._v(" "),a("span",{staticClass:"color-green"},[t._v("总业绩*渠道业绩分成定档（"+t._s(t.curData.record_commi)+"元/万）")]),t._v("-玩家佣金分成\n            ")])]),t._v(" "),a("div",{staticClass:"mode-1"},[a("h3",[t._v("合伙坐庄模式")]),t._v(" "),a("div",{staticClass:"row flex-center flex-justify-content"},[a("div",{staticClass:"item flex-1"},[a("h4",[t._v("渠道盈亏")]),t._v(" "),a("div",{staticClass:"color-yellow"},[t._v(t._s(t._f("FormatMoney")(t.curData.bet-t.curData.hit-t.curData.commi)))])])]),t._v(" "),a("div",{staticClass:"row flex-center flex-justify-content"},[a("div",{staticClass:"item flex-1"},[a("h4",[t._v("投注金额")]),t._v(" "),a("div",{staticClass:"color-yellow"},[t._v(t._s(t._f("FormatMoney")(t.curData.bet)))])]),t._v(" "),a("div",{staticClass:"item flex-1"},[a("h4",[t._v("返奖金额")]),t._v(" "),a("div",{staticClass:"color-yellow"},[t._v(t._s(t._f("FormatMoney")(t.curData.hit)))])])]),t._v(" "),a("div",{staticClass:"ps"},[a("span",{staticClass:"color-red"},[t._v("合伙坐庄模式应得")]),t._v("="),a("br"),t._v("\n                （"),a("span",{staticClass:"color-green"},[t._v("投注金额")]),t._v("-返奖金额-玩家佣金分成）* 坐庄模式分成比率（"+t._s(t._f("FormatRate")(t.curData.banker_ratio))+"）\n            ")])])])],1)},staticRenderFns:[]};var v=a("VU/8")(n,o,!1,function(t){a("RVOx")},"data-v-6259b8cb",null);e.default=v.exports}});