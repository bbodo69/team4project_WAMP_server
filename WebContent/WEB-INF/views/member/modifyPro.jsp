<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 ok</title>
</head>
	<body>
	<table>
		<tr>
			<td> <b>회원정보가 수정되었습니다.</b><br /> </td>
		</tr>
		<c:redirect url="/member/main.do"/>
	</table>
	</body>
	
	<c:if test="${sessionScope.sId == null}">
		<script>
			alert("로그인 후 이용해주세요.")
			window.location="/team4/member/loginForm.do";
		</script>
	</c:if>
	
</html>