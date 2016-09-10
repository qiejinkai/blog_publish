<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="qjk" uri="/qjk/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<%@include file="../css.html"%>
<%@include file="../script.html"%>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>

	<div class="ef-main">
		<jsp:include page="../toolbar.jsp"></jsp:include>
		<div class="ef-block">

			<h1>微信消息管理</h1>
			<p class="txt">可在此查看微信消息</p>


			<div class="content">

				<div class="container">
				<form id="search" action="/admin/user/wxmessage/1/" method="get">
					<table class="ui-searchbar">
						<thead>
							<tr>
								<td>openId</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<input type="text" class="ui-input" name="keywords" value="${keywords }"  placeholder="openId"/>
								</td>
								
								<td>
									<input type="button" value="查询" class="ui-btn" />
								</td>
							</tr>
						</tbody>
					</table>
				
				</form>
				<script type="text/javascript">
					$(function(){
						var form = $("#search");
						$("input[type=button]",form).bind('click',function(){
							var keywords = $("input[name='keywords']",form).val();
							var action = $(form).attr("action");
							
							action = action+keywords;
							
							window.location.href=action;
						});
					});
				
				</script>
					<c:if test="${not empty pager }">
						<table class="ui-table" style="table-layout: fixed;width:100%">
							<thead>
								<tr>
									<td width="80px">FromUserName</td>
									<td width="60px">MsgType</td>
									<td>Content</td>
									<td>Event</td>
									<td >EventKey</td>
									<td >CreateTime</td>
									<td>操作</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pager.list }" var="message">
									<tr>
										<td>${message.fromUserName }</td>
										<td>${message.msgType}</td>
										<td>${message.content}</td>
										<td>${message.event}</td>
										<td>${message.eventKey}</td>
										<td>${message.createTime}</td>
										<td>
											<%-- <a href="/admin/user/users/${user.uid }/detail">查看</a> --%>
										</td>
									</tr>
								</c:forEach>
								<qjk:pager columnSize="7" value="pager" url="/admin/user/wxmessage/{pageIndex}/${keywords}" />

							</tbody>
						</table>

					</c:if>

				</div>
			</div>

		</div>
	</div>
</body>
</html>