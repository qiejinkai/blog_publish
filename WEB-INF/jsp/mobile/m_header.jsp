<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="top_nav">
    <a href="/"  class="m_logo"></a>
    <a class="m_menu"></a>
    <span style="size: 40px;color: white;float: right;margin-right: 15px" id="title"></span>
</div>
<div class="m_menu_box">
    <div class="m_menu_list">
        <div class="m_menu_section">
            <a class="icon_1">文章</a>
            <ul id="u1">
                
            </ul>
        </div>
        <div class="m_menu_section">
            <a class="icon_1" href="/about/">关于我</a>
        </div>
        <div class="m_menu_section">
            <a class="icon_1" href="/diary/">日记</a>
            <!--<a class="tit" href="">登录</a>-->
        </div>
        <div class="m_menu_section">
            <a class="icon_1" href="/message/">留言</a>
            <!--<a class="tit" href="">登录</a>-->
        </div>
    </div>
</div>
<script>
    $(function(){
    	
    	function setTitle(){
    		var curr_href = window.location.pathname;
    		var title = $("#title");
    		if (curr_href == "" || curr_href == "/") {

    			title.text("首页");

    		} else {

   				if (curr_href.indexOf("/article") == 0) {
   					title.text("文章");
   					return;
   				}
   				if (curr_href.indexOf("/diary") == 0) {
   					title.text("日记");
   					return;
   				}
   				if (curr_href.indexOf("/about") == 0) {
   					title.text("关于我");
   					return;
   				}
   				if (curr_href.indexOf("/message") == 0) {
   					title.text("留言");
   					return;
   				}
    			
    		}
    	}
    	setTitle();

    	
    	
    	
        $('.m_menu').click(function(){
            $(".m_menu").toggleClass("m_menu_on");
            if($(".m_menu_box").is(":hidden")){
                $('.m_menu_box').show();
            }else{
                $('.m_menu_box').hide();
            }
        });
        $(".m_menu_list>.m_menu_section>a").bind("click",function(e){
			
            var el = $(this).parent();
            var menu = el.parent();
            var sections = $(".m_menu_section",menu);

            if(! el.is(".selected")) {
                for(var i=0;i<sections.size();i++) {
                    var section = sections.eq(i);
                    if(section.is(el)) {
                        section.addClass("selected");
                    }
                    else {
                        section.removeClass("selected");
                    }
                }
            }

        });
        
		$.ajax({
			url : '/group/list',
			type : 'POST',
			data : {
				json : 'json'
			},
			dataType : 'json',
			success : function(res) {
				if (res.error) {
					return;
				} else {
					var groups = res.groups;
					if(groups != null && groups.length > 0){
						for(var i=1;i<=groups.length;i++ ){
							var group=groups[i-1];
						/* 	alert(group); */
							
							$("#u1").append('<li><a href="/article/'+group.groupId+'">'+group.name+'('+group.count+')</a></li>');
							
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
</script>