var channelID = 0
var inviteCode = ''
var appStr = ''
var proMode = 1
window.onload = function(){
	appStr = getQueryString('app')
	channelID = getQueryString('ch')
	inviteCode = getQueryString('ic')
	if (inviteCode !='' && inviteCode !=null){
		$("#refereeID").val(inviteCode)
	}
	getPackRegInfo(function(res){
		if (res._errno == undefined){
			proMode = res._param.ext_mode || 1
			if (proMode == 0 || proMode == 2){
				$(".tip").css("display","inline")
			}
		}
	})
	createSelectOpt()
    if (channelID == '' || channelID==null || Number(channelID) == null || isNaN(channelID)) return
    reqClick();
}

function getPackRegInfo(callback){
	var obj = {
		"pack_no":isNaN(channelID)? 0 : Number(channelID)
	}
	ajaxHttp('PreRegInfo',obj,function(res){
		if (callback){
			callback(res);
		}
    })
}

function createSelectOpt(){
	var select = $('#AreaCode-Select')[0]
	var cfg = getCountryCfg()
	for (var i =0;i< cfg.length;i++){
		var ele = cfg[i]
		select.options.add(new Option(ele.phone_code + "\xa0\xa0\xa0\xa0\xa0\xa0\xa0\xa0" + ele.cn, ele.phone_code))
	}
}

var sendWorking = false;
$('body').on('click', '.btn-code', function(e) {
	e.preventDefault();
	if (sendWorking) return;
	sendWorking = true;
	getPhoneVerifyCode(function(res){		//debug es6才支持=>
		isShowLoading(false);
		if (res._errno == undefined){
			console.log('发送验证码成功！')
			timeRunFuc(60);
		}
		else {
			sendWorking = false;
		}
	});
});

var interval = null;
function timeRunFuc(timeEnd){
	function func(){
		if (timeEnd == 0){
			sendWorking = false;
			clearInterval(interval);
			$('.time-out').css('visibility', 'hidden');
			$('.btn-code').removeClass("gray");
		}
		timeEnd -= 1;
		$('.time-out').text('('+ timeEnd +')');
	}
	$('.time-out').text('('+ timeEnd +')');
	$('.time-out').css('visibility', 'visible');
	$('.btn-code').addClass("gray");
	interval = setInterval(func,1000);
}

function reqClick(){
	var obj = {
		"pack_no": Number(channelID),
		"divice_id": "",
		"ip": ""
	}
	ajaxHttp('ClickPack', obj, function(res){
    })
}

function getPhoneVerifyCode(callback){
	var phone = $("#phone").val();
	var aCode = $('#AreaCode-Select').val();
	if (phone=='' || aCode==''){
		sendWorking = false;
		return alert('请输入账号信息！')
	}

	isShowLoading(true);
	var obj = {
		"phone": phone,
		"acode": dealAreaCodeStr(aCode),
		"appid": 12,
		"type": 1
	}
	ajaxHttp('GetPhoneVerifyCode',obj,function(res){
		if (callback){
			callback(res);
		}
    })
}

function dealAreaCodeStr(str){
	var s1 = str.replace("+", "");
	if (s1 === '86') s1=''
	return s1
}

var submitWorking = false
$('body').on('click', '.btn-req' ,function(e) {
	e.preventDefault();
	if (submitWorking) return;
	submitWorking = true;
	submitRegister(function(res){
		isShowLoading(false);
		if (res._errno == undefined){
			$(".modal").css("display","inline")
			// var proMode = res._param.ext_mode
			if (proMode == 1){	//app
				$(".btn-login").css("display","none")
				$(".btn-down").css("display","inline")
			}
			else if(proMode == 2){	//web
				$(".btn-down").css("display","none")
				$(".btn-login").css("display","inline")
			}
			else{
				$(".btn-down").css("display","inline")
				$(".btn-login").css("display","inline")
			}
		}
		submitWorking = false;
	});
});

function submitRegister(callback){
	var phone = $("#phone").val();
	var aCode = $('#AreaCode-Select').val();
	var refereeID = $("#refereeID").val();
	var name = $("#name").val();
	var verifyCode = $("#verifyCode").val();
	var pwd = $("#pwd").val();
	if (phone=='' || aCode=='' || name=='' || pwd=='' || verifyCode==''){
		submitWorking = false;
		return alert('请输入账号信息！')
	}
	
	isShowLoading(true);
	var url = window.location.href
	var obj = {
		"phone": phone,
		"acode": dealAreaCodeStr(aCode),
		"appid": 12,
		"pack": isNaN(channelID)? 0 : Number(channelID),
		"nickname": name,
		"code": verifyCode,
		"pwd": md5(pwd),
		"invite_code": isNaN(refereeID)? 0 :Number(refereeID),
		"reg_info": encodeURI(url)
	}
	ajaxHttp('UserRegister',obj,function(res){
		if (callback){
			callback(res);
		}
    })
}

$('body').on('click', '.btn-login' ,function(e){
	goToWebGame();
})

$('body').on('click', '.btn-down' ,function(e){
	goToDownload();
})

$('body').on('click', '.url-link' ,function(e){
	goToWebGame();
})

function goToWebGame(){
	var url = getGameUrl();
	var exist = false;
	if (url.indexOf('?') > 0){
		exist = true;
	}
	var app = appStr || getAppStr();
	var cStr = ''
	if (channelID == '' || channelID==null || Number(channelID) == null || isNaN(channelID)) {

	}
	else{
		cStr = '&ch=' + channelID
	}
	window.location.href = url + (exist && '&' || '?') + 'app=' + app + cStr;
}

function goToDownload(){
	var url = getDownloadUrl();
	var app = appStr || getAppStr();
	var cStr = ''
	if (channelID == '' || channelID==null || Number(channelID) == null || isNaN(channelID)) {
		
	}
	else{
		cStr = '&ch=' + channelID
	}
	window.location.href = url + '?app=' + app + cStr;
}

function ajaxHttp(method, param, callback){
	var apiurl = getFuncUrl();
	var _param = JSON.stringify(param);
    $.ajax({
        dataType: 'json',
        type: "POST",
        data:  '{"_func":"'+method+'","_check":"","_mod":"jccommon","_param":'+_param+'}',
        url: apiurl,
        // contentType: 'application/x-www-form-urlencoded',       //data传输会转成json，默认即是
        success: function(res) {
			if (res._errno != undefined) {
				alert(res._errstr)
			}
            callback(res)
        },
        error: function(res) {
			if (res.status && typeof(res.responseText) == 'string') {
				try{
					var param = JSON.parse(aesDecrypt(res.responseText))
					if (param._errno != undefined) {
						alert(param._errstr)
					}
					callback(param)
				}
				catch(err) {
					console.error(err)
				}
			}
			else{
				console.error(res)
			}
        }
    });
}

function getQueryString(name) {
    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)'),
        r = window.location.search.substr(1).match(reg)
    if (r != null) return decodeURIComponent(r[2])
    return null
}

function isShowLoading(state){
	$(".pop-loading").css("display",state? "inline" : "none")
}

function aesDecrypt(ciphertext) {
	var key = CryptoJS.enc.Utf8.parse("yaoxing8901234561234567890123488");
	var iv = CryptoJS.enc.Utf8.parse("yaoxing890123488");
	var decrypted = CryptoJS.AES.decrypt(ciphertext, key, {
		iv: iv,
		mode: CryptoJS.mode.CBC,
		padding: CryptoJS.pad.NoPadding
	});
	return decrypted.toString(CryptoJS.enc.Utf8);
}
// 112061