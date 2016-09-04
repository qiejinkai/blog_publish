<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="qjk" uri="/qjk/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta charset="utf-8">
<title>小幸运-郄金凯个人博客网站―梦想路上狂奔的一条疯狗</title>
<meta name="keywords" content="小幸运，个人博客,郄金凯" />
<meta name="description" content="小幸运-郄金凯个人博客网站―梦想路上狂奔的一条疯狗" />
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link href="/home/css/base.css" rel="stylesheet">
<link href="/home/css/about.css" rel="stylesheet">
<link href="/home/css/message.css" rel="stylesheet">
<script type="text/javascript" src="/js/jquery.mini.js"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<script src="/js/jquery.tip.js"
	type="text/javascript"></script>
<link href='http://fonts.googleapis.com/css?family=Architects+Daughter'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<%@include file="header.jsp" %>
	<article class="aboutcon">
		<h1 class="t_nav">
			<span>小幸运-梦想路上狂奔的一条疯狗</span>
			<a href="/" class="n1">网站首页</a>
			<a href="#" class="n2">留言板</a>
		</h1>
		<div class="about left">
		<!-- message Begin -->
 			<div class="ds-thread" id="ds-thread" style="margin-right: 20px">
 			<div id="ds-reset">
				<div class="ds-comments-info">
					<div class="ds-sort"></div>
					<ul class="ds-comments-tabs">
						<li class="ds-tab"><a
							class="ds-comments-tab-duoshuo ds-current"
							href="javascript:void(0);"> <span class="ds-highlight">${messages.totalRows }</span>条留言
						</a></li>
					</ul>
				</div>
				<ul class="ds-comments">
					<c:forEach items="${messages.list }" var="message">
						<li class="ds-post">
							<div class="ds-post-self">
								<div class="ds-avatar">
									 <img
										src="${message.user.logo }">
								</div>
								<div class="ds-comment-body">
									<div class="ds-comment-header">
										<a class="ds-user-name ds-highlight"  
											>${message.user.nick }</a>
									</div>
									 <c:if test="${!empty message.quote }"> 
										<div class="blockquote">
										<p class="quote_title">引用 ${message.quote.user.nick } 的发言：</p>
										
										<p>${message.quote.content }</p>
										
										</div>
									 </c:if> 
									<p>${message.content }</p>
									<div class="ds-comment-footer ds-comment-actions">
										<span class="ds-time"><qjk:fmt type="datetime"
												format="yyyy-MM-dd HH:ss:mm" src="${message.ctime }" /></span>
												 <a class="ds-post-repost" href="#in" data-id="${message.messageId }" data-nick="${message.user.nick }" >
												 <span class="ds-icon ds-icon-share"></span>引用
												 </a>

									</div>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div class="ds-paginator">
					<div class="ds-border"></div>
					<qjk:mpager url="/message/" value="messages"/>
				</div>
				<c:if test="${empty user }">
				<div class="ds-login-buttons">
					<p>社交帐号登录:</p>
<!-- 						<div class="ds-social-links">
							<ul class="ds-service-list">
								<li>
									<a href="#" rel="nofollow" class="ds-service-link ds-weixin">微信</a>
								</li>
								</ul>
						</div> -->
						<div class="ds-social-links">
							<ul class="ds-service-list">
								<li>
									<a href="#" rel="nofollow" class="ds-service-link ds-qq">QQ</a>
								</li>
								</ul>
						</div>
						<div class="ds-social-links">
							<ul class="ds-service-list">
								<li>
									<a href="#" rel="nofollow" class="ds-service-link ds-wb">微博</a>
								</li>
								</ul>
						</div>
				</div>
				</c:if>
				<div class="ds-replybox">
				<a class="ds-avatar">
					<img src="${empty user?'/img/default.jpg':user.logo }" alt="">
				</a>
				<a id="in" href="javascript:;"></a>
					<form id="messageForm" method="post" action="/message/create" onsubmit="return false;">
						<input type="hidden" name="articleId" value="0">
						<input type="hidden" name="uid" value="${user.uid}">
						<div class="ds-textarea-wrapper ds-rounded-top">
							<textarea id="content" name="content" placeholder="说点什么吧…"></textarea>
							<pre class="ds-hidden-text"></pre>
						</div>
						<div class="ds-post-toolbar">
							<div class="ds-post-options ds-gradient-bg">
							</div>
							<button class="ds-post-button" type="button" id="messageButton">发布</button>
							<div class="ds-toolbar-buttons">
								<span id="quoteMsg"></span>
								<input type="hidden" name="quoteId" value="0">
							</div>
						</div>
					</form>
				</div>
				</div>
		</div>

	<script type="text/javascript" src="/home/js/message.js"></script>
			<!-- message End -->
		</div>
		<aside class="right">
			<div class="about_c">
				<p>
					网名：<span>小幸运丶情话</span> 
				</p>
				<p>姓名：郄金凯</p>
				<p>生日：1990-07</p>
				<p>籍贯：河北省―石家庄市</p>
				<p>现居：北京市―通州区</p>
				<p>职业：Java软件工程师<span>(程序猿)</span></p>
				<p>喜欢的动漫：妖精的尾巴(最喜欢梅比斯)</p>
				<p>喜欢的书：仙侠小说(貌似很久没看了。。)</p>
				<p>喜欢的游戏：wow(AFK多年);炉石传说</p>
				<p>战网ID：有兴趣的可以加我 <span>情话#51529</span></p>
				<p>github：<a href="https://github.com/qiejinkai"><span>https://github.com/qiejinkai</span></a></p>
<!-- 				<a target="_blank"
					href="http://wp.qq.com/wpa/qunwpa?idkey=d4d4a26952d46d564ee5bf7782743a70d5a8c405f4f9a33a60b0eec380743c64">
					<img src="http://pub.idqqimg.com/wpa/images/group.png"
					alt="杨青个人博客网站" title="杨青个人博客网站">
				</a> <a target="_blank"
					href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&amp;email=HHh9cn95b3F1cHVye1xtbTJ-c3E"><img
					src="http://rescdn.qqmail.com/zh_CN/htmledition/images/function/qm_open/ico_mailme_22.png"
					alt="杨青个人博客网站"></a> -->
			</div>
			
			<img class="weixin" src="/home/images/weixin.jpg"/>
		</aside>
	</article>
	<%@include file="footer.jsp" %>
	<script src="js/silder.js"></script>
</body>
</html>