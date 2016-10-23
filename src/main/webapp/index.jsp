<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
<title>酷么登录</title>
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" media="screen" />
<link rel="stylesheet" type="text/css" href="css/4583e96cf1aaa3861ba8863a8077ca48_1.css" />
<link rel="stylesheet" type="text/css" href="css/more1280.css" id="screenCss" />
<link href="css/header.css" rel="stylesheet" type="text/css">
<link href="css/iconfont.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet"  type="text/css"/>
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="js/jquery-2.1.1.js"></script>
<script language="javascript" type="text/javascript" src="js/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="js/index.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/e3203a9deb7e7411424217cfb2737eba.js"></script>
<script type="text/javascript">
var APP_ROOT = '';
var LOADER_IMG = 'img/lazy_loading.gif';
var ERROR_IMG = 'img/image_err.gif';
var send_span = 6000;
var __HASH_KEY__ = "kaodxiEQXJwveJmFSOGVYSLcBQWyPyBVuTjozjrnjoHvaBISQy";
</script>
<style type="text/css">
	.zc_phone_box:hover>img{
		display: block;
	}
</style>
</head>
<body style="overflow: hidden;">
<div class="header" id="header_nav_top">
  <div class="header-top">
    <!--<a href="javascript:check_tg();" class="item">管理平台+</a>-->
    <input type="hidden" name="check_login" value="">
    <div class="loginbar">
      <div class="login_tip"> <span> <a title="登录" href="login.html" style="padding: 0 6px;color: white; " id="show_pop_login">登录</a> <i class="line"></i> <a href="login_register" title="注册" style="padding: 0 6px;color: white; ">注册</a> <a href="javascript:void(0);" id="zc_phone" class="zc_phone pr"> &nbsp;<s class="icon_arrow icon_arrow_down"></s> </a> </span>
        <div id="zc_phone_drop" style="position:absolute; display:none;">
          <div class="zc_phone_drop">
            <div class="zc_phone_box"> <img src="img/566e40f5d227c.png" alt="手机端" /> </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="header_list" >
    <div class="row">
      <div class="logo" style="width: auto;"> <img src="img/kume1.png" style="height: 80%;margin:auto 0;float: left;padding-top: 5px;padding-left:5px;margin-right: 5px;margin-top: 10px;">
        <!--<span style="font-size: 12px;color: #fff;float: left;width: auto;padding-top: 15px;">酷么，物联售卖开创者</span>-->
      </div>
      <ul class="nav ">
        <li> <a href="#" class="" title="投资服务平台" style="color: white;font-size: 18px;">投资服务平台<span></span></a> </li>
        <li> <a href="#" class="" title="酷SAAS平台" style="color: white;font-size: 18px;">酷SAAS平台<span></span></a> </li>
        <li> <a href="#" class="" title="广告平台" style="color: white;font-size: 18px;">广告平台<span></span></a> </li>
      </ul>
    </div>
  </div>
</div>
<div class="clearfloat"></div>
<!-- 置顶的导航条  -->
<div class="headerfix hidden">
  <div class="header-bom1">
    <div class="header">
      <div class="header-top">
        <!--<a href="javascript:check_tg();" class="item">发起项目++</a>-->
        <input type="hidden" name="check_login" value="">
        <div class="loginbar">
          <div class="login_tip"> <span> <a title="登录" href="login.html" style="padding: 0 6px; " id="show_pop_login">登录</a> <i class="line"></i> <a href="login_register" title="注册" style="padding: 0 6px; ">注册</a> <a href="javascript:void(0);" id="zc_phone" class="zc_phone pr"> &nbsp;<s class="icon_arrow icon_arrow_down"></s> </a> </span>
            <div id="zc_phone_drop" style="position:absolute; display:none;">
              <div class="zc_phone_drop">
                <div class="zc_phone_box"> <img src="img/566e40f5d227c.png" alt="手机端" /> </div>
              </div>
            </div>
          </div>
        </div>
        <!--<div class="search-button">
							<i class="sea iconfont">&#xe609;</i>
						</div>-->
      </div>
      <div class="header_list">
        <div class="logo-1"> <img src="img/kumelogo.png"> </div>
        <div class="row">
          <ul class="nav ">
            <li> <a href="#" class="" title="投资服务平台" style="color: white;font-size: 16px;">投资服务平台<span></span></a> </li>
            <li> <a href="#" class="" title="酷SAAS平台" style="color: white;font-size: 16px;">酷SAAS平台<span></span></a> </li>
            <li> <a href="#" class="" title="广告平台" style="color: white;font-size: 16px;">广告平台<span></span></a> </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
	(function(){
		if(!($(".zc_phone_drop").children().length)){
			$(".zc_phone").remove();
		}

//		var iWinWidth = $(window).width();  // 获取当前屏幕分辨率
//	    if(iWinWidth <= 1280){               // 小于等于1280更改css样式路径
//	        $("#screenCss").attr("href","https://bizhongchou.com/app/Tpl/bzc/css/common_css/less1280.css");
//	    }
	})();
	$(function(){
		$(".search_cate").bind('click',function(){
			$(this).attr("checked",true).addClass("cur").siblings().attr("checked",false).removeClass("cur");
			$("input[name='type']").val($(this).attr("livalue"));
		});
		
		//解决input中placeholder值在ie中无法支持的问题
		var doc=document,inputs=doc.getElementsByTagName('input'),supportPlaceholder='placeholder'in doc.createElement('input'),placeholder=function(input){var text=input.getAttribute('placeholder'),defaultValue=input.defaultValue;
		if(defaultValue==''){
			input.value=text}
			input.onfocus=function(){
				if(input.value===text){
				this.value=''
				}
			};
			input.onblur=function(){
				if(input.value===''){
					this.value=text
				}
			}
		};
		if(!supportPlaceholder){
			for(var i=0,len=inputs.length;i<len;i++){
				var input=inputs[i],text=input.getAttribute('placeholder');
				if(input.type==='text'&&text){
					placeholder(input)
				}
			}
		}
	});

</script>
<link href="css/login.css" rel="stylesheet" type="text/css">
<div class="content_logfix" >
  <div class="content_log">
    <div class="login_title">登录</div>
    <form method="post" name="regfrm" id="regfrm">
      <p class="form_style1"> <i class="icon iconfont4 ">&#xe605;</i>
        <input type="text" name="mobile" id="name" required placeholder ="手机号" />
        <!-- <button class="btn_yzm">发送验证码</button> -->
      </p>
      <p class="form_style1"> <i class="icon iconfont4 ">&#xe628;</i>
        <input type="password" name="user_pwd" id="pswd" required placeholder ="请输入登录密码"/>
      </p>
      <p class="form_style4">
        <input type="submit" value="登录" onclick="validatemobile()" >
        <a href="login_register"  >注册</a></p>
      <div class="loginicon"> <a href="" class="p1">忘记密码？</a> <i class="iconfont" title="新浪api登录接口">
      <a href="" title='新浪api登录接口'><i class='iconfont' title='新浪api登录接口'>&#xe66e;</i></a>&nbsp;</i><i class="iconfont" title="微信登录"><a href="" id='weixin_login'  title='微信登录'><i class='iconfont' title='微信登录'>&#xe7f0;</i></a>&nbsp;</i><i class="iconfont" title="QQv2登录插件"><a href="" title='QQv2登录插件'><i class='iconfont' title='QQ登录'>&#xf001d;</i></a>&nbsp;</i> </div>
    </form>
  </div>
</div>
<div class="_height" style="background: black;z-index: -1;background-image: radial-gradient(ellipse farthest-corner at center top, #000d4d 0%, #000105 100%);position: absolute;top: 0;">
  <canvas id="canv" width="1920" height="373">
    <!--原本height:253;没有mt-120px -->
  </canvas>
</div>
<div class="foot" >
  <div class="footer"style="height: 50px;line-height: 50px;background: rgba(0,0,0,.5);font-size:12px;">
    <p class="fp">Copyright©2016 www.coolmall.cc 酷么 All Rights Reserved. 杭州腾晖智能科技有限公司 浙ICP备14018827号</p>
    <!-- <p class="fp">浙ICP备14013035号-1</p> -->
  </div>
</div>
<div class="zc_phone_drop" style="position: absolute; z-index: 99999; top: 49px; left: 1241.14px; display: none; overflow: hidden; height: 80px; padding-top: 10px; margin-top: 0px; padding-bottom: 10px; margin-bottom: 0px;">
  <div class="zc_phone_box"> <img src="img/566e40f5d227c.png" alt="手机端"> </div>
</div>
</body>
<script src="js/stat.js"></script>

<script type="text/javascript">
function validatemobile() 
{ 	
	
	var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
	if(!myreg.test($("#name").val())) 
	{ 
	    alert('请输入有效的手机号码！'); 
	    return; 
	} 
	  var name = document.getElementById("pswd").value.replace(/[]/g,"");//把所有空格去掉
      if(name.length==0||name=="点击"){
              alert("密码不能为空!");
              return ; 
      }else
            login();
} 

function login() {
		//1、获取帐号
	    var name = document.getElementById("name").value.replace(/[]/g,"");//把所有空格去掉
		var pswd = document.getElementById("pswd").value.replace(/[]/g,"");//把所有空格去掉
			//2、校验
			$.ajax({
				url : "login_loginCheck.action",
				data : {
					"user.mobile" : name,
					"user.password" : pswd					
				},
				type : "post",
				async : false,//
				success : function(msg) {
					if(msg=="loginfail"){
						alert('输入的账号密码错误,请确认！');
						return false;
					}
					else{
					   doAction();
					 }
				}
			});	

	}
	
	function  doAction(){
		document.forms[0].action = "account_center";
		document.forms[0].submit(); 
    }
</script>
</html>
