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

			<h1>留言管理</h1>
			<p class="txt">可在此查看平台留言</p>


			<div class="content">

				<div class="container">
				<form id="search" action="/admin/user/message/1/" method="get">
					<table class="ui-searchbar">
						<thead>
							<tr>
								<td>内容</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<input type="text" class="ui-input" name="keywords" value="${keywords }"  placeholder="内容"/>
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
									<td width="40px">头像</td>
									<td width="60px">用户ID</td>
									<td>昵称</td>
									<td width="200px">引用内容</td>
									<td  width="200px">留言内容</td>
									<td width="100px">留言时间</td>
									<td width="180px">操作</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pager.list }" var="message">
									<tr>
										<td><img src="${message.user.logo }" style="width: 40px; height: 40px;"></td>
										<td>${message.user.uid}</td>
										<td>${message.user.nick}</td>
										<c:if test="${!empty message.quote }">
											<td style="width:200px;white-space:pre;text-overflow: ellipsis;overflow: hidden;" title="${message.quote.content }">${message.quote.content }</td>
										</c:if>
										<c:if test="${empty message.quote }">
											<td>无</td>
										</c:if>
										
										<td title="${message.content }" style="width:200px;white-space:pre; text-overflow: ellipsis;overflow: hidden;">${message.content }</td>
										<td><qjk:fmt type="dateformat" format="yyyy-MM-dd HH:mm:ss"
												src="${message.ctime}" /></td>
										<td>
											<%-- <a href="/admin/user/users/${user.uid }/detail">查看</a> --%>
										</td>
									</tr>
								</c:forEach>
								<qjk:pager columnSize="7" value="pager" url="/admin/user/message/{pageIndex}/${keywords}" />

							</tbody>
						</table>

					</c:if>

				</div>
			</div>

		</div>
	</div>
</body>
</html>