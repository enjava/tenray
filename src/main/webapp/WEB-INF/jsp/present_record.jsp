<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/jsp/commons/head.jspf" %>
<%@include file="/WEB-INF/jsp/commons/left.jspf" %>

	<script>		
document.getElementById("present_record").className="current";	
</script>	

				<div class="part right-part" style="border-left: none;">
					<h2 class="title-header" style="text-align: left;">
				<span class="title-content color-6">提现纪录</span>
			</h2>
					<div class="handle-center">
						<div class="p4c-search-content form-horizontal">
							<form id="search-form">
								<div class="row" style="padding-left: 20px;">
									<input id="form-page-size" type="hidden" name="query.pageSize" value="10">
									<input id="form-now-page-index" type="hidden" name="query.nowPageIndex" value="0">
									<span>投资时间：</span>
									<div class="form-group inline-block rel" style="margin:0;">
										<input type="text" class="form-control datepicker" readonly="" placeholder="请选择日期" name="query.payslipDateFrom" style="background-color:#fff;">
									</div>
									<span class="padding-20">至</span>
									<div class="form-group inline-block rel" style="margin:0;">
										<input type="text" class="form-control datepicker" readonly="" placeholder="请选择日期" name="query.payslipDateTo" style="background-color:#fff;">
									</div>
									<button id="do-search" type="button" class="search-payslip-btn btn btn-success" style="margin:0;margin-left: 15px;">查询 <span class="glyphicon glyphicon-search"></span></button>
							
								</div>
								<div class="row" style="padding-left: 20px;">
									<input id="form-now-page-index1" type="hidden" name="query.nowPageIndex1" value="0">
									<span style="padding-left: 28px;">状态：</span>
									<div class="radio inline-block">
									  <label>
									    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
									    申请中
									  </label>
									</div>
									<div class="radio inline-block"  style="margin-left: 28px;">
									  <label>
									    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
									    成功
									  </label>
									</div>
								</div>
							</form>	
						</div>
						<div class="self-table">
							<table>
								<thead>
									<tr>
										<th>序号</th>
										<th>申请金额</th>
										<th>申请时间</th>
										<th>状态</th>
										<!--<th>投资时间</th>-->
									</tr>
								</thead>
								<tbody id="payslip-detail-list">
									<tr>
										<td colspan="4" style="text-align:center;">没有可以显示的数据</td>
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