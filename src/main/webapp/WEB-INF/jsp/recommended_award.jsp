<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/jsp/commons/head.jspf" %>
<%@include file="/WEB-INF/jsp/commons/left.jspf" %>
	<script>		
document.getElementById("recommended_award").className="current";	
</script>	
	

				<div class="part right-part" style="border-left: none;">
					<h2 class="title-header" style="text-align: left;">
				<span class="title-content color-6">推荐项目奖励</span>
			</h2>
					<div class="handle-center">
					
						<div class="self-table">
							<table>
								<thead>
									<tr>
										<th>序号</th>
										<th>订单号</th>
										<th>订单金额</th>
										<th>级差比</th>
										<th>推荐奖励</th>
										<th>推广类型</th>
										<th>会员ID</th>
										<th>时间</th>
										<th>状态</th>
									</tr>
								</thead>
								<tbody id="payslip-detail-list">
								 <s:iterator value="#session.awardList" status="st">
										<tr>
											<td><s:property value="#st.index+1"/></td>
											<td><s:property value="order.id"/></td>
											<td><s:property value="orderMoney"/></td>
											<td><s:property value="leveGrade*100"/></td>
											<td><s:if test="state==1"><span style="color:red"><s:property value="reward"/></span></s:if><s:else><s:property value="reward"/></s:else></td>
											<td><s:property value="pushType"/></td>
											<td><s:property value="orderUserId"/></td>
											<td><fmt:formatDate value="${orderbuyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
											<td><s:if test="state==1"><span style="color:red">已完成支付</span></s:if><s:else>尚未支付</s:else></td>
											</tr>
								 </s:iterator>
								</tbody>
							</table>
						</div>
						<div class="self-table">
							<table>
								<thead>
									<tr>
										<th>实际推广收益:&nbsp;&nbsp;￥<span style="color:red"><s:property value="#session.pushTotal"/></span>元</th>
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