<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link href="/team4/resources/designCSS.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	.centered {
	margin-left: 38%;
	}
</style>
<body>
<!-- /////////////// -->
	<nav class="navbar navbar-expand-sm" style="padding: 40px; border-bottom:2px solid #D8D8D8;background: #F2F2F2; color:black;"> 
		<a style="color:#1C1C1C;" class="navbar-brand" href="http://localhost:8080/team4/main/main.do">TEAM4</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar"> 
			<span class="navbar-toggler-icon"></span>
		</button> 
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<!-- 리스트 : 부트스트랩은 모바일 우선이라 화면이 작으면 아래로 쌓아서 내려온다 -->
		<!-- navbar navbar-default navbar-fixed-top  -->
			<ul class="navbar-nav navbar-dark centered"> 
				<li class="nav-item"><h4><a style="color:#1C1C1C;" href="http://localhost:8080/team4/debate/debateBoardMain.do" class="nav-link">토론</a></h4></li>
				<li><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4></li>
	        	<li class="nav-item"><h4><a style="color:#1C1C1C;" href="http://localhost:8080/team4/issue/issueBoard.do" class="nav-link">이슈</a></h4></li>
	        	<li><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4></li>
	        	<li class="nav-item"><h4><a style="color:#1C1C1C;" href="http://localhost:8080/team4/adminCommitment/list.do" class="nav-link">공약</a></h4></li>
	        	<li><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4></li>
	        	<li class="nav-item"><h4><a style="color:#1C1C1C;" href="http://localhost:8080/team4/main/main.do" class="nav-link">메인</a></h4></li>
	        	<li><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4></li>
			</ul>
			
			 
			<form action="/team4/member/loginPro.do" method="post">
		<!-- 로그인 처리 -->
				<c:if test="${empty sessionScope.sId}">
					<ul class="navbar-nav navbar-dark navbar-right"> 
						<li class="nav-item"><h4><input type="text" name="id"></h4></li>
						<li class="nav-item"><h4><input type="password" name="pw"></h4></li>
						<li class="nav-item"><h4><input type="submit" value="로그인"></h4></li>
						<li class="nav-item"><h4><button type="button" onClick="location.href='http://localhost:8080/team4/member/signupForm.do'">회원가입</button></h4></li>
					</ul>						
				</c:if>
				<c:if test="${not empty sessionScope.sId}">
					<ul class="navbar-nav navbar-dark navbar-right">
						<li class="nav-item"><h4><p class="nav-link" class="nav-link">${sessionScope.sId} 로 로그인 완료</p></h4></li>
						<li class="nav-item"><h4><a style="color:#1C1C1C;" href="http://localhost:8080/team4/main/logout.do" class="nav-link">로그아웃</a></h4></li>
						<li class="nav-item"><h4><a style="color:#1C1C1C;" href='http://localhost:8080/team4/member/modifyForm.do' class="nav-link">정보수정</a></h4></li>
						<li class="nav-item"><h4><a style="color:#1C1C1C;" href='http://localhost:8080/team4/member/deleteForm.do' class="nav-link">회원탈퇴</a></h4></li>
					</ul>
				</c:if>		
			</form>
			
		</div> 
	</nav>
<!-- /////////////// -->
</body>
</html>