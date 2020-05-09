<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin 로그인</title>
</head>
<c:if test="${sessionScope.admin != null}">
	<script>
		alert("관리자께선 이미 로그인된 상태이십니다.")
		window.location = "/team4/member/main.do";
	</script>
</c:if>
<c:if test="${sessionScope.admin == null}">
<body>
	<form action="/team4/member/adminLoginPro.do" method="post">

	아이디<input type="text" name="id"> <br/>
	비밀번호<input type="password" name="pw"> <br/>
	<input type="button" value="메인으로" onclick="window.location.href='/team4/member/main.do'"> 
	

	<input type="submit" value="로그인">
	</form>
</body>
</c:if>
</html>