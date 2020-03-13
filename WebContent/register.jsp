<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<title>用户注册</title>
<link rel="stylesheet" href="css/materialize.min.css">
<style type="text/css">
html, body {
	height: 100%;
}

html {
	display: table;
	margin: auto;
}

body {
	display: table-cell;
	vertical-align: middle;
	color: #404d5b;
}

.margin {
	margin: 0 !important;
}

.card-panel {
	min-width: 350px;
}
</style>
</head>
<body class="blue">
	<div id="login-page" class="row">
		<div class="col s12 z-depth-6 card-panel">
			<form class="login-form" action="RegisterServlet" method="post">
				<div class="row">
					<div class="input-field col s12 center">
						<img src="http://w3lessons.info/logo.png" alt="" class="responsive-img valign profile-image-login">
						<p class="center login-form-text">用户注册</p>
						<font color='red'>${error }</font>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<input id="userName" type="text" class="validate" name="userName">
						<label for="userName" class="center-align">用户名</label>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<input id="userPassword" type="password" class="validate" name="userPassword">
						<label for="userPassword">密码</label>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<input id="confirmPassword" type="password" name="confirmPassword">
						<label for="confirmPassword">确认密码</label>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<input id="sex" type="text" class="validate" name="sex">
						<label for="sex" class="center-align">性别</label>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<input id="age" type="text" class="validate" name="age">
						<label for="age" class="center-align">年龄</label>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<input id="address" type="text" class="validate" name="address">
						<label for="address" class="center-align">住址</label>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<input id="profession" type="text" class="validate" name="profession">
						<label for="profession" class="center-align">职业</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<button type="submit" class="btn waves-effect waves-light col s12">立即注册</button>
					</div>
					<div class="input-field col s12">
						<p class="margin center medium-small sign-up">
							已有账号？
							<a href="login.jsp">立即登录</a>
						</p>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script src="js/materialize.min.js"></script>
</body>
</html>