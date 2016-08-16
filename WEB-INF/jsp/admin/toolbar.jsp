<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<ul class="ui-toolbar">
	<li>
		<a href="">
			<span class="ui-icon icon-th-list"></span>
		</a>
	</li>
	<li class="r">
		<a href="/admin/logout/">
			<span class="ui-icon icon-logout"></span>
			注销
		</a>
	</li>
	<li class="r">
		<a href="/admin/me/" title="${admin.lastLoginIP }">
			<span class="ui-icon icon-user"></span>
${admin.name}
		</a>
	</li>
</ul>
</body>
</html>