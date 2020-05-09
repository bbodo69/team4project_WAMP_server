<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글 수정</title>
</head>
<body>
	<br />
	<h1 align="center">이슈 게시판 글수정(관리자 전용)</h1>
	<form action="/team4/adminIssue/issueBoardMainModifyPro.do?pageNum=${pageNum}" method="post">
		<%-- 숨겨서 글 속성에 관련된 데이터 전송 --%>
		<input type="hidden" name="num" value="${num}" />
		<table>
			<tr>
				<td>기사링크</td>
				<td align="left"> 
					<input type="text" name="link" value="${issue.link}" /> 
				</td>
			</tr>
			<tr>
				<td>기사 헤드라인(기사제목)</td>
				<td align="left">
					<input type="text" name="content" value="${issue.content}"/> 
				</td>
			</tr>
			<tr>
				<td>언론사</td>
				<td align="left"> 
					<input type="text" name="pre" value="${issue.pre}"/> 
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="저장" />
					<input type="reset" value="재작성" />
					<input type="button" value="리스트보기" onclick="window.location='/team4/issue/issueBoard.do?pageNum=${pageNum}'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>