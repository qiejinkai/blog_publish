<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
	<div id="logo">
		<a href="/"></a>
	</div>
	<nav class="topnav" id="topnav">
		<a name="home" href="/"><span>首页</span><span class="en">Protal</span></a>
		<a href="/about"><span>关于我</span><span class="en">About</span></a> 
		<a href="/article"><span>文章</span><span class="en">Learn</span></a>
		<a href="/diary"><span>日记</span><span class="en">Life</span></a> 
		<a href="/mood"><span>说说</span><span class="en">Doing</span></a> 
		<a href="#"><span>专题</span><span class="en">Share</span></a>
		<a href="#"><span>留言版</span>
		<span class="en">Gustbook</span></a>
	</nav>
	<script type="text/javascript">
		$(function() {

			var curr_href = window.location.pathname;

			var as = $(".topnav>a");

			for (var i = 1; i < as.length; i++) {
				$(as[i]).attr("id", "");
			}

			if (curr_href == "" || curr_href == "/") {

				$("a[name=home]").attr("id", "topnav_current");

			} else {

				for (var i = 1; i < as.length; i++) {
					var a = $(as[i]);
					var href = a.attr("href");

					if (curr_href.indexOf(href) == 0) {
						a.attr("id", "topnav_current");
						return;
					}
				}
			}

		});
	</script>
</header>