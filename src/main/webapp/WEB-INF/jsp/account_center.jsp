<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/jsp/commons/head.jspf" %>
<%@include file="/WEB-INF/jsp/commons/left.jspf" %>
	<script>		
document.getElementById("account_center").className="current";	
</script>
					<div class="part right-part">
						<h2 class="title-header" style="text-align: left;">
				<span class="title-content color-6">账户中心</span>
			</h2>
						<div style="height: 450px;width: 100%;">
							<div class="level">
								<span>我的等级：<label style="color: black;"><s:property value="leveDes"/></label></span>
								<button type="button" class="uplevel">马上升级</button>
							</div>
							<div class="divall">
								<div class="color1 boxall">
									<dl>
										<dt><i class="fa fa-btc mr10"></i>盈亏比例</dt>
										<dd><span>100%</span></dd>
									</dl>
								</div>
								<div class="color2 boxall">
									<dl>
										<dt><i class="fa fa-undo mr10"></i>投资钱包</dt>
										<dd><span>100%</span></dd>
									</dl>
								</div>
								<div class="color3 boxall">
									<dl>
										<dt><i class="fa fa-external-link-square mr10"></i>经营钱包</dt>
										<dd><span>100%</span></dd>
									</dl>
								</div>
								<div class="color4 boxall">
									<dl>
										<dt><i class="fa fa-thumbs-up mr10"></i>奖励钱包</dt>
										<dd><span>100%</span></dd>
									</dl>
								</div>
							</div>
							<div class="divall">
								<div class="color5 boxall">
									<dl>
										<dt><i class="fa fa-exchange mr10"></i>上月返利</dt>
										<dd><span>100%</span></dd>
									</dl>
								</div>
								<div class="color6 boxall">
									<dl>
										<dt><i class="fa fa-group mr10"></i>新增伙伴</dt>
										<dd><span>100%</span></dd>
									</dl>
								</div>
								<div class="color7 boxall">
									<dl>
										<dt><i class="fa fa-calendar mr10"></i>加入时间</dt>
										<dd><span>100%</span></dd>
									</dl>
								</div>
								<div class="color8 boxall">
									<button style="background: transparent;width: 100%;padding: 43px 0;"><span style="font-size: 2em;color: white;">立即回购</span></button>
								</div>
							</div>
						</div>
						<div style="height: 400px;">
							<div class="newlist" style="padding: 0 10px;">
								<ul class="newul" style="border-top: 2px solid #4e84a0;">
									<li><span style="color:gray;font-size: 1.2em;"><i class="fa fa-volume-up mr10" style="padding-right: 5px;"></i>新闻公告</span></li>
									<li>
										<div style="border-top:1px solid lightgrey"></div>
									</li>
									<li>
										<div>
											<p>2015年公司规章制度</p>
											<span style="float: right;padding-right: 1em;">2015-3-6</span>
										</div>
										<div class="div1"><span>正文内容正文内容正文内容正文内容正文内容正文内容</span></div>
									</li>
									<li>
										<div style="border-top:1px solid lightgrey"></div>
									</li>
									<li>
										<div>
											<p>2015年公司规章制度</p>
											<span style="float: right;padding-right: 1em;">2015-3-6</span>
										</div>
										<div class="div1"><span>正文内容正文内容正文内容正文内容正文内容正文内容</span></div>
									</li>
									<li>
										<div style="border-top:1px solid lightgrey"></div>
									</li>
									<li>
										<div>
											<p>2015年公司规章制度</p>
											<span style="float: right;padding-right: 1em;">2015-3-6</span>
										</div>
										<div class="div1"><span>正文内容正文内容正文内容正文内容正文内容正文内容</span></div>
									</li>
									<li>
										<div style="border-top:1px solid lightgrey"></div>
									</li>
									<li>
										<div>
											<p>2015年公司规章制度</p>
											<span style="float: right;padding-right: 1em;">2015-3-6</span>
										</div>
										<div class="div1"><span>正文内容正文内容正文内容正文内容正文内容正文内容</span></div>
									</li>
									<li>
										<div style="border-top:1px solid lightgrey"></div>
									</li>
									<li>
										<div>
											<p>2015年公司规章制度</p>
											<span style="float: right;padding-right: 1em;">2015-3-6</span>
										</div>
										<div class="div1"><span>正文内容正文内容正文内容正文内容正文内容正文内容</span></div>
									</li>
									<li>
										<div style="border-top:1px solid lightgrey"></div>
									</li>
								</ul>
							</div>
							<!-- Graph HTML -->
							<div id="graph-wrapper" style="width:60%;float: right;">
								<div class="graph-info" style="margin-left: 45px;margin-bottom: 30px;">
									<a href="javascript:void(0)" class="visitors"><i class="fa fa-circle mr10"></i>Visitors</a>
									<a href="javascript:void(0)" class="returning"><i class="fa fa-circle mr10"></i>Returning Visitors</a>

									<a href="#" id="bars"><span></span></a>
									<a href="#" id="lines" class="active"><span></span></a>
								</div>

								<div class="graph-container">
									<div id="graph-lines"></div>
									<div id="graph-bars"></div>
								</div>
							</div>
							<!-- end Graph HTML -->

						</div>

					</div>
				</div>
			</div>
		</div>
	
<%@include file="/WEB-INF/jsp/commons/bottom.jspf" %>