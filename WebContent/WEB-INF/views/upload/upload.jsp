<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h3>uplaod page</h3>
<form action="uploadPro.do" method="post">
	<input type="file" id="uploadFile" name="uploadFile" enctype="multipart/form-data">
	<input type="submit" value="전송">
</form>
</body>
</html>