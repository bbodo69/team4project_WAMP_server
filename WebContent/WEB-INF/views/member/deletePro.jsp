<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 ok</title>
</head>
<body>
	<table>
		<tr>
			<td> <b>회원정보가 삭제되었습니다.</b><br /> </td>
		</tr>
		<c:redirect url="/member/main.do"/>
	</table>
</body>
</html>