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
<meta name="description" content="小幸运-日记" />
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
	

    <!-- sign begin-->
    <input id="groupId" type="hidden" value="${curr_groupId}"/>
    <input id="keywords" type="hidden" value="${keywords }"/>
    <div class="item_box">
    <c:forEach items="${articles }" var="article">
        <div class="item_list">
            <div class="item_list_top">
                <h2>${article.title }</h2>
                <p>${article.summary }</p>
            </div>
            <div class="item_img">
                <img src="${article.image }">
                <span class="lb">日记</span> 
                <div class="item_share">
                    <a class="left">阅读：${article.pv }</a>
                    <a class="detail" >作者：${article.author }</a>
                    <a class="right r1" href='#'></a>
                </div>
            </div>           
            <div class="item_bottom">
                <div class="item_share">
                    <a class="click_btn" href="/diary/detail/${article.articleId }">阅读全文</a>
                </div>
            </div>
        </div>
	</c:forEach>
</div>
     <div class="btn_box" style="margin-right: 10px;margin-left: 10px">
        <a class="more_btn">查看更多</a>
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
    
    $(function(){
    	var index = 1;
    	var groupId = $("#groupId").val();
    	var keywords = $("#keywords").val();
    	
    	$(".more_btn").bind("click",function(){
    		index ++;
    		//alert(groupId);
    		//alert(keywords);
    		var url = "/diary";
			$.ajax({
				url : url,
				type : 'POST',
				data : {
					json : 'json',
					groupId : groupId,
					pageIndex:index,
					keywords:keywords
				},
				dataType : 'json',
				success : function(res) {
					if (res.error) {
						return;
					} else {
						if(res.ismore == 'no'){
							$(".more_btn").text("没有了");
							$(".more_btn").unbind('click');
						}
						
						var articles = res.articles;
						if(articles != null && articles.length > 0){
							for(var i=1;i<=articles.length;i++ ){
								var article=articles[i-1];
								var div=addArticle(article);
								
								$(".item_box").append(div);
								
							}
						}
						
					}
					return false;
				},
				error :  function(XMLHttpRequest, textStatus, errorThrown) {
					/*  alert(XMLHttpRequest.status);
					 alert(XMLHttpRequest.readyState);
					 alert(textStatus); */
					 return false;
					 }
			});
    	});
    	
    	function addArticle(article){
    		
    		var str = "";
    		str+='<div class="item_list">';
    		str+='<div class="item_list_top">';
    		str+='<h2>'+article.title+'</h2>';
    		str+='<p>'+article.summary+'</p>';
    		str+='</div>';
    		str+='<div class="item_img">';
    		str+='<img src="'+article.image+'">';
    		str+='<span class="lb">文章</span>'; 
    		str+='<div class="item_share">';
			str+='<a class="left">阅读：'+article.pv+'</a>';
    		str+='<a class="detail" href="/">作者：'+article.author+'</a>';
    		str+='<a class="right r1" href="http://service.weibo.com/share/share.php?url=http%3A%2F%2Fqiejinkai.com%2Fproject%2F%3Fid%3D4&title='+article.title+'&pics='+article.image+'&source=bookmark&appkey=2992571369&ralateUid="></a>';
    		str+='</div>';
    		str+='</div>';           
    		str+='<div class="item_bottom">';
    		str+='<div class="item_share">';
    		str+='<a class="click_btn" href="/diary/detail/'+article.articleId+'">阅读全文</a>';
    		str+='</div>';
    		str+='</div>';
    		str+='</div>';

    		return str;
    		
    	}
    });
</script>

<%@include file="m_footer.jsp" %>

</body>
</html>