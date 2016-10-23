	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/jsp/commons/head.jspf" %>
<%@include file="/WEB-INF/jsp/commons/left.jspf" %>
	<script>		
document.getElementById("recommend").className="current";	
</script>	

					<div class="part right-part" style="border-left: none;">
						<h2 class="title-header" style="text-align: left;">
				<span class="title-content color-6">我要推荐</span>
			</h2>
						<div class="handle-center">

							<div class="self-table">
								<table>
									<thead>
										<tr>
											<th>序号</th>
											<th>我的推荐链接</th>
											<th>我的邀请码</th>
											<th>我的二维码</th>
										</tr>
									</thead>
									<tbody id="payslip-detail-list">
										<!--<tr>
										<td colspan="5" style="text-align:center;">没有可以显示的数据</td>
									</tr>-->

										<tr>
											<td>01</td>
											<td><s:property  value="#session.user.id"/></td>
											<td><s:property  value="#session.user.id"/></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="pagination-content">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<%@include file="/WEB-INF/jsp/commons/bottom.jspf" %>