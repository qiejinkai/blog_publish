<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery.mini.js"></script>
</head>
<body>
	<button type="button" id="weixin">点我</button>
	<script type="text/javascript">
		$(function(){
			$("#weixin").bind('click',function(){
				var uri = window.location.pathname;
				var A=window.open("/wxuser/login/?r="+uri,"WEIXINLogin", 
						   "width=450,height=320,menubar=0,scrollbars=1,resizable=1,status=1,titlebar=0,toolbar=0,location=1");
			});
		});
	</script>
</body>
</html>