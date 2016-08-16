<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="qjk" uri="/qjk/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告管理</title>
<%@include file="../css.html"%>
<%@include file="../script.html"%>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>

	<div class="ef-main">
		<jsp:include page="../toolbar.jsp"></jsp:include>
		<div class="ef-block">

			<h1>公告管理</h1>
			<p class="txt">可在此管理本平台的公告内容</p>


			<div class="content">

				<div class="container">

					<c:if test="${not empty pager }">
						<table class="ui-table">
							<thead>
								<tr>
									<td width="80px">ID</td>
									<td>标题</td>
									<td>状态</td>
									<td width="140px">内容</td>
									<td width="100px">创建时间</td>
									<td width="180px">操作</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pager.list }" var="article">
									<tr>
										<td>${article.articleId }</td>
										<td>${article.title }</td>
										<td>${article.hidden == 0 ?'显示':'隐藏' }</td>
										<td>${article.summary }</td>
										<td><qjk:fmt type="datetime" format="yyyy-MM-dd HH:mm:ss"
												src="${article.ctime}" /></td>
										<td><a href="/admin/content/notice/${article.articleId}/set">编辑</a>
											<a href="/admin/content/notice/${article.articleId}/delete">删除</a>
											<a href="/admin/content/notice/${article.articleId}/hidden">${article.hidden == 0 ?'隐藏':'取消隐藏'}</a>
										</td>
									</tr>
								</c:forEach>
								<qjk:pager columnSize="6" value="pager" />

							</tbody>
						</table>

					</c:if>
					
					<div class="ui-bottombar">
						<a href="/admin/content/notice/0/set" class="ui-btn">+ 创建公告</a>
					</div>

				</div>
			</div>

		</div>
	</div>
</body>
</html>