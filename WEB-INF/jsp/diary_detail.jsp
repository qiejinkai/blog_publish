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
<title>郄金凯个人博客网站―梦想路上狂奔的一条疯狗</title>
<meta name="keywords" content="个人博客,郄金凯" />
<meta name="description" content="郄金凯个人博客网站―梦想路上狂奔的一条疯狗" />
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link href="/home/css/base.css" rel="stylesheet">
<link href="/home/css/template.css" rel="stylesheet">
<script type="text/javascript" src="/js/jquery.mini.js"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<script src="/ueditor/third-party/SyntaxHighlighter/shCore.js" type="text/javascript"></script>
    <link href="/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css"rel="stylesheet" type="text/css" >
    <script type="text/javascript" language="javascript">
        $(function(){
            SyntaxHighlighter.all();
        });
    </script>
</head>
<body>
	<%@include file="header.jsp" %>
	<article class="blogs">
		<h1 class="t_nav">
			<span>您当前的位置：
			<a href="/">首页</a>&nbsp;&gt;&nbsp;
			<a href="/diary">文章</a>&nbsp;&gt;&nbsp;
			${article.title }</span>
			<a href="/" class="n1">首页</a>
			<a href="/diary" class="n2">日记</a>
			<a href="#" class="n3">${article.title }</a>
		</h1>
		<div class="index_about">
			<h2 class="c_titile">${article.title }</h2>
			<p class="box_c">
				<span class="d_time">发布时间：<qjk:fmt type="datetime" format="yyyy-MM-dd HH:mm:ss" src="${article.ctime}" /> </span>
				<span>编辑：${article.author}</span>
				<span>阅读：${article.pv}</span>
				<!-- <span>互动QQ群：<a
					href="http://wp.qq.com/wpa/qunwpa?idkey=d4d4a26952d46d564ee5bf7782743a70d5a8c405f4f9a33a60b0eec380743c64">280998807</a></span> -->
			</p>
			<ul class="infos">
				${article.content }
			</ul>
		
			<div class="keybq">
				<p>
					<span>关键字词</span>：${article.tags }
				</p>

			</div>
			<div class="ad"></div>
			<div class="nextinfo">
				<p>
					上一篇：					
					<c:choose >
					<c:when test="${!empty prev }">
					<a href="/diary/detail/${prev.articleId}">${prev.title }</a>
					</c:when>
					<c:otherwise>
					<a href="/">没有了</a>
					</c:otherwise>
					</c:choose>
				</p>
				<p>
					下一篇：
					<c:choose >
					<c:when test="${!empty next }">
					<a href="/diary/detail/${next.articleId}">${next.title }</a>
					</c:when>
					<c:otherwise>
					<a href="/">没有了</a>
					</c:otherwise>
					</c:choose>
				</p>
			</div>
			<c:if test="${!empty otherlink }">
			<div class="otherlink">
				<h2>相关文章</h2>
				<ul>
					<c:forEach items="${otherlink }" var="article">
					<li><a href="/diary/detail/${article.articleId }" title="${article.title }">${article.title }</a></li>
					</c:forEach>
					
				</ul>
			</div>
			</c:if>
		</div>
		<aside class="right">
			<div class="weather">
				<iframe width="250" scrolling="no" height="60" frameborder="0"
					allowtransparency="true"
					src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe>
			</div>
			<div class="news">
				<h3>
					<p>
						最新<span>日记</span>
					</p>
				</h3>
				<ul class="rank">
					<c:forEach items="${lastest }" var="article">
						<li><a href="/diary/detail/${article.articleId }" title="${article.title }" target="_blank">${article.title }</a></li>
					</c:forEach>
				</ul>
				
				<h3 class="ph">
					<p>
						点击<span>排行</span>
					</p>
				</h3>
				<ul class="paih">

					<c:forEach items="${mostpv }" var="article">
						<li><a href="/diary/detail/${article.articleId }" title="${article.title }" target="_blank">${article.title }</a></li>
					</c:forEach>
				</ul>
			</div>
<!-- 			<div class="visitors">
				<h3>
					<p>最近访客</p>
				</h3>
				<ul>

				</ul>
			</div> -->
			<!-- Baidu Button BEGIN -->
			<div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare">
				<a class="bds_tsina"></a><a class="bds_qzone"></a><a class="bds_tqq"></a><a
					class="bds_renren"></a><span class="bds_more"></span><a
					class="shareCount"></a>
			</div>
			<script type="text/javascript" id="bdshare_js"
				data="type=tools&amp;uid=6574585"></script>
			<script type="text/javascript" id="bdshell_js"></script>
			<script type="text/javascript">
				document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion="
						+ Math.ceil(new Date() / 3600000)
			</script>
			<!-- Baidu Button END -->
		</aside>
	</article>
	<%@include file="footer.jsp" %>
	<script src="/home/js/silder.js"></script>
</body>
</html>