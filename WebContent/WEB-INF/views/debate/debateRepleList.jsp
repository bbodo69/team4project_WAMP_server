<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/bootstrap.css">
<title>Insert title here</title>
</head>
<script>
	
</script>
<body style="background: #F2F2F2;">
	
	num ${num } 값이 나오나 보자
	<%=request.getParameter("num")%> <!-- num 값 받아오기 -->
	
	<h3>관리가 됬나 ?</h3>
	<input type="button" onclick="test()" value="test">
	<div class="replyList">
		<table class="table">
					
		</table>
	</div>
	
	<!-- num 값으로 JSON 형태 데이터 받아오기 -->
	

<script>

</script>



</body>
</html>
