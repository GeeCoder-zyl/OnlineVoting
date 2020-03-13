<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
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

<body class="green">
	<div id="login-page" class="row">
		<div class="col s12 z-depth-6 card-panel">
			<form class="login-form" action="LoginServlet" method="post">
				<div class="row">
					<div class="input-field col s12 center">
						<img src="http://w3lessons.info/logo.png" alt="" class="responsive-img valign profile-image-login">
						<p class="center login-form-text">用户登录</p>
						<font color="red">${error }</font>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<input id="username" type="text" class="validate" name="username" value="${cookie.username.value }">
						<label for="username" class="center-align">用户名</label>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<input id="password" type="password" class="validate" name="userpass" value="${cookie.password.value }">
						<label for="password">密码</label>
					</div>
				</div>
				<!-- 				<div class="row">
					<div align="center" class="input-field col s12 m12 l12  login-text">
						<input type="checkbox" id="remember-me" /> <label
							for="remember-me">记住我</label>
					</div>
				</div> -->
				<div class="row">
					<div class="input-field col s12">
						<button type="submit" class="btn waves-effect waves-light col s12">登录</button>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<p class="margin center medium-small sign-up">
							没有账号？
							<a href="register.jsp">现在注册</a>
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