<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정페이지</title>
</head>
<c:if test="${sessionScope.sId == null}">
	<c:redirect url="/member/main.do"/>
</c:if>

<c:if test="${sessionScope.sId != null}">
<body>
	<br />
	<h1>회원정보 수정</h1>
	<form action="/team4/member/modifyPro.do" method="post">
	<table>
	<tr>
		<td>아이디</td>
		<td>${dto.id}</td>
		<!-- 아이디값을 여기로 받아와야한다.이걸 안써줘서 그동안 오류가 났다. -->
		<td><input type="hidden" name="id" value="${dto.id}"/></td>
	</tr>

	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pw" value="${dto.pw}"/></td>
	</tr>
	
	<tr>
		<td>이름</td>
		<td>${dto.name}</td>
	</tr>
	
	<tr>
		<td>성별</td>
		<td>${dto.gender}</td>
	</tr>
	
	<tr>
		<td>나이</td>
		<td>${dto.age}</td>
	</tr>
	
	<tr>
		<td>본인확인질문</td>
		<td><select name="qa1">
		<option selected="selected">부모님의 성함은?</option>	
		<option>가장 존경하는 인물은?</option>
		<option>출신 학교는?</option>
		</select></td>
		<td>질문의 답</td>
		<c:if test="${dto.qa2 != null}">
		<td><input type="text" name="qa2" value="${dto.qa2}"></td> 
		</c:if>
		<c:if test="${dto.qa2 == null}">
			<script>
				alert("질문에 대한 답을 써주세요.")
				qa2.focus();
			</script>
		</c:if>
	</tr>
	
	<tr>
		<td style="word-break:break-all">당신의 정치 성향은 어느쪽이라고 생각하십니까?</td>
		
		<td>진보<input type="radio" name="td" value="진보" required="required"></td>
		<td>중도<input type="radio" name="td" value="중도" required="required"></td>
		<td>보수<input type="radio" name="td" value="보수" required="required"></td>
		
	</tr>
	
	<tr>
		<td>email을 입력해주세요.</td>
		<c:if test="${dto.email == null}">
		<td><input type="text" name="email"></td>
		</c:if>
		
		<c:if test="${dto.email != null }">
		<td><input type="text" name="email" value="${dto.email}"></td>
		</c:if>
	</tr>
	
	<tr>
	<td colspan="2" align="center">
		<input type="submit" value="수정">
		<input type="reset" value="재작성">
		<input type="button" value="취소" onclick="window.location.href='/team4/member/main.do'">
	</td>
	</tr>
	
	</table>
</form>
</body>
</c:if>
</html>