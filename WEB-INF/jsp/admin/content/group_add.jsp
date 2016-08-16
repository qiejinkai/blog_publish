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
<title>文章管理</title>
<%@include file="../css.html"%>
<%@include file="../script.html"%>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>

	<div class="ef-main">
		<jsp:include page="../toolbar.jsp"></jsp:include>
		<div class="ef-block">

			<h1>
				<a href="/admin/content/article/">文章管理</a><span
					class="icon-angle-right"></span>新建分组
			</h1>
			<p class="txt">创建新的分组</p>

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
						<table class="ui-form">
							<tbody>
								<tr>
									<th>标题</th>
								</tr>
								<tr>
									<td>
										<div class="ui-field">
											<span class="r ui-icon"></span> <input type="text"
												class="ui-input rp" name="name" value="${group.name}"
												limit-length="10" autovalidate-required="true" />
										</div> <span class="note">10个字</span>
									</td>
								</tr>
								
								<tr>
									<th>说明</th>
								</tr>
								<tr>
									<td><textarea class="ui-input" name="summary" style="width: 100%; height: 100px;"
											maxlength="512">${group.summary }</textarea></td>
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

	<script type="text/javascript">
		
	</script>
</body>
</html>