<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
<title>酷么注册</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/4583e96cf1aaa3861ba8863a8077ca48_1.css" />
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/favicon.ico" media="screen" />
<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/iconfont.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
<script type="text/javascript">
var APP_ROOT = '';
var LOADER_IMG = 'img/lazy_loading.gif';
var ERROR_IMG = 'img/image_err.gif';
var send_span = 6000;
var __HASH_KEY__ = "kaodxiEQXJwveJmFSOGVYSLcBQWyPyBVuTjozjrnjoHvaBISQy";
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/35ee753e6960c5116935ba5907b7b91a.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<style type="text/css">
			body {
				background: #f3f3f3;
				width: 100%;
			}
			
			.dlmain {
				background: url(img/reglog_bg.gif) repeat-y;
			}
			
			.dlr1 {
				margin-bottom: 50px
			}
			
			.J_wrap {
				position: relative;
				z-index: 3;
			}
			
			.my_shadow_bg {
				position: relative;
				z-index: 2;
			}
		</style>
</head>
<body style="overflow: hidden;">
<div class="header" id="header_nav_top">
  <div class="header-top">
    <input type="hidden" name="check_login" value="">
    <div class="loginbar">
      <div class="login_tip"> <span> <a title="登录" href="index.jsp" style="padding: 0 6px;color: white; " id="show_pop_login">登录</a> <i class="line"></i> <a href="" title="注册" style="padding: 0 6px;color: white; ">注册</a>
       <a href="javascript:void(0);" id="zc_phone" class="zc_phone pr"> &nbsp;<s class="icon_arrow icon_arrow_down"></s> </a> </span>
        <div id="zc_phone_drop" style="position:absolute; display:none;">
          <div class="zc_phone_drop">
            <div class="zc_phone_box"> <img src="${pageContext.request.contextPath}/img/566e40f5d227c.png" alt="手机端" /> </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="header_list" >
    <div class="row">
      <div class="logo" style="width: auto;"> <img src="${pageContext.request.contextPath}/img/kume1.png" style="height: 80%;margin:auto 0;float: left;padding-top: 5px;padding-left:5px;margin-right: 5px;margin-top: 10px;">
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
        <input type="hidden" name="check_login" value="">
        <div class="loginbar">
          <div class="login_tip"> <span> <a title="登录" href="index.jsp" style="padding: 0 6px; " id="show_pop_login">登录</a> <i class="line"></i> <a href="" title="注册" style="padding: 0 6px; ">注册</a> <a href="javascript:void(0);" id="zc_phone" class="zc_phone pr"> &nbsp;<s class="icon_arrow icon_arrow_down"></s> </a> </span>
            <div id="zc_phone_drop" style="position:absolute; display:none;">
              <div class="zc_phone_drop">
                <div class="zc_phone_box"> <img src="${pageContext.request.contextPath}/img/566e40f5d227c.png" alt="手机端" /> </div>
              </div>
            </div>
          </div>
        </div>
        <!--<div class="search-button">
							<i class="sea iconfont">&#xe609;</i>
						</div>-->
      </div>
      <div class="header_list">
        <div class="logo-1"> <img src="${pageContext.request.contextPath}/img/kumelogo.png"> </div>
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
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css">
<div class="blank"></div>
<style>
			.nav li {
				float: left;
			}
			
			.hidden {
				display: none;
			}
			
			.c {
				color: #690
			}
			
			.c {
				color: #12ADFF;
			}
			
			.control-label {
				width: 70px;
			}
			
			.control-group {
				float: left;
				overflow: visible
			}
			
			.dlmain {
				width: 1000px;
				background: url(img/reglog_bg.gif) #fcfcfc repeat-y;
			}
			
			.tip_box {
				float: left
			}
			
			.holder_tip {
				top: 0;
				left: 0;
			}
			
			.term {
				margin-left: 95px;
			}
			
			body {
				/*background: #fff url('img/register_opacity.jpg') no-repeat;*/
			}
		</style>
<div class="blank20"></div>
<div class="content">
  <div class="login_title">注册</div>
  <form method="post" id="user_register_form" name="user_register_form" class="regfrm">
    <div class="form_style1">
      <input type="hidden" id="image_code" name="image_code" class="textbox f_l" value="0" style="width:50px;margin-right:10px" />
      <img src="${pageContext.request.contextPath}/img/verify.php" id="verify" align="absmiddle" height="41" style="display:none;"> </div>
    <div class="form_style1">
      <div> <i class="icon iconfont6 ">&#xe7eb;</i>
        <input type="text" id="settings-mobile" name="mobile" required placeholder="请输入手机号码11位" autofocus/>
        </p>
      </div>
      <div class="tip_box"></div>
    </div>
    <div class="form_style1">
      <div> <i class="icon iconfont4">&#xe628;</i>
        <input type="password" id="pswd" name="user_pwd" required pattern="[a-z0-9A-Z]{4,30}" placeholder="创建密码" />
      </div>
      <div class="tip_box"></div>
    </div>
    <div class="form_style1">
      <div> <i class="icon iconfont4">&#xe628;</i>
        <input type="password" id="confirm_pswd" name="confirm_user_pwd" required pattern="[a-z0-9A-Z]{4,30}" placeholder="确认密码" />
        </p>
      </div>
      <div class="tip_box"></div>
    </div>
    <div class="form_style1">
      <div> <i class="icon iconfont4 ">&#xe605;</i>
        <input type="text" id="user_code" name="user_code" onchange="doVerifyCode()" required placeholder="推荐码,无推荐码可以不填写" />
      </div>
      <div class="tip_box"></div>
    </div>
    <div>
     
    </div>
    <div class="form_style2 mobile_verify">
      <div> <i class="icon iconfont6">&#xe7eb;</i>
        <input type="text" id="settings-mobile-code" name="verify_coder" required placeholder="手机验证码" />
      </div>
      <div class="tip_box"></div>
      <div class="control-group">
        <input type="button" value="免费获取验证码" class="send_sms_verify ui-button bg_red f_l" id="btn_settings-mobile" rel="ui-button" />
      </div>
    </div>
 
    <div class="blank0"></div>
    <div class="control-group mycontrol-group">
      <div class="bbt_user_message"> <a href="index.jsp">您已有酷么账号？请直接登陆</a> </div>
      <p class="form_style3" style="float:right">
        <input type="submit" value="注册" name="submit_form" id="btn_do_register" onclick="doAdd()">
      </p>
    </div> 
  </form>
</div>
<div class="_height" style="background: black;z-index: -1;background-image: radial-gradient(ellipse farthest-corner at center top, #000d4d 0%, #000105 100%);position: absolute;top: 0;">
  <canvas id="canv" width="1920" height="373">
    <!--原本height:253;没有mt-120px -->
  </canvas>
</div>
<div class="blank20"></div>
<div class="blank"></div>
<div class="footer" pbid="footer" id="J_footer" style="height: 50px;line-height: 50px;background: rgba(0,0,0,.5);">
  <div class="footer-copy">
    <div class="footer-wrap">
      <div class="blank10"></div>
      <div style="color:#FFF;font-size:12px;line-height:40px; text-align:center;font-size: 14px;"> Copyright©2016 www.coolmall.cc 酷么 All Rights Reserved. 杭州腾晖智能科技有限公司 浙ICP备14018827号  </div>
    </div>
  </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/stat.js"></script>
</html>
<script type="text/javascript">
   //检查推荐码
	function doVerifyCode() {
		//1、获取帐号
		var checkCode = $("#user_code").val();
		if (checkCode.length == "") {
		
			return false;
		}
		if (checkCode.length != 6) {
			alert("推荐码格式不正确,请确认！");
			$("#user_code").focus();
			return false;
		}
		if (checkCode != "") {
			//2、校验
			$.ajax({
				url : "register_checkCode.action",
				data : {
					"user.id" : checkCode
				},
				type : "post",
				async : true,
				success : function(msg) {
					if ("false" == msg) {
						//帐号不存在
						alert("推荐吗不存在,请确认!");
						//定焦
						$("#user_code").focus();
					}
				}
			});
		}
	}	

	//手机号码校验
	function validatemobile(o) {
		var pswd =  $("#pswd").val().replace(/[]/g, "");//把所有空格去掉
		var confirm_pwd = $("#confirm_pswd").val().replace(/[]/g, "");//把所有空格去掉
		if (pswd.length == 0 || pswd != confirm_pwd) {
			alert("两次输入的密码不一致");
			return false;
		}
		var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		var settingsmobile = $("#settings-mobile").val();
		if (!myreg.test(settingsmobile)) {
			alert('请输入有效的手机号码！');
			return false;
		}
		time(o);
		doVerify(settingsmobile);

	}

	var wait = 60;
	function time(o) {
		if (wait == 0) {
			o.removeAttribute("disabled");
			o.value = "免费获取验证码";
			wait = 60;
		} else {
			o.setAttribute("disabled", true);
			o.value = "重新发送(" + wait + ")";
			wait--;
			setTimeout(function() {
				time(o)
			}, 1000)
		}
	}
	document.getElementById("btn_settings-mobile").onclick = function() {
		validatemobile(this);
	}
	var phoneVerifyCoder;
	//发送手机验证码
	function doVerify(smobile) {
		//1、获取帐号
		var account = smobile;
		if (account != "") {
			//2、校验
			$.ajax({
				url : "register_verifyCoder.action",
				data : {
					"user.mobile" : account
				},
				type : "post",
				async : true,//
				success : function(msg) {
					if(msg=="cunzai"){
						alert('手机号码已被注册,请更换其它手机号');
						return false;
					}
					else
						phoneVerifyCoder = msg;
				}
			});
		}	

	}
	function doAdd() {
		//获取用户输入的手机校验码
		var mobilecode = $("#settings-mobile-code").val();
		if(mobilecode.length==0)
			{
			  alert('校验码不能为空');
			  return false; 
			 }
		if(mobilecode==phoneVerifyCoder)
			{
		document.forms[0].action = "register_saveUser.action";
		document.forms[0].submit();
			}
		else{
			 alert("校验验证错误");
			 return false; 
		}
	}
</script>

</html>
