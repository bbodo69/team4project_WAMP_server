<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link href="/team4/resources/designCSS.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 로그인  -->

<div id="container-fluid" style="padding-left: 50px; padding-right: 50px">
	<form action="login.do" method="post">
	<!-- 로그인 처리 -->
		<c:if test="${empty sessionScope.sId}">
			<input type="text" name="id">
			<input type="password" name="pw">
			<input type="submit" value="로그인">
		</c:if>
		<c:if test="${not empty sessionScope.sId}">
			${sessionScope.sId} 로 로그인 완료
		</c:if>	
	<!-- 로그아웃 처리 -->
		<c:if test="${not empty sessionScope.sId}">
		<a href="http://localhost:8080/team4/main/logout.do">로그아웃</a>
		</c:if>		
	</form>
</div>
<!-- 로그인  -->
<!-- 헤더  -->
<div class="container-fluid" id="container" style="height: 100px">
	<div class="row">
        <div class="col-md-12" id="header">       
        	<nav class="navbar navbar-expand-md bg-dark">
        		<div class="container-fluid">
        			<div class="navbar-header">
		        		<a class="navbar-brand" href="#">TEAM4</a>
		        		
		        		<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#myNavbar">
		        			<span class="navbar-toggler-icon"></span>
		  			        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span> 
		        		</button>
		        	</div>
		        		
	        		<div class="collapse navbar-collapse" id="myNavbar">
	        			<ul class="nav nav-pills nav-justified">
				        	<li class="nav-item"><h4><a href="http://localhost:8080/team4/debate/debateBoardMain.do" class="nav-link">토론 게시판</a></h4></li>
				        	<li class="nav-item"><h4><a href="#" class="nav-link">이슈 게시판</a></h4></li>
				        	<li class="nav-item"><h4><a href="#" class="nav-link">공약 게시판</a></h4></li>	     
				        	<li class="nav-item"><h4><a href="http://localhost:8080/team4/main/main.do" class="nav-link">로그인 페이지</a></h4></li>  
				        </ul>
				        
				       
				        
	        		</div>
	        	</div>
        	</nav>
        	
        </div>
	</div>
</div>

<!-- /////////////// -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark"> 
	<a class="navbar-brand" href="#">TEAM4</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar"> 
		<span class="navbar-toggler-icon"></span>
	</button> 
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
	<!-- 리스트 : 부트스트랩은 모바일 우선이라 화면이 작으면 아래로 쌓아서 내려온다 -->
		<ul class="navbar-nav navbar-dark"> 
			<li class="nav-item"><h4><a href="http://localhost:8080/team4/debate/debateBoardMain.do" class="nav-link">토론 게시판</a></h4></li>
        	<li class="nav-item"><h4><a href="#" class="nav-link">이슈 게시판</a></h4></li>
        	<li class="nav-item"><h4><a href="#" class="nav-link">공약 게시판</a></h4></li>	     
        	<li class="nav-item"><h4><a href="http://localhost:8080/team4/main/main.do" class="nav-link">로그인 페이지</a></h4></li>  
		</ul>
		<div class="nav navbar-nav navbar-right">
		
	    	<form action="login.do" method="post">
			<!-- 로그인 처리 -->
				<c:if test="${empty sessionScope.sId}">
					<input type="text" name="id">
					<input type="password" name="pw">
					<input type="submit" value="로그인">
				</c:if>
				<c:if test="${not empty sessionScope.sId}">
					${sessionScope.sId} 로 로그인 완료
				</c:if>	
			<!-- 로그아웃 처리 -->
				<c:if test="${not empty sessionScope.sId}">
				<a href="http://localhost:8080/team4/main/logout.do">로그아웃</a>
				</c:if>		
			</form>
	        
		</div>
		 
	</div> 
</nav>
<!-- /////////////// -->
<!-- /////////////// -->

<!-- /////////////// -->
<!-- /////////////// -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar2">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">제타위키</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar2">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">홈</a></li>
        <li><a href="#">메뉴1</a></li>
        <li><a href="#">메뉴2</a></li> 
        <li><a href="#">메뉴3</a></li> 
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">회원가입</a></li>
        <li><a href="#">로그인</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- /////////////// -->





<!-- 헤더  -->

	        <!-- header -->
</body>
</html>