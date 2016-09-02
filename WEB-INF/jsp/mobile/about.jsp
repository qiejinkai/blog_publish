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
<meta name="description" content="小幸运-关于我" />
<meta name="viewport" content="width=device-width,initial-scale=1, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no, minimal-ui">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="author" content="郄金凯,qiejinkai@126.com">
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link rel="stylesheet" type="text/css" href="/mobile/css/com/touch.css" />
<link rel="stylesheet" type="text/css" href="/mobile/css/com/head.css" />
 <link rel="stylesheet" type="text/css" href="/mobile/css/com/footer.css" />
<link rel="stylesheet" type="text/css" href="/mobile/css/about.css" />
<link rel="stylesheet" type="text/css" href="/mobile/css//swripe.min.css" />
<link rel="stylesheet" type="text/css" href="/mobile/css//swripe.css">

<script type="text/javascript" src="/js/jquery.mini.js"></script>
<script type="text/javascript" src="/js/jquery.superslide.js"></script>
</head>
<body>
<%@include file="m_header.jsp" %>

<div class="wrap">
	

    <!-- sign begin-->
    <div class="item_box">
        <div class="item_list">
            <div class="item_list_top" >
                <h2>关于我</h2>
              <ul>
				<p>郄金凯，男。</p>
				<p>不是什么企业的闯死人,也不是什么公司的leader；</p>
				<p>不是失落民间的皇子，也不是上古之神遗留的血脉；</p>
				<p>没有绝世武功，没有倾世容颜；</p>
				<p>没有家财万贯，没有权势滔天；</p>
				<p>
					简简单单，梦想路上狂奔的一条疯狗，逮谁不咬谁。
				</p>
			</ul>
            </div>
        </div>
        
        <div class="item_list">
            <div class="item_list_top" style=" padding: 0.8rem 1rem;background: #fff;overflow: hidden;">
              	<p>
					网名：<span>小幸运丶情话</span> 
				</p>
				<p>姓名：郄金凯</p>
				<p>生日：1990-07</p>
				<p>籍贯：河北省―石家庄市</p>
				<p>现居：北京市―通州区</p>
				<p>职业：Java软件工程师<span>(程序猿)</span></p>
				<p>喜欢的书：仙侠小说(貌似很久没看了。。)</p>
				<p>喜欢的游戏：wow(AFK多年);炉石传说</p>
				<p>战网ID：有兴趣的可以加我 <span>情话#51529</span></p>
				<p>github：<a href="https://github.com/qiejinkai"><span>https://github.com/qiejinkai</span></a></p>
            </div>
        </div>
        
<!--         <div class="item_list">
            <div class="item_list_top">
                <h2>扫码加我好友吧</h2>
            </div>
            <div class="item_img">
                <img src="/home/images/weixin.jpg">
                
            </div>           
            
        </div> -->
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