<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/jsp/commons/head.jspf" %>
<%@include file="/WEB-INF/jsp/commons/left.jspf" %>
	<script>		
document.getElementById("my_team").className="current";	
</script>	
				<div class="part right-part" style="border-left: none;">
					<h2 class="title-header" style="text-align: left;">
				<span class="title-content color-6">我的团队</span>
			</h2>
					<div class="handle-center">
						<div class="p4c-search-content form-horizontal">
							
						</div>
						<div class="self-table">
							<table>
								<thead>
									<tr>
										<th>序号</th>
										<th>会员推荐码</th>
										<th>会员手机</th>
										<th>会员等级</th>
										<th>状态</th>
										<th>参与时间</th>
										<th>上级推荐码</th>
									</tr>
								</thead>
								<tbody id="payslip-detail-list">
								 <s:iterator value="userList" status="st">
										<tr>
										    <td><s:property value="#st.index+1"/></td>
											<td><s:property value="id"/></td>
											<td><s:property value="mobile"/></td>
											
											<td><s:property value="leve.description"/></td>
											<td>活跃</td>										
											<td><fmt:formatDate value="${createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
											<td><s:property value="parent.id"/></td>										
										</tr>
								</s:iterator>
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