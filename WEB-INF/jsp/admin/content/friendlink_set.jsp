<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="qjk" uri="/qjk/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>友情链接管理</title>
<%@include file="../css.html"%>
<%@include file="../script.html"%>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>

	<div class="ef-main">
		<jsp:include page="../toolbar.jsp"></jsp:include>
		<div class="ef-block">

			<h1>
				<a href="/admin/content/friendlink/1">友情链接管理</a> <span
					class="icon-angle-right"></span>
				<c:if test="${article.articleId == 0}">
					新建友情链接
					</c:if>
				<c:if test="${article.articleId != 0 }">
					修改友情链接
					</c:if>
			</h1>
			<p class="txt">${article.articleId == 0?'新建友情链接':'修改友情链接'}</p>

			<div class="content">

				<div class="container">

					<div class="ui-flash ui-yellow"
						style="${empty success?'display:none':''}">
						<p>${success}</p>
					</div>

					<div class="ui-flash ui-red"
						style="${empty error?'display:none':''}">
						<p>${error }</p>
					</div>

					<form action="" method="post">
						<input type="hidden" name="articleId" value="${article.articleId}" />
						<input type="hidden" name="alias" value="friendlink" /> <input
							type="hidden" name="hidden" value="${article.hidden}" />
						<table class="ui-form">
							<tbody>
								<tr>
									<th>标题</th>
								</tr>
								<tr>
									<td>
										<div class="ui-field">
											<span class="r ui-icon"></span> <input type="text"
												class="ui-input rp" name="title" value="${article.title}"
												limit-length="70" autovalidate-required="true" />
										</div> <span class="note">70个字</span>
									</td>
								</tr>

								<tr>
									<th>图片</th>
								</tr>
								<tr>
									<td><a class="ui-image" href="javascript:;"
										data-clips="maxwidth" data-width="600"
										style="width: 320px; height: 220px;"> <input type="file"
											class="ui-image" name="image" data-value="${article.image}" />
											<img class="view" />
									</a></td>
								</tr>

								<tr>
									<th>链接</th>
								</tr>
								<tr>
									<td><input type="text" class="ui-input" name="link"
										value="${article.link }" /></td>
								</tr>

							</tbody>
							<tfoot>
								<tr>
									<td><input type="submit" value="提交" class="ui-btn" /></td>
								</tr>
							</tfoot>
						</table>
					</form>


				</div>
			</div>

		</div>
	</div>

</body>
</html>