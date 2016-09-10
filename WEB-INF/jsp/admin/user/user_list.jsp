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

			<h1>用户查询</h1>
			<p class="txt">可在此查看平台用户</p>


			<div class="content">

				<div class="container">
				<form id="search" action="/admin/user/users/1/" method="get">
					<table class="ui-searchbar">
						<thead>
							<tr>
								<td>昵称</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<input type="text" class="ui-input" name="keywords" value="${keywords }"  placeholder="昵称"/>
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
							var action = form.attr("action");
							
							action = action+keywords;
							
							window.location.href=action;
						});
					});
				
				</script>

					<c:if test="${not empty pager }">
						<table class="ui-table">
							<thead>
								<tr>
									<td width="40px">头像</td>
									<td width="40px">ID</td>
									<td>昵称</td>
									<td>QQ用户</td>
									<td>微信用户</td>
									<td>新浪微博用户</td>
									<td width="100px">加入时间</td>
									<td width="100px">登陆时间</td>
									<td width="180px">操作</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pager.list }" var="user">
									<tr>
										<td><img src="${user.logo }" style="width: 40px; height: 40px;"></td>
										<td>${user.uid}</td>
										<td>${user.nick}</td>
										<c:if test="${!empty user.qqUser }">
											<td><a href="/admin/user/qqusers/${user.qqUser.qqid }/detail">查看</a></td>
										</c:if>
										<c:if test="${empty user.qqUser }">
											<td>无</td>
										</c:if>
										<c:if test="${!empty user.wxUser }">
											<td><a href="/admin/user/wxusers/${user.wxUser.wxid }/detail">查看</a></td>
										</c:if>
										<c:if test="${empty user.wxUser }">
											<td>无</td>
										</c:if>
										<c:if test="${!empty user.wbUser }">
											<td><a href="/admin/user/wbusers/${user.wbUser.wbid }/detail">查看</a></td>
										</c:if>
										<c:if test="${empty user.wbUser }">
											<td>无</td>
										</c:if>
										<td><qjk:fmt type="dateformat" format="yyyy-MM-dd HH:mm:ss"
												src="${user.ctime}" /></td>
										<td><qjk:fmt type="dateformat" format="yyyy-MM-dd HH:mm:ss"
												src="${user.loginTime}" /></td>
										<td>
											<a href="/admin/user/users/${user.uid }/detail">查看</a>
										</td>
									</tr>
								</c:forEach>
								<qjk:pager columnSize="9" value="pager" />

							</tbody>
						</table>

					</c:if>

				</div>
			</div>

		</div>
	</div>
</body>
</html>