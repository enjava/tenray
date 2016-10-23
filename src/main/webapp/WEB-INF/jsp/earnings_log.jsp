<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/jsp/commons/head.jspf" %>
<%@include file="/WEB-INF/jsp/commons/left.jspf" %>
		<script>		
document.getElementById("earnings_log").className="current";	
</script>	
				<div class="part right-part" style="border-left: none;">
					<h2 class="title-header" style="text-align: left;">
				<span class="title-content color-6">项目经营收益日志</span>
			</h2>
					<div class="handle-center">
						<div class="p4c-search-content form-horizontal">
							<form id="search-form">
								<input id="form-page-size" type="hidden" name="query.pageSize" value="10">
								<input id="form-now-page-index" type="hidden" name="query.nowPageIndex" value="0">
								<span>结算时间：</span>
								<div class="form-group inline-block rel" style="margin:0;">
									<input type="text" class="form-control datepicker" readonly="" placeholder="请选择日期" name="query.payslipDateFrom" style="background-color:#fff;">
								</div>
								<span class="padding-20">至</span>
								<div class="form-group inline-block rel" style="margin:0;">
									<input type="text" class="form-control datepicker" readonly="" placeholder="请选择日期" name="query.payslipDateTo" style="background-color:#fff;">
								</div>
								<button id="do-search" type="button" class="search-payslip-btn btn btn-success" style="margin:0;margin-left: 15px;">查询 <span class="glyphicon glyphicon-search"></span></button>
							</form>
						</div>
						<div class="self-table">
							<table>
								<thead>
									<tr>
										<th>序号</th>
										<th>项目名称</th>
										<th>结算期数</th>
										<th>结算金额</th>
										<th>结算时间</th>
									</tr>
								</thead>
								<tbody id="payslip-detail-list">
									<tr>
										<td colspan="5" style="text-align:center;">没有可以显示的数据</td>
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