<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<!-- 비 로그인 상태 -->
<c:if test="${sessionScope.sId == null}">

<body>
	
	<h1> 메인이다옹! </h1>	<br/>

	
	<input type="button" value="로그인" onclick="window.location.href='/team4/member/loginForm.do'">
	<input type="button" value="회원가입" onclick="window.location.href='/team4/member/signupForm.do'">
</body>
</c:if>
<!--로그인 상태 -->
<c:if test="${sessionScope.sId != null}">
<body>

	<h1> 메인이다옹! </h1>	<br/>

	<input type="button" value="로그아웃" onclick="window.location.href='/team4/member/logout.do'">
	<input type="button" value="정보수정" onclick="window.location.href='/team4/member/modifyForm.do'"> <br/>
	<input type="button" value="탈퇴하기" onclick="window.location.href='/team4/member/deleteForm.do'">
</body>
</c:if>
</html>