<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/jsp/commons/head.jspf" %>
<%@include file="/WEB-INF/jsp/commons/left.jspf" %>
	<script>		
document.getElementById("security_information1").className="current";	
</script>	
					<script type="text/javascript">
(function(){
	var email=$("input[name='s_email']").val() ,
	 	mobile=$("input[name='s_mobile']").val() ,
	 	paypassword=$("input[name='s_paypassword']").val() ,
	 	investor_status=$("input[name='s_investor_status']").val() ,
		s_array=new Array(email,mobile,paypassword,investor_status);
 	for(var i=0; i<s_array.length; i++){
     	if(s_array[i] == "" || s_array[i] == 0 || typeof(s_array[i]) == "undefined"){
          	s_array.splice(i,1);
          	i= i-1;
 		}        
 	}
 	var total_length=4 ,
 		s_array_length=s_array.length ,
 		security_val=((s_array_length/total_length)*100);
	$("#security_val").text(security_val+"%");
	$("#progress").animate({width:security_val+"%"},1000);
})();

(function(){
	$(".menutitle").removeClass(".cur");
	$(".uscont_list").hide();
	$(".uscont_list").each(function(){
		var obj = $(this);
		if(obj.find(".select").length){
			var menutitle = obj.prev(".menutitle");
			obj.show();
			menutitle.addClass("cur");
			menutitle.find(".iconfont_right").hide();
			menutitle.find(".iconfont_down").show();
		}
	});

	$(".homeleft").find(".menutitle").on('click',function(e){
		e.stopPropagation();
		var obj = $(this);
		var hascur = obj.hasClass("cur");
		if(hascur){
			obj.find(".iconfont_down").hide();
			obj.find(".iconfont_right").show();
			obj.removeClass("cur").next(".homemenulist").slideUp(300);
		}
		else{
			obj.find(".iconfont_right").hide();
			obj.find(".iconfont_down").show();
			obj.addClass("cur").next(".homemenulist").slideDown(300);
		}
	});
})();
</script>
<script type="text/javascript">
function saveUsername() 
{ 	
	  var name = document.getElementById("user_new_nick").value.replace(/[]/g,"");//把所有空格去掉
      if(name.length==0||name=="点击"){
              alert("昵称不能为空!");
              return ; 
      }
      if(name.length>20){
              alert("昵称过长无法保存,请重新设定");
              return ; 
      }
     $.ajax({
				url : "saveNick.action",
				data : {
					"userName" : name
								
				},
				type : "post",
				async : false,//
				success : function(msg) {
					if(msg!="success"){
						alert('保存昵称失败,请重新设置！');
						return false;
					}
					else{
					   alert('设置成功！');
					   doAction();
					 }
				}
			});	
} 


	
function  doAction()
{
		document.forms[0].action = "security_information1";
		document.forms[0].submit();     
 }
function updatePass() 
{ 
   var user_old_pwd =$("#user_old_pwd").val();
	   var input_user_pwd =$("#user_pwd").val();
	   var confirm_user_pwd =$("#confirm_user_pwd").val();
	   if(user_old_pwd.length==0||user_old_pwd=="点击"){
              alert("旧密码不能为空!");
              return ; 
      }
       if(input_user_pwd.length==0||input_user_pwd=="点击"){
              alert("新密码不能为空!");
              return ; 
      }
      if(confirm_user_pwd.length==0||confirm_user_pwd=="点击"){
              alert("确认密码不能为空!");
              return ; 
      }
      if(input_user_pwd!=confirm_user_pwd){
              alert("两次密码输入不一致!");
              return ; 
      }
      if(input_user_pwd.length>20){
              alert("密码设置过长无法保存,请重新设定");
              return ; 
      }
     $.ajax({
				url : "updatePass.action",
				data : {
					"userOldPWD" : user_old_pwd,
					"inputUserPWD" : input_user_pwd				
				},
				type : "post",
				async : true,//
				success : function(msg) {
					if(msg=="OldPWDfail"){
						alert('输入的旧密码不正确,请确认！');
						return false;
					}else if(msg!="success"){
					    alert('修改失败,请确认！');
						return false;
					}
					else{
					   alert('修改成功！');	
					   doAction();				 
					 }
				}
			});	
} 

    
	function settingMobile(){
	   var input_old_sms_verify = $("#input_old_sms_verify").val();
       if(input_old_sms_verify.length!=6){          
            alert('验证码输入不正确!');
			return false; 
       }
	  	var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		var settingsmobile = $("#settings-new-mobile").val();
		if (!myreg.test(settingsmobile)) {
			  alert('请输入有效的手机号码！');
			  return false;
		}
	  var input_new_sms_verify = $("#input_new_sms_verify").val();
       if(input_new_sms_verify.length!=6){
            alert('新手机验证码输入不正确!');
			return false; 
       }
     $.ajax({
				url : "updateMobile.action",
				data : {
				    "newPhoneNumber": settingsmobile,				
				    "oldPhoneCode":input_old_sms_verify,
				    "newPhoneCode":input_new_sms_verify
				
				  },
				type : "post",
				async : false,//
				success : function(msg) {
					if(msg=="success"){						   			
						alert("修改成功");//oldcodefail
						doAction();
						}
						else
						alert("修改失败");
			   }
						
				
			});
	}
	
//检查输入的旧手机验证码
     function  new_sms_change(){
       var input_new_sms_verify = $("#input_new_sms_verify").val();
       if(input_new_sms_verify.length!=6){
            alert('新手机验证码输入不正确!');
			return false; 
       }
 }

	
	//发送新手机验证码
	function doNewVerify(obj){
	    var input_old_sms_verify = $("#input_old_sms_verify").val();
       if(input_old_sms_verify.length!=6){          
            alert('验证码输入不正确!');
			return false; 
       }
	  	var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		var settingsmobile = $("#settings-new-mobile").val();
		if (!myreg.test(settingsmobile)) {
			  alert('请输入有效的手机号码！');
			  return false;
		}
		 $.ajax({
				url : "sendNewPhoneCode.action",
				data : {"newPhoneNumber": settingsmobile,
				
				    "oldPhoneCode":input_old_sms_verify
				
				  },
				type : "post",
				async : true,//
				success : function(msg) {
					  if(msg=="oldcodefail"){
							alert("旧手机验证码不正确,发送失败");//oldcodefail							
						}
						else if(msg=="newphonenumfail"){
							alert("新手机已被注册,无法再注册");//oldcodefail
						}
						else if(msg=="fail"){	
						    alert("发送失败");					   			
						//newisold
						}
						else if(msg=="newisold"){	
						    alert("当前手机就是您要修改的手机,无需更改");					   			
						//newisold
						}
						else if(msg==null){	
						    alert("发送失败");
						}						
			   }
						
				
			});
			settime2(obj);
	}
	
	var countdown2=60; 
function settime2(obj) { 
    if (countdown2 == 0) { 
        obj.removeAttribute("disabled");    
        obj.value="免费获取验证码"; 
        countdown2 = 60; 
        return;
    } else { 
        obj.setAttribute("disabled", true); 
        obj.value="重新发送(" + countdown2 + ")"; 
        countdown2--; 
    } 
   setTimeout(function() { 
    settime2(obj) }
    ,1000) 
}
	
	//检查输入的新手机格式
function new_mobile_change(){
	    
		var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		var settingsmobile = $("#settings-new-mobile").val();
		if (!myreg.test(settingsmobile)) {
			  alert('请输入有效的手机号码！');
			  return false;
		}
}
	//检查输入的旧手机验证码
     function  old_sms_change(){
       var input_old_sms_verify = $("#input_old_sms_verify").val();
       if(input_old_sms_verify.length!=6){          
            alert('验证码输入不正确!');
			return false; 
       }
 }
//pass 
	//发送旧手机验证码
	function doOldVerify(obj) {		
			$.ajax({
				url : "sendOldPhoneCode.action",
				data : {"oldPhoneNumber": "188666124" },
				type : "post",
				async : true,//
				success : function(msg) {
					if(msg=="fail"){
					     alert("发送失败");
						}
						else if(msg==null){
						alert("发送失败");
						}						
			   }
						
				
			});
			settime(obj);
			
	}
var countdown=60; 
function settime(obj) { 
    if (countdown == 0) { 
        obj.removeAttribute("disabled");    
        obj.value="免费获取验证码"; 
        countdown = 60; 
        return;
    } else { 
        obj.setAttribute("disabled", true); 
        obj.value="重新发送(" + countdown + ")"; 
        countdown--; 
    } 
   setTimeout(function() { 
    settime(obj) }
    ,1000) 
}
  
</script>

<style>
h3{
	position: relative;
	height: auto;
	margin: 0;
}
/*.security-ul li{
	height: 100px;
	margin-top: 0;
	margin-bottom: 0;
}*/
.security_icon i{
	font-size: 3rem;
}
.small_textbox {
				width: 300px;
				height: 42px;
				padding: 10px;
				line-height: 42px;
			}
			.part{
				min-height: 917px;
			}
</style>
<link href="css/39dcfbdd51c71852893fe3c8c0484f67.css" rel="stylesheet" />
					<div class="part right-part">
						<h2 class="title-header" style="text-align: left;">
				<span class="title-content color-6">安全信息</span>
			</h2>
						<div class="list_conment setting_security">
							<ul class="security-ul">
								<li>
								<s:if test="#session.user.username==null">
									<div class="it cf clearfix">
										<div class="security_icon"><i class="fa fa-user mr10"></i>
										</div>
										<h3>昵称</h3>
                                     
										<p class="f_red">未设置</p>
										
										<div class="update">
											<a href="javascript:void(0);" class="J_setting" id="J_setting_username">设置</a>
										</div>
								
									</div>
								   <div class="setting_box" id="setting-username-box">
                                      <form class="ajax_form_username" id="save_nick">

											<div class="control-group small-control-group">
												<label class="control-label">新昵称:</label>
												<div class="control-text">
													<input type="text" value="" class="small_textbox" id="user_new_nick">
												</div>
											</div>
										
											<div class="blank10"></div>
											<div class="submit_btn_row control-group">
												<label class="control-label"></label>
												<input type="button" value="保存昵称" name="nick" class="ui-button theme_bgcolor" onclick="saveUsername()" id="nick">
										
											</div>
										</form>
									</div>
									</s:if>
									<s:else>
									<div class="it cf clearfix">
										<div class="security_icon"><i class="fa fa-user mr10"></i>
										</div>
										<h3>昵称</h3>
                                     <p><font color="#AAAAAA"><s:property value="#session.user.username"/></font></p>
										
										<div class="update">
											<a href="javascript:void(0);" class="J_setting" id="J_setting_username">修改</a>
										</div>
								
									</div>
								   <div class="setting_box" id="setting-username-box">
                                      <form class="ajax_form_username" action="/settings-save_username.html" id="save_nick">

											<div class="control-group small-control-group">
												<label class="control-label">新昵称:</label>
												<div class="control-text">
													<input type="text" value="" class="small_textbox" id="user_new_nick">
												</div>
											</div>
										
											
											<div class="blank10"></div>
											<div class="submit_btn_row control-group">
												<label class="control-label"></label>
												<input type="button" value="保存昵称" name="nick"  onclick="saveUsername()" class="ui-button theme_bgcolor" id="nick">
											
											</div>
										</form>
									</div>
									
									</s:else>

								</li>
								<li>
									<div class="it cf clearfix">
										<div class="security_icon"><i class="fa fa-unlock-alt"></i></div>
										<h3>登录密码</h3>

										<p>已设置</p>

										<div class="update">
											<a href="javascript:void(0);" class="J_setting" id="J_setting_pwd">修改</a>
										</div>
									</div>
									<div class="setting_box" id="setting-pwd-box">
										<form class="ajax_form_password" action="/settings-save_pass.html" id="save_pass">

											<div class="control-group small-control-group">
												<label class="control-label">旧密码:</label>
												<div class="control-text">
													<input type="password" value="" class="small_textbox" name="user_old_pwd" id="user_old_pwd">
												</div>
											</div>
											<input type="hidden" name="change_pwd" value="1">

											<div class="blank0"></div>
											<div class="control-group small-control-group">
												<label class="control-label">新密码:</label>
												<div class="control-text">
													<input type="password" value="" class="small_textbox" name="user_pwd" id="user_pwd">
												</div>
												<div class="blank0"></div>
											</div>
											<div class="control-group small-control-group">
												<label class="control-label">确认密码:</label>
												<div class="control-text">
													<input type="password" value="" class="small_textbox" name="confirm_user_pwd" id="confirm_user_pwd">
												</div>
											</div>
											<div class="blank10"></div>
											<div class="submit_btn_row control-group">
												<label class="control-label"></label>
												<input type="button" value="保存密码" name="pass" onclick="updatePass()" class="ui-button theme_bgcolor" id="pass">
												<input type="hidden" value="1" name="ajax">
												<input type="hidden" name="setting_pwd" value="1">
											</div>
										</form>
									</div>
								</li>
								<li>
								<s:if test="#session.user.email==null">
									<div class="it cf clearfix">
										<div class="security_icon"><i class="fa fa-envelope-o"></i></div>
										<h3>绑定邮箱</h3>
                                        
										<p class="f_red">未绑定</p>   
										<div class="update">
											<a href="javascript:void(0);" class="J_setting" id="J_setting_email">绑定</a>
										</div>
									</div>
									<div class="setting_box" id="setting-email-box">
										<form class="ajax_form_email" action="/settings-email_binding.html">

											<div class="control-group small-control-group">
												<label class="control-label">新邮箱:</label>
												<div class="control-text">
													<input type="text" value="" class="small_textbox" name="email" id="new_email">
												</div>
												<div class="blank0"></div>
											</div>
											<div class="control-group small-control-group">
												<label class="control-label">邮箱验证码:</label>
												<div class="control-text">
													<input type="text" value="" class="small_textbox mr10" name="email_verify_coder" style="width:165px;" id="input_email_verify_code">
													<input type="button" value="获取验证码" onclick="sendMailCode(this)" class="ui_button send_sms_verify small_send_sms_verify bg_red" id="email_verify_code">
												</div>
											</div>
											<input type="hidden" value="1" name="step">

											<div class="blank10"></div>
											<div class="submit_btn_row control-group">
												<label class="control-label"></label>
												<div class="ui-button theme_bgcolor" rel="green"  onclick="saveToEmail()" >绑定邮箱</div>
												<input type="hidden" value="1" name="ajax">
											</div>
										</form>
									</div>
									</s:if>
									<s:else>
									<div class="it cf clearfix">
										<div class="security_icon"><i class="fa fa-mobile-phone"></i></div>
										<h3>绑定邮箱</h3>

										<p>已绑定</p>
										<div class="update">
											<a href="javascript:void(0)" class="J_setting" id="J_setting_mobile">修改</a>
										</div>

									</div>
									<div class="setting_box" id="setting-mobile-box">
										<form class="ajax_form_mobile" >

											<div class="control-group small-control-group">
												<label class="control-label">原邮箱地址:</label>
												<div class="control-text"><s:property value="#session.user.email.substring(0,3)"/>*****<s:property value="#session.user.email.substring(#session.user.email.length()-5)"/></div>
												<input type="hidden" id="settings-mail-type" name="step" value="2">
												<div class="blank0"></div>
											</div>
											<div class="control-group small-control-group">
												<label class="control-label">原邮箱验证码:</label>
												<div class="control-text">
													<input type="text" value="" class="small_textbox mr10" name="mail_verify_coder" style="width:165px;"  id="input_old_mail_verify">
													<input type="button" value="免费获取邮箱验证码" onclick="doOldMailVerify(this)" class="ui_button send_sms_verify small_send_sms_verify bg_red" id="J_send_old_mail_verify">
												</div>
												<div class="blank0"></div>
											</div>
											<div class="control-group small-control-group">
												<label class="control-label">新邮箱地址:</label>
												<div class="control-text">
													<input type="text" id="settings-new-mail" value="" class="small_textbox" name="new_mail">
												</div>
											</div>
											<div class="control-group small-control-group">
												<label class="control-label">新邮箱验证码:</label>
												<div class="control-text">
													<input type="text" value="" class="small_textbox mr10" name="mailverify_coder" style="width:165px;" id="input_new_mail_verify">
													<input type="button" value="获取新邮箱验证码" class="ui_button send_sms_verify small_send_sms_verify bg_red" onclick="doNewMailVerify(this)" id="J_send_new_mail_verify">
												</div>
												<div class="blank0"></div>
											</div>
											<input type="hidden" name="bind_mobile" value="0">

											<div class="blank10"></div>
											<div class="submit_btn_row control-group">
												<label class="control-label"></label>
												<input type="button" value="提交" name="setting_mobile" onclick="updateSettingMail()"  class="ui-button theme_bgcolor" id="setting_mobile">
												<input type="hidden" value="1" name="ajax">
											</div>
										</form>
									</div>
									</s:else>
								</li>
								<li>
									<div class="it cf clearfix">
										<div class="security_icon"><i class="fa fa-mobile-phone"></i></div>
										<h3>绑定手机</h3>

										<p>已绑定</p>
										<div class="update">
											<a href="javascript:void(0)" class="J_setting" id="J_setting_mobile">修改</a>
										</div>

									</div>
									<div class="setting_box" id="setting-mobile-box">
										<form class="ajax_form_mobile" action="/settings-mobile_binding.html">

											<div class="control-group small-control-group">
												<label class="control-label">原手机号:</label>
												<div class="control-text"><s:property value="#session.user.mobile.substring(0,3)"/>*****<s:property value="#session.user.mobile.substring(8)"/></div>
												<input type="hidden" id="settings-mobile-type" name="step" value="2">
												<div class="blank0"></div>
											</div>
											<div class="control-group small-control-group">
												<label class="control-label">验证码:</label>
												<div class="control-text">
													<input type="text" value="" class="small_textbox mr10" name="verify_coder" style="width:165px;" onchange="old_sms_change()" id="input_old_sms_verify">
													<input type="button" value="免费获取验证码" onclick="doOldVerify(this)" class="ui_button send_sms_verify small_send_sms_verify bg_red" id="J_send_old_sms_verify">
												</div>
												<div class="blank0"></div>
											</div>
											<div class="control-group small-control-group">
												<label class="control-label">新机号:</label>
												<div class="control-text">
													<input type="text" id="settings-new-mobile" value="" class="small_textbox" name="mobile" id="new_mobile" onchange="new_mobile_change()">
												</div>
											</div>
											<div class="control-group small-control-group">
												<label class="control-label">新手机验证码:</label>
												<div class="control-text">
													<input type="text" value="" class="small_textbox mr10" name="verify_coder" style="width:165px;" id="input_new_sms_verify">
													<input type="button" value="获取新手机验证码" class="ui_button send_sms_verify small_send_sms_verify bg_red" onclick="doNewVerify(this)" id="J_send_new_sms_verify">
												</div>
												<div class="blank0"></div>
											</div>
											<input type="hidden" name="bind_mobile" value="0">

											<div class="blank10"></div>
											<div class="submit_btn_row control-group">
												<label class="control-label"></label>
												<input type="button" value="提交" name="setting_mobile" onclick="settingMobile()"  class="ui-button theme_bgcolor" id="setting_mobile">
												<input type="hidden" value="1" name="ajax">
											</div>
										</form>
									</div>
								</li>
								<li>
								<s:if test="#session.user.payPassword==null">
									<div class="it cf clearfix">
										<div class="security_icon"><i class="fa fa-unlock-alt"></i></div>
										<h3>支付密码</h3>

										<p class="f_red">未设置</p>

										<div class="update">
											<a href="javascript:void(0)" class="J_setting" id="J_setting_paypwd">设 置

											</a>
										</div>

									</div>
									<div class="setting_box" id="setting-pass-box">
										<form class="ajax_form_paypassword" action="/settings-paypassword_binding.html">
											<div class="control-group small-control-group">
												<label class="control-label">支付密码:</label>
												<div class="control-text">
													<input type="password" id="paypassword" value="" class="small_textbox" name="paypassword">
												</div>
												<div class="blank0"></div>
											</div>
											<div class="control-group small-control-group">
												<label class="control-label">确认支付密码:</label>
												<div class="control-text">
													<input type="password" id="confirm_pypassword" value="" class="small_textbox" name="confirm_pypassword">
												</div>
												<div class="blank0"></div>
											</div>
											<div class="control-group smaller-control-group">
												<label class="control-label">手机号:</label>
												<div class="control-text"><s:property value="#session.user.mobile.substring(0,3)"/>*****<s:property value="#session.user.mobile.substring(8)"/></div>
												<div class="blank0"></div>
											</div>
											<div class="control-group small-control-group">
												<label class="control-label">验证码:</label>
												<div class="control-text">
													<input type="text" value="" id="input_verify_pay" class="small_textbox mr10" name="verify" style="width:165px;">
													<input type="button" onclick="J_send_sms_verify_pay(this)" value="获取验证码" class="ui_button send_sms_verify small_send_sms_verify bg_red">
												</div>
											</div>
											<div class="blank10"></div>
											<div class="submit_btn_row control-group">
												<label class="control-label"></label>
												<div class="ui-button theme_bgcolor" onclick="save_pay_pw()" rel="green">提交</div>
												<input type="hidden" value="1" name="ajax">
												<input type="hidden" value="0" name="step">
											</div>
										</form>
									</div>
									</s:if>
									
									<s:else>
									<div class="it cf clearfix">
										<div class="security_icon"><i class="fa fa-unlock-alt"></i></div>
										<h3>支付密码</h3>

										<p>已设置</p>

										<div class="update">
											<a href="javascript:void(0);" class="J_setting" id="J_setting_paypwd">修改</a>
										</div>
									</div>
									<div class="setting_box" id="setting-pass-box">
										<form class="ajax_form_paypassword" action="/settings-paypassword_binding.html">
											<div class="control-group small-control-group">
												<label class="control-label">原支付密码:</label>
												<div class="control-text">
													<input type="password" id="oldpaypassword" value="" class="small_textbox" name="oldpaypassword">
												</div>
												<div class="blank0"></div>
											</div>
											<div class="control-group small-control-group">
												<label class="control-label">新支付密码:</label>
												<div class="control-text">
													<input type="password" id="new_pypassword" value="" class="small_textbox" name="new_pypassword">
												</div>
												<div class="blank0"></div>
											</div>
											
											<div class="control-group small-control-group">
												<label class="control-label">确认新支付密码:</label>
												<div class="control-text">
													<input type="password" id="confirm_new_pypassword" value="" class="small_textbox" name="confirm_new_pypassword">
												</div>
												<div class="blank0"></div>
											</div>
											
											<div class="control-group smaller-control-group">
												<label class="control-label">手机号:</label>
												<div class="control-text"><s:property value="#session.user.mobile.substring(0,3)"/>*****<s:property value="#session.user.mobile.substring(8)"/></div>
												<div class="blank0"></div>
											</div>
											<div class="control-group small-control-group">
												<label class="control-label">验证码:</label>
												<div class="control-text">
													<input type="text" value="" id="input_verify_update_pay" class="small_textbox mr10" name="verify" style="width:165px;">
													<input type="button" onclick="J_send_sms_verify_update_pay(this)" value="获取验证码" class="ui_button send_sms_verify small_send_sms_verify bg_red">
												</div>
											</div>
											<div class="blank10"></div>
											<div class="submit_btn_row control-group">
												<label class="control-label"></label>
												<div class="ui-button theme_bgcolor" onclick="save_update_pay_pw()" rel="green">提交</div>
												<input type="hidden" value="1" name="ajax">
												<input type="hidden" value="0" name="step">
											</div>
										</form>
									</div>
									
									</s:else>
								</li>
								
							
								<li>
									<div class="it cf clearfix">
										<div class="security_icon"><i class="fa fa-user"></i></div>
										<h3>实名认证</h3>

										<p class="f_red">未认证</p>
										<div class="update">
											<a href="javascript:void(0)" class="J_setting" id="J_setting_paypwd">设置</a>
										</div>

									</div>
									<div class="setting_box" id="setting-id-box">
										<form class="ajax_form_identify" action="/settings-binding_investor.html">

											<div class="control-group small-control-group">
												<label class="control-label" id="identify_name_str">身份证姓名:</label>
												<div class="control-text">
													<input type="text" id="idName" value="" class="small_textbox" name="identify_name">
												</div>
												<div class="blank0"></div>
											</div>
											<div class="control-group small-control-group">
												<label class="control-label">身份证号码:</label>
												<div class="control-text">
													<input type="text" id="idNumber" value="" class="small_textbox" name="identify_number">
												</div>
												<div class="blank0"></div>

											</div>

											<div class="control-group small-control-group">
												<label class="control-label">身份证正面:</label>
												<div class="pic_box f_l mr20">
													<i class="del_pic"></i>
													<div class="pic_show" id="audit_data_legal_num" style="position: relative;">

                                                        <div id="image_face" style="width:390px;height:280px; background:#CCCCCC; float:left;">
                                                            <img />
                                                        </div>
                                                     </div>
												</div>
                                                <input   id="idFaceImg" name="idFaceImg" type="file"  accept="image/gif,image/jpeg,image/png,image/bmp"/>

                                                <div class="blank0"> </div>

											</div>

											<div class="control-group small-control-group">
												<label class="control-label">身份证反面:</label>
												<div class="pic_box f_l mr20">
													<i class="del_pic"></i>
													<div class="pic_show" id="audit_data_legal_credit_num" style="position: relative;">
                                                        <div id="image_back" style="width:390px;height:280px; background:#CCCCCC; float:left;">
                                                            <img  />
                                                        </div>
													</div>
												</div>
                                                <input   id="idBackImg" name="idBackImg" type="file" accept="image/gif,image/jpeg,image/png,image/bmp"/>

                                                <div class="blank0"></div>

                                            </div>
											<div class="control-group small-control-group">
												<label class="control-label"></label>
												<div class="control-text">
													注：单个图片大小不超过1MB,选择 文件后需等待几秒上传
												</div>
												<div class="blank0"></div>

											</div>
                                            <div class="control-group smaller-control-group">
                                                <label class="control-label">手机号:</label>
                                                <div class="control-text"><s:property value="#session.user.mobile.substring(0,3)"/>*****<s:property value="#session.user.mobile.substring(8)"/></div>
                                                <div class="blank0"></div>
                                            </div>
                                            <div class="control-group small-control-group">
                                                <label class="control-label">验证码:</label>
                                                <div class="control-text">
                                                    <input type="text" value="" id="input_verify_update_pay" class="small_textbox mr10" name="verify" style="width:165px;">
                                                    <input type="button" onclick="uploadIdFace(this)" value="获取验证码" class="ui_button send_sms_verify small_send_sms_verify bg_red">
                                                </div>
                                            </div>
                                            <div class="submit_btn_row control-group">
                                                <label class="control-label"></label>
                                                <input type="button" value="提交" name="setting_mobile" onclick="settingMobile()"  class="ui-button theme_bgcolor" id="setting_mobile">
                                                <input type="hidden" value="1" name="ajax">
                                            </div>
                                        </form>
                                    </div>
								</li>
							</ul>
						</div>
					</div>
					<div class="blank"></div>
				</div>
				<!--中间结束-->
				<div class="blank"></div>

			</div>
		</div>
		</div>
<script>
    var  isupFace =false;
   function uploadIdFace(objc) {
       alert("aaaa");
       var  filter=/^[\u4e00-\u9fa5]{2,6}$/;
       var id_name=$("#idName").val();
       var id_number=$("#idNumber").val();
       var idFaceImg=$("#idFaceImg");
       var idBackImg=$("#idBackImg");
       if(!filter.test(id_name)){
           alert("输入的身份证姓名不合法");
           return false;
       }
       if (id_number.length==0){
           alert("身份证号不能为空");
           return false;
       }
       if(!IdentityCodeValid(id_number)){
           alert("身份证不合法,请检查是否有输错身份证");
           return false;
       }
       if(idFaceImg==null){
           alert("请先选择要认证的身份证正面照,谢谢!");
           return false;
       }
       if(!checkPic(idFaceImg,"身份证正面照的"))
           return false;
       if(idBackImg==null){
           alert("请您选择要认证的身份证背面照,谢谢!");
           return false;
       }
       if(!checkPic(idBackImg,"身份证背面照的"))
           return false;
       $.ajax({
           url: "uploadIdFace.action",
           data: {
               "iDcard" : id_number,
               "idName" : id_name,
              // "newPayPassword" : new_pypassword,
           },
           type: "post",
           async: true,//
           success: function (msg) {
               if (msg == "success") {
                   isupFace = true;
               }
           }
       });

       settime(obj);
   }
   function checkPic (objImg,fmsg) {
       filepath=$(objImg).val();
       var extStart=filepath.lastIndexOf(".");
       var ext=filepath.substring(extStart,filepath.length).toUpperCase();
       if(ext!=".BMP"&&ext!=".PNG"&&ext!=".GIF"&&ext!=".JPG"&&ext!=".JPEG"){
           alert(fmsg+"图片限于png,gif,jpeg,jpg格式");
           return false;
       }
       return true;
   }

    document.getElementById('idBackImg').onchange = function() {
        var imgFile = this.files[0];
        var fr = new FileReader();
        fr.onload = function() {
            document.getElementById('image_back').getElementsByTagName('img')[0].src = fr.result;
        };
        fr.readAsDataURL(imgFile);
    };
    document.getElementById('idFaceImg').onchange = function() {
        var imgFile = this.files[0];
        var fr = new FileReader();
        fr.onload = function() {
            document.getElementById('image_face').getElementsByTagName('img')[0].src = fr.result;
        };
        fr.readAsDataURL(imgFile);
    };

  //身份证号码验证
   function IdentityCodeValid(code) {
       var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
       var tip = "";
       var pass= true;

       if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
           tip = "身份证号格式错误";
           pass = false;
       }

       else if(!city[code.substr(0,2)]){
           tip = "地址编码错误";
           pass = false;
       }
       else{
           //18位身份证需要验证最后一位校验位
           if(code.length == 18){
               code = code.split('');
               //∑(ai×Wi)(mod 11)
               //加权因子
               var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
               //校验位
               var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
               var sum = 0;
               var ai = 0;
               var wi = 0;
               for (var i = 0; i < 17; i++)
               {
                   ai = code[i];
                   wi = factor[i];
                   sum += ai * wi;
               }
               var last = parity[sum % 11];
               if(parity[sum % 11] != code[17]){
                   tip = "校验位错误";
                   pass =false;
               }
           }
       }
       return pass;
   }

</script>
<script>
		
		 function save_update_pay_pw(){
				var oldpaypassword = $("#oldpaypassword").val();
				var new_pypassword = $("#new_pypassword").val();
				var confirm_new_pypassword = $("#confirm_new_pypassword").val();
				var input_verify_update_pay = $("#input_verify_update_pay").val();
				if(oldpaypassword.length<6){
					alert("原支付密码不正确!")
					return false;
				}
				if(new_pypassword.length<6){
					alert("新支付密码不能小于6位!")
					return false;
				}
				if(new_pypassword!=confirm_new_pypassword){
					alert("两次输入的密码不一致!");
					return false;
				}
				if(oldpaypassword==new_pypassword){
					alert("新密码不能和原密码一致")
					return false;
				}
				if(input_verify_update_pay.length<6){
					alert("手机验证码输入不正确")
					return false;
				}
				//发送验证码
				$.ajax({
					url : "updatePayPasswd.action",
					data : {
						"oldPayPassword" : oldpaypassword,
						"newPayPassword" : new_pypassword,
						"inputVerifyPay" : input_verify_update_pay						
					},	
					
					type : "post",
					async : false,//
					success : function(msg) {
						if (msg == "success") {							
							alert("保存成功");
							doAction();
						}else if (msg == "verifyerror"){
							alert("手机验证码输入不正确!更改密码失败");
						}
						else if (msg == "olderror"){
							alert("原密码输入不正确");
						}else
							alert("变更支付密码失败");
					}

				});				
			}
		
		  function J_send_sms_verify_update_pay(obj){
				var oldpaypassword = $("#oldpaypassword").val();
				var new_pypassword = $("#new_pypassword").val();
				var confirm_new_pypassword = $("#confirm_new_pypassword").val();
				if(oldpaypassword.length<6){
					alert("原支付密码不正确!")
					return false;
				}
				if(new_pypassword.length<6){
					alert("新支付密码不正确!")
					return false;
				}
				if(new_pypassword!=confirm_new_pypassword){
					alert("两次输入的密码不一致!");
					return false;
				}
				if(oldpaypassword==new_pypassword){
					alert("新密码不能和原密码一致")
					return false;
				}
				//发送验证码
				$.ajax({
					url : "sendUpdatePayPasswdPhoneCode.action",
					data : {
						"oldPayPassword" : oldpaypassword,
						"newPayPassword" : new_pypassword
						},	
					
					type : "post",
					async : true,//
					success : function(msg) {
						if (msg == "olderror") {
							alert("原交易密码不正确,请确认");
						} else if(msg == "pw<6") {
							alert("新交易密码过短");
						}else if(msg != "success")
							alert("发送失败");
					}

				});
				
				settime(obj);
			}
		  
		  
		 function save_pay_pw(){
				var paypassword = $("#paypassword").val();
				var confirm_pypassword = $("#confirm_pypassword").val();
				var input_verify_pay = $("#input_verify_pay").val();
				if(paypassword.length<6){
					alert("支付密码不能小于6位!")
					return false;
				}
				
				if(paypassword!=confirm_pypassword){
					alert("两次输入的密码不一致!");
					return false;
				}
				if(input_verify_pay.length<6){
					alert("手机验证码输入不正确!")
					return false;
				}
				//发送验证码
				$.ajax({
					url : "savePayPasswd.action",
					data : {
						"payPassword" : paypassword,
						"inputVerifyPay" : input_verify_pay						
					},	
					
					type : "post",
					async : true,//
					success : function(msg) {
						if (msg == "success") {							
							alert("保存成功");
							doAction();
						}else
							
						alert("保存失败");
					}

				});				
			}
      function J_send_sms_verify_pay(obj){
				var paypassword = $("#paypassword").val();
				var confirm_pypassword = $("#confirm_pypassword").val();
				if(paypassword.length<6){
					alert("支付密码不能小于6位!")
					return false;
				}
				if(paypassword!=confirm_pypassword){
					alert("两次输入的密码不一致!");
					return false;
				}
				//发送验证码
				$.ajax({
					url : "sendPayPasswdPhoneCode.action",
					data : {
						"payPassword" : paypassword						
					},	
					
					type : "post",
					async : true,//
					success : function(msg) {
						if (msg != "success") {
							alert("发送失败");
						}   
					}

				});
				
				settime(obj);
			}
		function updateSettingMail() {
				var filter =  /^([a-zA-Z0-9_-])+@([a-zA-Z0-9-])+((\.[a-zA-Z0-9-]{2,3}){1,2})$/;
				var email = $("#settings-new-mail").val();
				var input_old_mail_verify = $("#input_old_mail_verify").val();
				var input_new_mail_verify = $("#input_new_mail_verify").val();
				if (input_old_mail_verify.length!=6) {
					alert('您输入的原邮箱验证码不正确,请登录邮箱查看');
					return false;
				}
			    if (input_new_mail_verify.length!=6) {
					alert('您输入的新邮箱验证码不正确,请登录邮箱查看');
					return false;
				}
				if (!filter.test(email)) {
					alert('您的电子邮件格式不正确');
					return false;
				}
				$.ajax({
					url : "updateEmail.action",
					data : {
						"newMailAddr" : email,
						"oldMailCode" : input_old_mail_verify,
						"newMailCode" : input_new_mail_verify
					},	
					
					type : "post",
					async : false,//
					success : function(msg) {
						if (msg == "success") {
							alert("变更邮箱成功!");
							doAction();
							}
					   
					    else 
							alert("发送失败");
					    
					    
					}

				});
				

			}	
		function doNewMailVerify(obj) {
				var filter =  /^([a-zA-Z0-9_-])+@([a-zA-Z0-9-])+((\.[a-zA-Z0-9-]{2,3}){1,2})$/;
				var email = $("#settings-new-mail").val();
				var input_old_mail_verify = $("#input_old_mail_verify").val();
				
				if (input_old_mail_verify.length!=6) {
					alert('您输入的验证码不正确,请登录邮箱查看');
					return false;
				}
				if (!filter.test(email)) {				     
					alert('您的电子邮件格式不正确');
					return false;
				}
				$.ajax({
					url : "sendNewMailCode.action",
					data : {
						"newMailAddr" : email,
						"oldMailCode" : input_old_mail_verify
					},	
					
					type : "post",
					async : true,//
					success : function(msg) {
						if (msg == "mailexist") {
							alert("新邮箱已被注册!");
					    }else if (msg == "oldcodeerror") {
							alert("邮箱验证码不正确");
					    }
					    else if (msg == "fail") {
							alert("发送失败");
					    }
					    
					}

				});
				settime2(obj);

			}	
			function doOldMailVerify(obj) {
				var email = "coolmalll@163.com";
				$.ajax({
					url : "sendOldMailCode.action",
					data : {
						"newMailAddr" : email
					},
					type : "post",
					async : true,//
					success : function(msg) {
						if (msg != "success") {
							alert("发送失败");
					    }
					}

				});
				settime(obj);

			}
			
			function sendMailCode(obj) {
				var filter =  /^([a-zA-Z0-9_-])+@([a-zA-Z0-9-])+((\.[a-zA-Z0-9-]{2,3}){1,2})$/;
				var email = $("#new_email").val();
				if (!filter.test(email)) {
					alert('您的电子邮件格式不正确');
					return false;
				}

				$.ajax({
					url : "sendMailCode.action",
					data : {
						"newMailAddr" : email
					},
					type : "post",
					async : true,//
					success : function(msg) {
						if (msg == "fail") {
							alert("发送失败");
						} else if (msg == null) {
							alert("发送失败");
						}
					}

				});
				settime(obj);

			}
			function saveToEmail() {
				var filter = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9-])+((\.[a-zA-Z0-9-]{2,3}){1,2})$/;
				var email = $("#new_email").val();
				var input_email_verify_code = $("#input_email_verify_code").val();
				if (!filter.test(email)) {
					alert('您的电子邮件格式不正确');
					return false;
				}

               if (input_email_verify_code.length!=6) {
					alert('您输入的验证码不正确');
					return false;
				}
				$.ajax({
					url : "saveEmail.action",
					data : {
					    
						"newMailAddr" : email,
						"newMailCode": input_email_verify_code
					},
					type : "post",
					async : true,//
					success : function(msg) {
						if (msg == "success") {
							alert("邮箱设置成功");
							doAction();
						} else
							alert("保存失败");
					}

				});			
			}
		</script>
		<script type="text/javascript">
			$(".J_setting").bind('click', function() {
				var setting_box = $(this).parent().parent().parent().find(".setting_box");
				if(setting_box.is(":hidden")) {
					setting_box.slideDown(300);
					if($(this).text() == '修改') {
						$(this).text("取消修改");
					}
					if($(this).text() == '绑定') {
						$(this).text("取消绑定");
					}
					if($(this).text() == '设置') {
						$(this).text("取消设置");
					}
				} else {
					setting_box.slideUp(300);
					if($(this).text() == '取消绑定') {
						$(this).text("绑定");
					}
					if($(this).text() == '取消修改') {
						$(this).text("修改");
					}
					if($(this).text() == '取消设置') {
						$(this).text("设置");
					}
				}
			});
			$("#cat_google_secret").bind('click', function() {
				show_google_secret();
			});
			$("#change_google_status").bind('click', function() {
				show_setting_google();
			});
			$("#setting-google").bind('click', function() {
				show_setting_google();
			});
		</script>

		</div> 
<%@include file="/WEB-INF/jsp/commons/bottom.jspf" %>