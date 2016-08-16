<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台登陆</title>
<%@include file="../css.html"%>
<%@include file="../script.html"%>
</head>
<body>

	<div class="ui-dialog" style="display: block;">

		<div class="window" style="width: 422px; margin-top: 200px;">
			<div class="head">
				<img src="/img/logo.png" class="logo" style="margin-left: 14px;" />
				<h1 style="padding-left: 6px;">博客管理后台</h1>
			</div>


			<form action="" method="post" id="loginForm">
				<input type="hidden" name="action" value="Login" />

				<div class="ui-flash ui-red" style="display:${empty error?'none':'' }">
					<p id="error">${error }</p>
				</div>

				<div class="ef-login">

					<table class="ui-form" style="text-align: left; width: 320px;">
						<tbody>
							<tr>
								<th>帐户</th>
							</tr>
							<tr>
								<td><input type="text" class="ui-input rp" name="account"
									value="${account }" required style="width: 100%;" /></td>
							</tr>
							<tr>
								<th>密码</th>
							</tr>
							<tr>
								<td><input type="password" class="ui-input rp"
									name="password" value="${password }" required
									style="width: 100%;" /></td>
							</tr>
							<tr>
								<th>验证码</th>
							</tr>
							<tr>
								<td><input type="text" class="ui-input rp" name="code"
									value="" required style="width: 190px; display: inline-block;" />
									<img height="36px" width="120px" src="
									style="
									display: inline-block; vertical-align: middle;" /></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td><input type="submit" value="登录" class="ui-btn"
									style="width: 100%; margin-top: 27px;" /></td>
							</tr>
						</tfoot>
					</table>

				</div>
			</form>

		</div>

		<p class="ef-footer">
			<a href="/">@qiejinkai.com</a>
		<p>
	</div>
	<script type="text/javascript">
		$(function() {

			var imgUrl = "/image/verifycode";
			function changeImg(img) {
				//alert(img);
				img.attr("src", chgUrl(imgUrl));
			}

			//加入时间戳，去缓存机制   
			function chgUrl(url) {
				var timestamp = (new Date()).valueOf();
				if ((url.indexOf("&") >= 0)) {
					url = url + "&r=" + timestamp;
				} else {
					url = url + "?r=" + timestamp;
				}
				return url;
			}

			var form = $("#loginForm");
			$("img", form).bind('click', function() {
				changeImg($(this));
			}).attr("src", imgUrl);

			form.bind('submit', function() {
				var account = $("input[name=account]", form).val();
				if (account == null || account.length == 0) {
					showMsg("请输入账号");
					return false;
				}
				var password = $("input[name=password]", form).val();
				if (password == null || password.length == 0) {
					showMsg("请输入密码");
					return false;
				}
				var code = $("input[name=code]", form).val();
				if (code == null || code.length == 0) {
					showMsg("请输入验证码");
					return false;
				}

				return true;
			});

			function showMsg(msg) {
				if (msg != null && msg.length > 0) {
					$("#error").text(msg).css("display", "");
				} else {
					$("#error").text("").css("display", "none");
				}
			}

		});
	</script>
</body>
</html>