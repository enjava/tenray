<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/jsp/commons/head.jspf" %>
<%@include file="/WEB-INF/jsp/commons/left.jspf" %>
	<script>		
document.getElementById("binding").className="current";	
</script>	
				<div class="part right-part" style="border-left: none;">
					<h2 class="title-header" style="text-align: left;">
				<span class="title-content color-6">账号绑定</span>
			</h2>
			
			<div class="left">
				<div class="blank15"></div>
						
				<div class="control-group">
										<div class="ui-button theme_bgcolor" rel="green" style="margin-left:10px;display:inline" url="https://api.weibo.com/oauth2/authorize?client_id=1282198262&amp;redirect_uri=http%3A%2F%2Fbizhongchou.com%2Fapi_callback.php%3Fc%3DSina&amp;response_type=code">
						<div>
							<span style="color: white;">立即绑定</span>
						</div>
					</div>
					<label class="title" style="height:40px; line-height:40px; margin-left:10px;background: transparent;width: 100px;">新浪微博</label>
										<div class="blank15"></div>
				</div>
						
				<div class="control-group">
										<div class="ui-button theme_bgcolor" rel="green" style="margin-left:10px;display:inline" url="https://bizhongchou.com/system/api_login/qqv2/qq_login.php">
						<div>
							<span style="color: white;">立即绑定</span>
						</div>
					</div>
					<label class="title" style="height:40px; line-height:40px; margin-left:10px;background: transparent;width: 100px;">QQ登录</label>
										<div class="blank15"></div>
				</div>
							</div>
			
			
				</div>
			</div>
		</div>
</div>
		

<%@include file="/WEB-INF/jsp/commons/bottom.jspf" %>