<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 작성</title>
</head>
<body>
	<br />
	<h1 align="center">이슈 게시판 글 작성</h1>
	<form action="/team4/adminIssue/issueBoardwritePro.do" method="post">
		<%-- 숨겨서 글 속성에 관련된 데이터 전송 --%>
		<input type="hidden" name="num" value="${num}"/>
		<table>
			<tr>
				<td>기사링크</td>
				<td align="left"><input type="text" name="link" /> </td>
			</tr>
			<tr>
				<td>기사 헤드라인(기사제목)</td>
				<td align="left"><input type="text" name="content" /></td>
			</tr>
			<tr>
				<td>언론사</td>
				<td align="left"><input type="text" name="pre" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="저장" />
					<input type="reset" value="재작성" />
					<input type="button" value="리스트보기" onclick="window.location='/team4/issue/issueBoard.do'" />
				</td>
			</tr>
		</table>
	</form>	
</body>
</html>