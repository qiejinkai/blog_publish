<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="qjk" uri="/qjk/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小幸运-郄金凯个人博客网站―梦想路上狂奔的一条疯狗</title>
<meta name="keywords" content="小幸运，个人博客,郄金凯" />
<meta name="description" content="小幸运-郄金凯个人博客网站―梦想路上狂奔的一条疯狗" />
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link href="/home/css/base.css" rel="stylesheet">
<link href="/home/css/index.css" rel="stylesheet">
<link href="/home/css/main.css" rel="stylesheet">
<script src="/home/js/silder.js"></script>
<script type="text/javascript" src="/js/jquery.mini.js"></script>
</head>
<body>
	<%@include file="header.jsp" %>
	<div class="banner" style="background: url(${banner.image}) top center;">
		<div class="header-photo">
			<div class="rotate-bar">
				<a class="rotate-git" href="https://github.com/qiejinkai" target="_blank"><img
					src="/home/images/github.jpg" /></a> <a class="rotate-wechat"
					href="#weixin"><img src="/home/images/wechat.jpg" /></a>
			</div>
			<div class="rotate-bar1"></div>
			<div class="rotate-bar2"></div>
			<div class="rotate-bar3"></div>
			<img class="rotate-photo" src="/home/images/photos.jpg">
		</div>
		<section class="box">
			<ul class="texts">
				<p></p>
				<p></p>
				<p>梦想路上狂奔的一条疯狗</p>
			</ul>
			<!-- 			<div class="avatar">
				<a href="#"><span>郄金凯</span></a>
			</div> -->
		</section>
	</div>
	<div class="template" style="display: none">
		<div class="box">
			<h3>
				<p>
					<span>专题</span>
				</p>
			</h3>
			<ul>
				<li><a href="/" target="_blank"><img
						src="/home/images/01.jpg"></a><span>仿新浪博客风格・梅――古典个人博客模板</span></li>
				<li><a href="/" target="_blank"><img
						src="/home/images/02.jpg"></a><span>黑色质感时间轴html5个人博客模板</span></li>
				<li><a href="/" target="_blank"><img
						src="/home/images/03.jpg"></a><span>Green绿色小清新的夏天-个人博客模板</span></li>
				<li><a href="/" target="_blank"><img
						src="/home/images/04.jpg"></a><span>女生清新个人博客网站模板</span></li>
				<li><a href="/" target="_blank"><img
						src="/home/images/02.jpg"></a><span>黑色质感时间轴html5个人博客模板</span></li>
				<li><a href="/" target="_blank"><img
						src="/home/images/03.jpg"></a><span>Green绿色小清新的夏天-个人博客模板</span></li>
			</ul>
		</div>
	</div>
	<article>
		<h2 class="title_tj">
			<p>
				文章<span>推荐</span>
			</p>
		</h2>
		<div class="bloglist left">

			<c:forEach items="${articles }" var="article">

				<h3>${article.title }</h3>
				<figure>
					<img src="${article.image }">
				</figure>
				<ul>
					<p>${article.summary }...</p>
					<a title="${article.title }" href="/article/detail/${article.articleId }" target="_blank" class="readmore">阅读全文>></a>
				</ul>
				<p class="dateview">
					<span><qjk:fmt type="datetime" format="yyyy-MM-dd HH:mm:ss"
							src="${article.ctime}" /> </span><span>作者：${article.author }</span><span>个人博客：[<a
						href="/article/${article.group.groupId }">${article.group.name}</a>]<span>阅读：${article.pv}</span>
					</span>
				</p>
			</c:forEach>
		</div>
		<aside class="right">
			<div class="weather">
				<iframe width="250" scrolling="no" height="60" frameborder="0"
					allowtransparency="true"
					src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe>
			</div>
			<div class="news">
				<h3 class="tag">
					<p>
						热门<span>标签</span>
					</p>
				</h3>
				<ul class="cloud">
					<li><a href="/article/0/1/java">java</a></li>
					<li><a href="/article/0/1/SpringMVC">SrpingMVC</a></li>
					<li><a href="/article/0/1/web">web开发</a></li>
					<li><a href="/article/0/1/网站搭建">网站搭建</a></li>
					<li><a href="/article/0/1/html">Html</a></li>
					<li><a href="/article/0/1/css3">CSS3</a></li>
					<li><a href="/article/0/1/linux">linux</a></li>
					<li><a href="/article/0/1/Javasript">Javasript</a></li>
					<li><a href="/article/0/1/nodejs">nodejs</a></li>
					<li><a href="/article/0/1/redis">redis</a></li>
					<li><a href="/article/0/1/mysql">mysql</a></li>
					<li><a href="/article/0/1/github">github</a></li>
				</ul>
				<h3>
					<p>
						最新<span>文章</span>
					</p>
				</h3>
				<ul class="rank">
					<c:forEach items="${lastest }" var="article">
						<li><a href="/article/detail/${article.articleId }" title="${article.title }" target="_blank">${article.title }</a></li>
					</c:forEach>
				</ul>
				<h3 class="ph">
					<p>
						点击<span>排行</span>
					</p>
				</h3>
				<ul class="paih">

					<c:forEach items="${mostpv }" var="article">
						<li><a href="/article/detail/${article.articleId }" title="${article.title }" target="_blank">${article.title }</a></li>
					</c:forEach>
				</ul>
				<h3 class="links">
					<p>
						友情<span>链接</span>
					</p>
				</h3>
				<ul class="website">
					<c:forEach items="${friendlinks }" var="article">
						<li><a href="${article.link }">${article.title }</a></li>
					</c:forEach>
				</ul>
			</div>
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
			<a id="weixin" href="#"></a>
			<img class="weixin" src="/home/images/weixin.jpg"/>
		</aside>
	</article>

	<%@include file="footer.jsp" %>
</body>
</html>