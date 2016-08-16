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
<meta name="viewport" content="width=device-width,initial-scale=1, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no, minimal-ui">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link rel="stylesheet" type="text/css" href="/mobile/css/com/touch.css" />
<link rel="stylesheet" type="text/css" href="/mobile/css/com/head.css" />
 <link rel="stylesheet" type="text/css" href="/mobile/css/com/footer.css" />
<link rel="stylesheet" type="text/css" href="/mobile/css/home.css" />
<link rel="stylesheet" type="text/css" href="/mobile/css//swripe.min.css" />
<link rel="stylesheet" type="text/css" href="/mobile/css//swripe.css">

<script type="text/javascript" src="/js/jquery.mini.js"></script>
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
                <p><qjk:fmt type="datetime" format="yyyy-MM-dd HH:mm:ss" src="${article.ctime}" />&nbsp;&nbsp;作者：${article.author }&nbsp;&nbsp;阅读：${article.author }</p>
            </div>
            <div class="item_img">
                <img src="${article.image }">
                <span class="lb">日记</span> 
                
            </div>           
            <div class="item_list_content">
                ${article.content }
            </div>
            <div class="item_list_top">
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