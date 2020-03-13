<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>发布新投票</title>
<link href="css/vote.css" rel="stylesheet" />
<link href="css/mine.bae6cbc7.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/add_and_del.js"></script>
</head>
<body>
	<header class="site-header">
		<div class="inner">
			<div class="user">
				<c:choose>
					<c:when test="${sessionScope.name==null}">
						<a class="user-exit" href="login.jsp">登录</a>
						<a class="user-exit" href="register.jsp"> | 注册</a>
					</c:when>
					<c:when test="${sessionScope.name=='admin'}">
						<a href="manage.jsp">
							<span class="user-name">管理员</span>
						</a>
						<a class="user-exit" href="LogOutServlet"> | 退出</a>
					</c:when>
					<c:otherwise>
						<span class="user-name">${sessionScope.name}</span>
						<a class="user-exit" href="LogOutServlet"> | 退出</a>
					</c:otherwise>
				</c:choose>
			</div>
			<nav class="nav">
				<c:choose>
					<c:when test="${sessionScope.name==null}">
						<script type="text/javascript">
							window.location.href = 'login.jsp';//直接跳转
						</script>
					</c:when>
					<c:otherwise>
						<a href="publishNewVote.jsp" class="nav-item null">发布新投票</a>
						<a href="SearchVotesServlet?jsp=voteList" class="nav-item null">投票</a>
						<a href="SearchVotesServlet?jsp=voteMaintenanceList" class="nav-item null">投票维护</a>
						<a href="SearchVotesServlet?jsp=voteQuery" class="nav-item null">投票查询</a>
					</c:otherwise>
				</c:choose>
			</nav>
		</div>
	</header>
	<br>
	<form action="PublishNewVoteServlet" method="post">
		<div class="vote">
			<div class="vote-subject">
				投票名称&nbsp;
				<input class="vs-title" id="vs-title" name="vs_title" />
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font color='red' size="4px">${vsTitleError}</font>
				<br />
				投票类型&nbsp;
				<input type="radio" name="vs_type" id="1" value="1" checked />
				单选题
				<input type="radio" name="vs_type" value="2" id="2" />
				多选题
			</div>
			<br />
			<div class="vote-option" id="vote-option">
				投票选项 &nbsp;
				<font color='red' size="4px">${voOptionError}</font>
				<br>
				<br>
				<ul>
					<li>
						<input type="text" name="vo_option">
					</li>
					<br>
					<li>
						<input type="text" name="vo_option">
					</li>
				</ul>
			</div>
			<br />
			<input type="button" value="✚  添加选项" id="add" class="ui-button ui-button-primary" />
			&nbsp;&nbsp;&nbsp;
			<a href="SearchVotesServlet?jsp=voteList">
				<button type="submit" class="ui-button ui-button-primary">✔ 创建投票</button>
			</a>
			<font color='red'>${error}</font>
		</div>
	</form>
</body>
</html>
