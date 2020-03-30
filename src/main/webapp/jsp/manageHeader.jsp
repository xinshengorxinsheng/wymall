<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>网易内容销售</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>
	</head>

	<body>
	<!--
            描述：导航条
        -->
	<div class="container-fluid">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/manageHome.jsp">首页</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<c:if test="${empty currentUser}">
							<li class="active"><a href="${pageContext.request.contextPath}/jsp/login.jsp">用户登录<span class="sr-only">(current)</span></a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/jsp/manageLogin.jsp">管理员登录<span class="sr-only">(current)</span></a></li>
						</c:if>
						<c:if test="${not empty currentUser && currentUser.role==1}">
							<li class="active"><a href="#">${currentUser.username}<span class="sr-only">(current)</span></a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/manage/user/logout.do">退出登录<span class="sr-only">(current)</span></a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/manage/product/add.do">发布<span class="sr-only">(current)</span></a></li>
						</c:if>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>
	</body>
</html>