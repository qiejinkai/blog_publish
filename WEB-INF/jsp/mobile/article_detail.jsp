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
<title>小幸运-${article.title }</title>
<meta name="keywords" content="小幸运,个人博客,郄金凯,${article.tags }" />
<meta name="description" content="${article.title }" />
<meta name="viewport" content="width=device-width,initial-scale=1, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no, minimal-ui">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="author" content="郄金凯,qiejinkai@126.com">
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link rel="stylesheet" type="text/css" href="/mobile/css/com/touch.css" />
<link rel="stylesheet" type="text/css" href="/mobile/css/com/head.css" />
 <link rel="stylesheet" type="text/css" href="/mobile/css/com/footer.css" />
<link rel="stylesheet" type="text/css" href="/mobile/css/home.css" />
<link rel="stylesheet" type="text/css" href="/home/css/message.css" />
<link rel="stylesheet" type="text/css" href="/mobile/css//swripe.min.css" />
<link rel="stylesheet" type="text/css" href="/mobile/css//swripe.css">

<script type="text/javascript" src="/js/jquery.mini.js"></script>
<script type="text/javascript" src="/js/jquery.tip.js"></script>
<script type="text/javascript" src="/js/jquery.superslide.js"></script>
<script src="/ueditor/third-party/SyntaxHighlighter/shCore.js" type="text/javascript"></script>
    <link href="/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css"rel="stylesheet" type="text/css" >
    <script type="text/javascript" language="javascript">
        $(function(){
            SyntaxHighlighter.all();
        });
    </script>
</head>
<body>
<%@include file="m_header.jsp" %>

<div class="wrap">
	

    <!-- sign begin-->
    <input id="groupId" type="hidden" value="${curr_groupId}"/>
    <input id="keywords" type="hidden" value="${keywords }"/>
    <div class="item_box">
        <div class="item_list">
            <div class="item_list_top">
                <h2>${article.title }</h2>
                <p><qjk:fmt type="datetime" format="yyyy-MM-dd HH:mm:ss" src="${article.ctime}" />&nbsp;&nbsp;作者：${article.author }&nbsp;&nbsp;阅读：${article.pv }</p>
            </div>
            <div class="item_img">
                <img src="${article.image }">
                <span class="sp6">${article.group.name }</span>
                <span class="lb">文章</span> 
                
            </div>           
            <div class="item_list_content">
                ${article.content }
            </div>
            <div class="item_list_top">
				<p>
					上一篇：					
					<c:choose >
					<c:when test="${!empty prev }">
					<a href="/article/detail/${prev.articleId}">${prev.title }</a>
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
					<a href="/article/detail/${next.articleId}">${next.title }</a>
					</c:when>
					<c:otherwise>
					<a href="/">没有了</a>
					</c:otherwise>
					</c:choose>
				</p>
		</div>
					<!-- message Begin -->
 			<div class="ds-thread" id="ds-thread" >
 			<div id="ds-reset">
				<div class="ds-comments-info">
					<div class="ds-sort"></div>
					<ul class="ds-comments-tabs">
						<li class="ds-tab"><a
							class="ds-comments-tab-duoshuo ds-current"
							href="javascript:void(0);"> <span class="ds-highlight">${messages.totalRows }</span>条评论
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
					<qjk:mpager url="/article/detail/${article.articleId }/" value="messages"/>
				</div>
				<c:if test="${empty user }">
				<div class="ds-login-buttons">
					<p>社交帐号登录:</p>
						
						<div class="ds-social-links">
							<ul class="ds-service-list">
								<li>
									<a href="/wxuser/login/?r=/article/detail/${article.articleId }" rel="nofollow" class="ds-service-link ds-weixin">微信</a>
								</li>
								</ul>
						</div>
						<div class="ds-social-links">
							<ul class="ds-service-list">
								<li>
									<a href="/qquser/login/?r=/article/detail/${article.articleId }" rel="nofollow" class="ds-service-link ds-qq">QQ</a>
								</li>
								</ul>
						</div>
						<div class="ds-social-links">
							<ul class="ds-service-list">
								<li>
									<a href="/wbuser/login/?r=/article/detail/${article.articleId }" rel="nofollow" class="ds-service-link ds-wb">微博</a>
								</li>
								</ul>
						</div>
				</div>
				</c:if>
				
				<c:if test="${!empty user }">
				<div class="ds-login-buttons">
					<p>当前登陆用户:<span style="color:red;cursor:pointer">${user.nick }</span></p>
						<div class="ds-social-links">
							<ul class="ds-service-list">
								<li>
									<a href="/logout/?r=/article/detail/${article.articleId }" >退出</a>
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
						<input type="hidden" name="articleId" value="${article.articleId }">
						<input type="hidden" name="uid" value="${user.uid}">
						<div class="ds-textarea-wrapper ds-rounded-top">
							<textarea id="content" name="content" placeholder="说点什么吧…"></textarea>
							<pre class="ds-hidden-text"></pre>
						</div>
						<div class="ds-post-toolbar">
							<div class="ds-post-options ds-gradient-bg">
							</div>
							<button class="ds-post-button" id="messageButton" type="button">发布</button>
							<div class="ds-toolbar-buttons">
								<span id="quoteMsg"></span>
								<input type="hidden" name="quoteId" value="0">
							</div>
						</div>
					</form>
				</div>
				</div>
		</div>

	<script type="text/javascript" src="/mobile/js/message.js"></script>
			<!-- message End -->
        </div>
         <div class="item_list">
         </div>
 
</div>



</div>

<a class="top_back" style="display: ;"></a>
<script>
    $(window).scroll(function(){
        var st = $(window).scrollTop();
        if(st>300){
            $('.top_back').show();
        }
        else $('.top_back').hide();
        $('.top_back').click(function(){
            window.scrollTo(0,0);
        });
        return false;
    });
    

</script>

<%@include file="m_footer.jsp" %>

</body>
</html>