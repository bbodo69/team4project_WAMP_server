<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글 삭제</title>
</head>
<body>
	<br />
	<h1 align="center">이슈 게시판 글 삭제</h1>
	<form action="/team4/adminIssue/issueBoardMainDeletePro.do?pageNum=${pageNum}" method="post">
		<%-- 글 고유 번호 숨겨서 넘기기 --%>
		<input type="hidden" name="num" value="${num}" />
		<table>
			<tr>
				<td>정말 삭제하시겠습니까?</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="삭제" />
					<input type="button" value="취소" onclick="window.location='/team4/issue/issueBoard.do?pageNum=${pageNum}'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>