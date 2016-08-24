<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="qjk" uri="/qjk/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<%@include file="../css.html"%>
<%@include file="../script.html"%>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>

	<div class="ef-main">
		<jsp:include page="../toolbar.jsp"></jsp:include>
		<div class="ef-block">

			<h1>
				<a href="/admin/user/qqusers/">QQ用户查询</a> <span
					class="icon-angle-right"></span>
					查看QQ用户详情
			</h1>
			<p class="txt">查看QQ用户详情</p>

			<div class="content">

				<div class="container">
					<table class="ui-table" width="">
						<thead>
							<tr>
								<td colspan="2"><a href="/admin/user/users/${user.user.uid }/detail">用户基本信息</a></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="80px">用户ID</td>
								<td>${user.user.uid }</td>
							</tr>
							<tr>
								<td>头像</td>
								<td><img width="80px"  src="${user.user.logo }"/>

								</td>
							</tr>
							<tr>
								<td>昵称</td>
								<td>${user.user.nick }</td>
							</tr>
							<tr>
								<td>手机号</td>
								<td>${empty user.user.phone?'-':user.user.phone }</td>
							</tr>
							<tr>
								<td>邮箱</td>
								<td>${empty user.user.email?'-':user.user.email }</td>
							</tr>
<!-- 							<tr>
								<td>性别</td>
								<td>{#parent.data.account.attributes.@name:sex.value,type=switch,prefix=v_,v_M=男,v_F=女#}</td>
							</tr> -->
							<tr>
								<td>注册时间</td>
								<td><qjk:fmt type="dateformat" format="yyyy-MM-dd HH:mm:ss"
												src="${user.user.ctime}" /></td>
							</tr>
						</tbody>
						<thead>
							<tr>
								<td colspan="2">用户信息</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>最近登录</td>
								<td><qjk:fmt type="dateformat" format="yyyy-MM-dd HH:mm:ss"
												src="${user.user.loginTime}" /></td>
							</tr>
							<tr>
								<td>上次登录</td>
								<td><qjk:fmt type="dateformat" format="yyyy-MM-dd HH:mm:ss"
												src="${user.user.lastLoginTime}" /></td>
							</tr>
							<tr>
								<td>最近登录ip</td>
								<td>${user.user.loginIp}</td>
							</tr>
							<tr>
								<td>上次登录ip</td>
								<td>${user.user.lastLoginIp}</td>
							</tr>
						</tbody>
						<thead>
							<tr>
								<td colspan="2">QQ用户信息</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>OpenId</td>
								<td>${user.openid }</td>
							</tr>
							<tr>
								<td>头像</td>
								<td><img width="80px"  src="${user.logo }"/>

								</td>
							</tr>
							<tr>
								<td>昵称</td>
								<td>${user.nick }</td>
							</tr>
							<tr>
								<td>最近登录</td>
								<td><qjk:fmt type="dateformat" format="yyyy-MM-dd HH:mm:ss"
												src="${user.loginTime}" /></td>
							</tr>
							<tr>
								<td>上次登录</td>
								<td><qjk:fmt type="dateformat" format="yyyy-MM-dd HH:mm:ss"
												src="${user.lastLoginTime}" /></td>
							</tr>
							<tr>
								<td>最近登录ip</td>
								<td>${user.loginIp}</td>
							</tr>
							<tr>
								<td>上次登录ip</td>
								<td>${user.lastLoginIp}</td>
							</tr>
						</tbody>

					</table>

				</div>
			</div>

		</div>
	</div>
</body>
</html>