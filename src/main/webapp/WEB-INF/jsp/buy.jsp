	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/jsp/commons/head.jspf" %>
<%@include file="/WEB-INF/jsp/commons/left.jspf" %>
	<script>		
document.getElementById("buy").className="current";	
   
</script>	
<script type="text/javascript">
 function tijiao(o) {
        var group1 = $("[name='selectRadio']").filter(":checked"); 
        var selectID=group1.attr("id");
        if(selectID==1&&o==1)
        {
          alert("您已经购买过3000的订单,无法再次购买");
          return false;
        }
	    document.forms[0].action = "investment_record.action";
		document.forms[0].submit();
		};
</script>
	<form action="investment_record.action" method="post">
					<div class="part right-part" style="border-left: none;">
						<h2 class="title-header" style="text-align: left;">
				<span class="title-content color-6">我要购买</span>
			</h2>
						<div class="handle-center">

							<div class="self-table">
								<table>
									<thead>
										<tr>
											<th>序号</th>
											<th>描述</th>
											<th>数量</th>
											<th>价格</th>
											<th>选择</th>
										</tr>
									</thead>
									<tbody id="payslip-detail-list">
								   <s:iterator value="#session.packageList">
										<tr>
											<td>${id} &nbsp;</td>
											<td>${description} &nbsp;</td>
											<td>${amount} &nbsp;</td>
											<td>${price} &nbsp;</td>
											<td><input type="radio" id="${id}" name="selectRadio" value="${id}" ></td>
										</tr>
										  </s:iterator>
										</tbody>
								</table>
									<a href="javascript:tijiao('<s:property value='#session.user.is3000'/>');" onclick="return confirm('您确定要要购买吗？')" class="btn btn-success"   style="padding: 5px 10px;font-size: 1.5em;">购买</a>
								</div>
						
							<div id="pagination-content">
							</div>
						</div>
					</div>
			</form>		
				</div>
			</div>
		</div>
			
<%@include file="/WEB-INF/jsp/commons/bottom.jspf" %>