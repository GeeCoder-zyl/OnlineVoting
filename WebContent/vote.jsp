<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>投票</title>
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
	<div class="vote">
		<form action="VoteResultServlet" method="post">
			<table cellspacing="30">
				<tr>
					<td>${vs.vsTitle }</td>
				</tr>

				<c:if test="${error !=null}">
					<tr>
						<td>
							<font color='orange'>${error }</font>
							<br>
							<br>
							<i id=show></i>
							<a href="voteList.jsp">投票列表</a>
						</td>
					</tr>
				</c:if>
				<c:if test="${error ==null}">
					<c:if test="${vs.vsType==1 }">
						<c:forEach items="${voOptionList }" var="voOption" begin="0">
							<tr>
								<td>
									<input type="radio" name="voOption" value="${voOption }">
									${voOption }
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${vs.vsType==2 }">
						<c:forEach items="${voOptionList }" var="voOption" begin="0">
							<tr>
								<td>
									<input type="checkbox" name="voOption" value="${voOption }">
									${voOption}
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</c:if>
			</table>
			<c:if test="${error ==null}">
				<button type="submit" class="ui-button ui-button-primary">提交投票</button>
			</c:if>
		</form>
	</div>
	<script>
		var t = 3;// 设定跳转的时间
		setInterval("refer()", 1000); // 启动1秒定时
		function refer() {
			if (t == 0) {
				location = "voteList.jsp"; // 跳转的地址
			}
			document.getElementById('show').innerHTML = "" + t + "秒后自动跳转到"; // 显示倒计时
			t--; // 计数器递减
		}
	</script>
</body>
</html>
