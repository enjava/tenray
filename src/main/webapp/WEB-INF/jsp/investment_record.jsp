<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%@include file="/WEB-INF/jsp/commons/head.jspf" %>
<%@include file="/WEB-INF/jsp/commons/left.jspf" %>
	<script>		
document.getElementById("investment_record").className="current";	
</script>	

				<div class="part right-part" style="border-left: none;">
					<h2 class="title-header" style="text-align: left;">
				<span class="title-content color-6">投资纪录</span>
			</h2>
					<div class="handle-center">
						<div class="p4c-search-content form-horizontal">
							
						</div>
						<div class="self-table">
							<table>
								<thead>
									<tr>
										<th>订单号</th>
										<th>数量</th>
										<th>投资额(元)</th>
										<th>状态</th>
										<th>购买时间</th>
										<th>完成时间</th>
									</tr>
								</thead>
								<tbody id="payslip-detail-list">
								 <%-- <s:iterator value="orderList" status="st"> --%>
									   <s:iterator value="orderList" status="st">
										<tr>
											<td><s:property value="id"/></td>
											<td><s:property value="myPackage.amount"/></td>
											<td><s:property value="myPackage.price"/></td>
											<td>
											<s:if test="state==0"><span style="color:red">尚未支付</span></s:if><s:else>已完成支付</s:else></td>
											<td><fmt:formatDate value="${buyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
											<td><fmt:formatDate value="${finishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
										</tr>
										  </s:iterator>
								</tbody>
							</table>
						</div>
						
						<div class="self-table">
							<table>
								<thead>
									<tr>
										<th>投资总额:&nbsp;&nbsp;￥<s:property value="total"/>元</th>
										<th></th>										
									</tr>
								</thead>							
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