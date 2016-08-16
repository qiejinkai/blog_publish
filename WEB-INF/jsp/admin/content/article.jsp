<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="qjk" uri="/qjk/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章管理</title>
<%@include file="../css.html"%>
<%@include file="../script.html"%>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>

	<div class="ef-main">
		<jsp:include page="../toolbar.jsp"></jsp:include>
		<div class="ef-block">

			<h1>文章管理</h1>
			<p class="txt">可在此管理本平台的文章素材内容</p>
			<div class="content">

				<ul class="ui-tabbar">
					<c:forEach items="${groups}" var="group">
						<li><a href="/admin/content/article/${group.groupId }/1"
							class="${group.groupId eq groupId ?'selected':''}">${group.name}</a></li>
					</c:forEach>
					<li>
					<a href="/admin/content/article/group/add"style="background-color: #35ac3e;color: white;">+</a>
					<li>
				</ul>
<%-- 
				<p class="ef-summary">${group.summary}</p> --%>

			</div>

			<div class="content">

				<div class="container">

					<c:if test="${not empty pager }">
						<table class="ui-table">
							<thead>
								<tr>
									<td width="80px">ID</td>
									<td>标题</td>
									<td>标签</td>
									<td>状态</td>
									<td>首页展示</td>
									<td width="80px">浏览量</td>
									<td width="140px">创建时间</td>
									<td width="200px">操作</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pager.list }" var="article">
									<tr>
										<td>${article.articleId }</td>
										<td>${article.title }</td>
										<td>${article.tags }</td>
										<td>${article.hidden == 0 ?'显示':'隐藏' }</td>
										<td>${article.homeShow == 0 ?'不展示':'展示'}</td>
										<td>${article.pv }</td>
										<td><qjk:fmt type="datetime" format="yyyy-MM-dd HH:mm:ss"
												src="${article.ctime}" /></td>
										<td><a href="/admin/content/article/${article.articleId}/${article.group.groupId}/set">编辑</a>
											<a href="/admin/content/article/${article.articleId}/${article.group.groupId}/delete">删除</a>
											<a href="/admin/content/article/${article.articleId}/${article.group.groupId}/hidden">${article.hidden == 0 ?'隐藏':'取消隐藏'}</a>
											<a href="/admin/content/article/${article.articleId}/${article.group.groupId}/homeshow">${article.homeShow == 0 ?'首页展示':'取消展示'}</a>
										</td>
									</tr>
								</c:forEach>
								<qjk:pager columnSize="8" value="pager" />

							</tbody>
						</table>

					</c:if>
					
					<div class="ui-bottombar">
						<a href="/admin/content/article/0/${groupId}/set" class="ui-btn">+ 创建文章</a>
					</div>

				</div>
			</div>

		</div>
	</div>
</body>
</html>