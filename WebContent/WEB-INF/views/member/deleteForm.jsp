<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 페이지</title>
</head>
<script>
	function checkPw(){
	var pwInputs = document.inputForm;
	if(!pwInputs.pw.value){
		alert("비밀번호를 입력해주세요")	
		pwInputs.pw.focus();
		return false;
		}
	}
</script>

<c:if test="${sessionScope.sId != null}">
<body>
<form action="/team4/member/deletePro.do" method="post" onsubmit="chekckPw()" name="inputForm">
<table>
	<tr>
		<td> 탈퇴 </td>
		<td> 아이디 </td>
		<td> ${dto.id} </td>
		<td><input type="hidden" name="id" value="${dto.id}"></td>
		
		<td>비밀번호</td>
		<td><input type="password" name="pw"></td>
		
	</tr>
</table>
		<br/>
		<input type="submit" value="탈퇴하기">
		<input type="button" value="취소 " onclick="window.location.href='/team4/member/main.do'">
		<br/>
</form>
</body>
</c:if>

<c:if test="${sessionScope.sId == null}">
	<script>
		alert("로그인 후 이용해주세요")
		window.location="/team4/member/main.do";
	</script>
</c:if>

</html>