<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="qjk" uri="/qjk/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小幸运-郄金凯个人博客网站―梦想路上狂奔的一条疯狗</title>
<meta name="keywords" content="小幸运，个人博客,郄金凯" />
<meta name="description" content="小幸运-郄金凯个人博客网站―梦想路上狂奔的一条疯狗" />
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link href="/home/css/base.css" rel="stylesheet">
<link href="/home/css/mood.css" rel="stylesheet">
<script type="text/javascript" src="/js/jquery.mini.js"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
	<%@include file="header.jsp" %>
	<div class="moodlist">
		<h1 class="t_nav">
			<span>删删写写，回回忆忆，虽无法行云流水，却也可碎言碎语。</span>
			<a href="/" class="n1">首页</a>
			<a href="#" class="n2">说说</a>
		</h1>
		<div class="bloglist">
			<c:forEach items="${pager.list }" var="mood">
			<ul class="arrow_box">
				<div class="sy">
					<c:if test="${!empty mood.image }">
					<img src="${mood.image }">
					</c:if>
					${mood.content }
				</div>
				<span class="dateview"><qjk:fmt type="datetime" format="yyyy-MM-dd HH:ss:mm" src="${mood.ctime }"/> </span>
			</ul>
			</c:forEach>

		</div>
		<div class="page">
			<qjk:hpager url="/mood/" value="pager"/>
		</div>
	</div>
	<%@include file="footer.jsp" %>
	<script src="js/silder.js"></script>
</body>
</html>