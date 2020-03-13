<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>投票列表</title>
<link href="css/vote.css" rel="stylesheet" />
<link href="css/mine.bae6cbc7.css" rel="stylesheet">
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
	<div class="voteList">
		<table cellspacing="30">
			<caption>投票列表</caption>
			<tr>
				<td>投票名称</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${sessionScope.allVotesList }" var="votes" begin="0">
				<tr>
					<td>${votes.vsTitle }</td>
					<td>
						<a href="SearchVotesServlet?jsp=vote&vsId=${votes.vsId }">
							<button type="submit" class="ui-button ui-button-primary">我要参与</button>
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
