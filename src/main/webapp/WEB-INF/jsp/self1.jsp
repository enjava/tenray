<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/jsp/commons/head.jspf" %>
<%@include file="/WEB-INF/jsp/commons/left.jspf" %>
		<script>		
document.getElementById("self1").className="current";	
</script>	
					<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/b5fa9a269a226f2739769221e5b1348b.css" />
					<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/1.css" />
					<div class="part right-part">
						<h2 class="title-header" style="text-align: left;">
				<span class="title-content color-6">个人资料</span>
			</h2>
						<div class="homeright pageright f_r usdiv_fr" style="width: 100%;">
							<div class="left">
								<form class="ajax_form" action="/settings-save_index.html" id="user_register_form">
									<div class="control-group">
										<label class="control-label">会员名称:</label>
										<div class="control-text">
											<input type="text" value="<s:property value='#session.user.username' />" class="textbox" disabled="true">
										</div>
										<div class="blank0"></div>
									</div>
									<div class="control-group smaller-control-group">
										<label class="control-label">EMAIL:</label>
										<div class="control-text">
										<s:if test="#session.user.email==null">
											邮箱未绑定，点击&nbsp;
											<a href="#" class="f_red" style="text-decoration:underline">去绑定</a>
											</s:if>
											<s:else>
											邮箱已绑定
											</s:else>
										</div>
										<div class="blank0"></div>
									</div>
									<div class="control-group smaller-control-group">
										<label class="control-label">真实姓名:</label>
										<div class="control-text">
											未实名认证，点击&nbsp;
											<a href="#" class="f_red" style="text-decoration:underline">去认证</a>
										</div>
										<div class="blank0"></div>
									</div>
									<div class="control-group smaller-control-group">
										<label class="control-label">身份证号:</label>
										<div class="control-text">
											未实名认证，点击&nbsp;
											<a href="#" class="f_red" style="text-decoration:underline">去认证</a>
										</div>
										<div class="blank0"></div>
									</div>
									<div class="control-group ">
										<label class="control-label">手机号码:</label>
										<div class="control-text">
											<input type="text" value='<s:property value="#session.user.mobile.substring(0,3)"/>*****<s:property value="#session.user.mobile.substring(8)"/>' class="textbox" disabled="true">
										</div>
										<div class="blank0"></div>
									</div>
									<div class="control-group small-control-group" style="*z-index:1;">
										<label class="control-label">性别:</label>
										<div class="control-text">
											<label class="ui_radiobox mr10 common_rdo" rel="sex" style="margin-top: 12px; display: inline-block;font-weight: lighter;" name="sex">
							<input type="radio" name="sex" value="1" style="display: none;">男
						</label>
											<label class="ui_radiobox common_rdo_checked" rel="sex" style="margin-top: 12px; display: inline-block;font-weight: lighter;" name="sex" checked="checked">
							<input type="radio" name="sex" checked="checked" value="0" style="display: none;">女
						</label>
										</div>
										<div class="blank0"></div>
									</div>
									<div class="control-group small-control-group">
										<label class="control-label">所在地区:</label>					
										<div class="control-text">
											<form id="form1">
												<select id="selProvince" onChange="getCity(this.options[this.selectedIndex].value)" style="width: 160px;padding: 4px 5px;font-size: 14px;border: 1px solid #d7d7d7;">
													<option value="">请选择省份</option>
													<option value="北京市">北京市</option>
													<option value="上海市">上海市</option>
													<option value="天津市">天津市</option>
													<option value="重庆市">重庆市</option>
													<option value="河北省">河北省</option>
													<option value="山西省">山西省</option>
													<option value="内蒙古自治区">内蒙古自治区</option>
													<option value="辽宁省">辽宁省</option>
													<option value="吉林省">吉林省</option>
													<option value="黑龙江省">黑龙江省</option>
													<option value="江苏省">江苏省</option>
													<option value="浙江省">浙江省</option>
													<option value="安徽省">安徽省</option>
													<option value="福建省">福建省</option>
													<option value="江西省">江西省</option>
													<option value="山东省">山东省</option>
													<option value="河南省">河南省</option>
													<option value="湖北省">湖北省</option>
													<option value="湖南省">湖南省</option>
													<option value="广东省">广东省</option>
													<option value="广西壮族自治区">广西壮族自治区</option>
													<option value="海南省">海南省</option>
													<option value="四川省">四川省</option>
													<option value="贵州省">贵州省</option>
													<option value="云南省">云南省</option>
													<option value="西藏自治区">西藏自治区</option>
													<option value="陕西省">陕西省</option>
													<option value="甘肃省">甘肃省</option>
													<option value="宁夏回族自治区">宁夏回族自治区</option>
													<option value="青海省">青海省</option>
													<option value="新疆维吾尔族自治区">新疆维吾尔族自治区</option>
													<option value="香港特别行政区">香港特别行政区</option>
													<option value="澳门特别行政区">澳门特别行政区</option>
													<option value="台湾省">台湾省</option>
													<option value="其它">其它</option>
												</select>
												<select id="selCity" style="width: 114px;padding: 4px 5px;font-size: 14px;border: 1px solid #d7d7d7;">
													<option>请选择城市</option>
												</select>
											</form>
										</div>
										<div class="blank0"></div>
									</div>
									<div class="control-group">
										<label class="control-label">所在公司:</label>
										<div class="control-text">
											<input type="text" value="" class="textbox" name="company">
										</div>
										<div class="blank0"></div>
									</div>
									<div class="control-group">
										<label class="control-label">所在职位:</label>
										<div class="control-text">
											<input type="text" value="" class="textbox" name="job">
										</div>
										<div class="blank0"></div>
									</div>
									<div class="control-group">
										<label class="control-label radio_lable">
						投资领域:
						<div class="cate_note">(最多只能选择3个)</div>
					</label>
										<div class="control-text" style="width:80%;height:auto;">
											<div id="cate_name_list">
												<label class="mr15">
			                	<span class="ui_check info_view " type="radio" rel="info_view" >
			                        <input class="cate_name" type="checkbox" name="cates[1]" id="pc" value="钱包" rel="cate_name">
			                    </span>
								钱包		                    </label>
												<label class="mr15">
			                	<span class="ui_check info_view " type="radio" rel="info_view">
			                        <input class="cate_name" type="checkbox" name="cates[2]" id="pc" value="交易" rel="cate_name">
			                    </span>
								交易		                    </label>
												<label class="mr15">
			                	<span class="ui_check info_view " type="radio" rel="info_view">
			                        <input class="cate_name" type="checkbox" name="cates[3]" id="pc" value="挖矿" rel="cate_name">
			                    </span>
								挖矿		                    </label>
												<label class="mr15">
			                	<span class="ui_check info_view " type="radio" rel="info_view">
			                        <input class="cate_name" type="checkbox" name="cates[4]" id="pc" value="硬件" rel="cate_name">
			                    </span>
								硬件		                    </label>
												<label class="mr15">
			                	<span class="ui_check info_view " type="radio" rel="info_view">
			                        <input class="cate_name" type="checkbox" name="cates[5]" id="pc" value="区块链" rel="cate_name">
			                    </span>
								区块链		                    </label>
												<label class="mr15">
			                	<span class="ui_check info_view " type="radio" rel="info_view">
			                        <input class="cate_name" type="checkbox" name="cates[6]" id="pc" value="行情" rel="cate_name">
			                    </span>
								行情		                    </label>
												<label class="mr15">
			                	<span class="ui_check info_view " type="radio" rel="info_view">
			                        <input class="cate_name" type="checkbox" name="cates[7]" id="pc" value="社交" rel="cate_name">
			                    </span>
								社交		                    </label>
												<label class="mr15">
			                	<span class="ui_check info_view " type="radio" rel="info_view">
			                        <input class="cate_name" type="checkbox" name="cates[8]" id="pc" value="游戏" rel="cate_name">
			                    </span>
								游戏		                    </label>
												<label class="mr15">
			                	<span class="ui_check info_view " type="radio" rel="info_view">
			                        <input class="cate_name" type="checkbox" name="cates[9]" id="pc" value="艺术" rel="cate_name">
			                    </span>
								艺术		                    </label>
												<label class="mr15">
			                	<span class="ui_check info_view " type="radio" rel="info_view">
			                        <input class="cate_name" type="checkbox" name="cates[10]" id="pc" value="竞争币" rel="cate_name">
			                    </span>
								竞争币		                    </label>
												<label class="mr15">
			                	<span class="ui_check info_view " type="radio" rel="info_view">
			                        <input class="cate_name" type="checkbox" name="cates[11]" id="pc" value="其他" rel="cate_name">
			                    </span>
								其他		                    </label>
											</div>
										</div>
										<div class="blank0"></div>
									</div>
									<div class="control-group" style="height:163px">
										<label class="control-label">自我介绍:</label>
										<div class="control-text" style="height:auto;line-height:1.5;">
											<textarea name="intro" class="textareabox w300"></textarea>
											<div class="blank5"></div>
											<div class="f12 f_999">这里可以输入大约300字的自我介绍，让大家多了解你</div>
										</div>
										<div class="blank0"></div>
									</div>
									<div class="control-group">
										<label class="control-label">博客或微博:</label>
										<div class="control-text" style="height:auto;">
											<div id="weibo_list">
												<div>
													<input type="text" value="" class="textbox" name="weibo_url[]">
													<div class="blank10"></div>
												</div>
											</div>
											<a href="javascript:void(0);" onclick="add_weibo();" class="theme_fcolor" style="line-height:1.5;">更多</a>
										</div>
										<div class="blank0"></div>
									</div>
									<div class="blank10"></div>
									<div class="submit_btn_row control-group">
										<label class="control-label"></label>
										<input type="button" value="保存最新的设置" class="ui-button theme_bgcolor">
										<input type="hidden" value="1" name="ajax">
									</div>
									<div class="blank10"></div>
								</form>
							</div>
							<div class="right" style="width: 300px; position: relative;">
			<span style="font-size:14px">个人头像</span>
			<div class="blank10"></div>
			<img id="avatar" src="img/noavatar_11.JPG">
			<div class="blank20"></div>
			<label class="fileupload" id="avatar_file" style="position: relative; z-index: 1;">
				<input type="file" class="filebox" name="avatar_file" style="cursor:pointer;padding: 0;height: 39px;width: 97px;filter: alpha(opacity=0);-moz-opacity: 0;-khtml-opacity: 0;opacity: 0;">
			<!--button改成了file-->
			</label>
			<label class="fileuploading hide"></label>
		<div id="html5_1atihkrl0h9f1jkcocunlm1lrs3_container" class="moxie-shim moxie-shim-html5" style="position: absolute; top: 224px; left: 10px; width: 97px; height: 39px; overflow: hidden; z-index: 0;">
            <input id="html5_1atihkrl0h9f1jkcocunlm1lrs3" type="file" style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" accept="image/gif,image/jpeg,image/png,image/bmp">
		</div></div>
							<div id="gotop" style="display: block; z-index: 99;"></div>
							<div class="blank"></div>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			get_file_fun('avatar_file');

			// 投资领域限制只能3个
			(function() {
				var cate_name_list = $("#cate_name_list");
				var cate_name = cate_name_list.find("input[rel='cate_name']");
				var notChecked = cate_name_list.find("input[rel='cate_name']").not("input:checked");
				var isChecked = cate_name_list.find("input[rel='cate_name']:checked");
				cate_name.bind('click', function() {
					check();
				});
				if(isChecked.length >= 3) {
					for(var i = 0; i < notChecked.length; i++) {
						notChecked[i].disabled = true;
					}
				}

				function disableCheckBox() {
					for(var i = 0; i < cate_name.length; i++) {
						if(!cate_name[i].checked)
							cate_name[i].disabled = true;
					}
				}

				function ableCheckBox() {
					for(var i = 0; i < cate_name.length; i++)
						cate_name[i].disabled = false;
				}

				function check() {
					var sun = 0;
					for(var i = 0; i < cate_name.length; i++) {
						if(cate_name[i].type == "checkbox" && cate_name[i].checked)
							sun++;
						if(sun < 3) {
							ableCheckBox();
							//break; 
						} else if(sun == 3) {
							disableCheckBox();
							event.srcElement.checked = true;
							break;
						} else if(sun > 3) {
							event.srcElement.checked = false;
							break;
						}
					}
				}
			})();
		</script> 
<%@include file="/WEB-INF/jsp/commons/bottom.jspf" %>