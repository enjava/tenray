<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/jsp/commons/head.jspf" %>
<%@include file="/WEB-INF/jsp/commons/left.jspf" %>
	<script>		
document.getElementById("bank_account").className="current";	
</script>	
					<div class="part right-part" style="border-left: none;">
						<h2 class="title-header" style="text-align: left;">
				<span class="title-content color-6">银行账户</span>
			</h2>
						<div style="width: 60%;margin: 0 auto;padding: 30px 0;">
							<form role="form">
								<ul class="bankul">
									<li>
										<div class="form-group" style="width:100%;clear: both;">
											<label for="exampleInputEmail1"  style="float: left;padding-right:33px;line-height: 30px;">开户行</label>
											<input type="text" class="form-control" id="exampleInputEmail1"  style="float: left;width: 70%;">
										</div>
									</li>
									<li>
										<div class="form-group">
											<label for="exampleInputEmail2"  style="float: left;padding-right: 20px;line-height: 30px;">银行名称</label>
											<input type="text" class="form-control" id="exampleInputEmail2"  style="float: left;width: 70%;">
										</div>
									</li>
									<li>
										<div class="form-group">
											<label for="exampleInputEmail3"  style="float: left;padding-right: 20px;line-height: 30px;">银行账户</label>
											<input type="text" class="form-control" id="exampleInputEmail3"  style="float: left;width: 70%;">
										</div>
									</li>
									<li>
										<div class="form-group">
											<label for="exampleInputEmail4"  style="float: left;padding-right: 20px;line-height: 30px;">开户姓名</label>
											<input type="text" class="form-control" id="exampleInputEmail4"  style="float: left;width: 70%;">
										</div>
									</li>
									<li>
										<button type="button" class="btn btn-success" style="padding: 5px 10px;font-size: 1.5em;">保存</button>
										<button type="button" class="btn btn-default" style="padding: 5px 10px;font-size: 1.5em;">取消</button>
									</li>
								</ul>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>


<%@include file="/WEB-INF/jsp/commons/bottom.jspf" %>