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
<meta name="keywords" content="小幸运,个人博客,郄金凯" />
<meta name="description" content="小幸运-郄金凯个人博客网站―梦想路上狂奔的一条疯狗" />
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
<link rel="stylesheet" type="text/css" href="/mobile/css//swripe.min.css" />
<link rel="stylesheet" type="text/css" href="/mobile/css//swripe.css">

<script type="text/javascript" src="/js/jquery.mini.js"></script>
<script type="text/javascript" src="/js/jquery.superslide.js"></script>
</head>
<body>
<%@include file="m_header.jsp" %>

<div class="wrap">
	
	<c:if test="${!empty bannerList }">

	    <div class="slider">
	        <ul class="slider_item">
	        	<c:forEach items="${bannerList }" var="banner">
	            <li style='background:url(${banner.image}) top center no-repeat; background-size:120% 100%'>
	                <a href="${banner.link }"></a>
	            </li>
	            </c:forEach>
	  
	        </ul>
	        
	        <ul class="slider_index"></ul>
	    </div>
	    <script>
	        $(".slider").slide({
	            titCell: ".slider_index",
	            mainCell: ".slider_item",
	            effect: "fold",
	            autoPlay: true,
	            delayTime: 700,
	            autoPage: true
	        });
	    </script>
    </c:if>
    <!-- sign begin-->

    <!-- 人气精选 -->
    <c:if test="${!empty infomationList }">
	    <div class="swiper-container  swiper2">
	
	        <div class="swiper-wrapper">
	        	<c:forEach items="${infomationList }" var="infomation">
	            <div class="swiper-slide">
	                <h2>${infomation.title }</h2>
	               <a href="${infomation.link }"><img src="${infomation.image }"/></a>
	            </div>
	            </c:forEach>
	        </div>
	    </div>
    </c:if>
    <!-- Swiper end -->

    <script src="http://m.z.jd.com/static/js/common/util.js"></script>
    <script src="http://m.z.jd.com/static/js/common.js"></script>
    <script src="http://m.z.jd.com/static/js/index/swiper.min.js"></script>
    <script src="http://m.z.jd.com/static/js/index/index.js"></script>
    
    <div class="item_box">
    <c:forEach items="${articles }" var="article">
        <div class="item_list">
            <div class="item_list_top">
                <h2>${article.title }</h2>
                <p>${article.summary }</p>
            </div>
            <div class="item_img">
                <img src="${article.image }">
                <span class="sp6">${article.group.name }</span>
                <span class="lb">文章</span> 
                <div class="item_share">
                    <a class="left">阅读：${article.pv }</a>
                    <a class="detail" href="/">作者：${article.author }</a>
                    <a class="right r1" href='#'></a>
                </div>
            </div>
           
            <div class="item_bottom">
                <div class="item_share">
                    <a class="click_btn"  href="/article/detail/${article.articleId }">阅读全文</a>
                </div>
            </div>
        </div>
	</c:forEach>
<!--     <div class="btn_box">
        <a class="more_btn">更多项目</a>
    </div> -->
</div>

</div>

<a class="top_back" style="display: none;"></a>
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