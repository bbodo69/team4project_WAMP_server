<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인pro</title>
</head>
	<!-- 로그인 상태 -->
	<c:if test="${sessionScope.sId != null}">
	<script>
		alert("회원님께선 이미 로그인된 상태이십니다.")
		window.location = "/team4/member/main.do";
	</script>
	</c:if>
	<!-- 비로그인 상태 -->
	
		<c:if test="${check != null}">
			<script>
			alert("아이디 패스워드가 틀렸습니다.");
			history.go(-1);
			</script>
		</c:if>
		<c:if test="${check == 1}">
			<c:redirect url="/main/main.do"/>
		</c:if>
	<body>	
</body>
</html>