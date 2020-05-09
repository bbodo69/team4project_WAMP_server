<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyPage</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<c:if test="${sessionScope.sId != 'admin'}">
	<script>
		alert("관리자만 접근할 수 있습니다.")
		window.location = "/team4/member/main.do";
	</script>
</c:if>
<c:if test="${sessionScope.sId == 'admin'}">
<body>
	<br />
	<h1 align="center"> 글 수정 </h1>
	<form action="/team4/adminCommitment/adminmodifyPro.do?num=${article.num}&pageNum=${pageNum}" method="post">
				
		<table>
			<tr> 
				<td>글 번호</td>
				<td>${article.num}</td>
			</tr>
		
			<tr>
				<td> 이름 </td>
				<td align="left"> 
					<input type="text" name="name" value="${article.name}" /> 
				</td>
			</tr>
			<tr>
				<td> 정   당 </td>
				 
				<td>더불어민주당<input type="radio" name="party" value="더불어민주당" ></td>
				<td>미래통합당<input type="radio" name="party" value="미래통합당" ></td>
				<td>민생당<input type="radio" name="party" value="민생당" ></td>
				<td>미래한국당<input type="radio" name="party" value="미래한국당" ></td>
				<td>더불어시민당<input type="radio" name="party" value="더불어시민당" ></td>
				<td>정의당<input type="radio" name="party" value="정의당" ></td>
				<td>우리공화당<input type="radio" name="party" value="우리공화당" ></td>
				<td>민중당<input type="radio" name="party" value="민중당" ></td>
				<td>한국경제당<input type="radio" name="party" value="한국경제당" ></td>
				<td>국민의당<input type="radio" name="party" value="국민의당" ></td>
			</tr>
			<tr>
				<td> 지 역 구 </td>
				<td align="left"> 
					<input type="text" name="local" value="${article.local}"/> 
				</td>
			</tr>
			<tr>
				<td> 내   용 </td>
				<td> <textarea rows="20" cols="70" name="content">${article.content}</textarea> </td>
			</tr>
			<tr>
				<td> 원본링크(선거공보) </td>
				<td align="left"> <input type="file" name="url" /> </td>
			</tr>
			<tr>
				<td> 사  진 </td>
				<td align="left"> <input type="file" name="photo" /> </td>
			</tr>
			
			
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="저장" />
					<input type="reset" value="재작성" />
					<input type="button" value="리스트보기" onclick="window.location='/team4/adminCommitment/list.do?pageNum=${pageNum}'" />
				</td>
			</tr>
		</table>
	</form>
	
</body>
</c:if>
</html>