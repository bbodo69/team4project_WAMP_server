<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용</title>
</head>
<!-- ===============================for bootstrap=============================== -->
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 	    
<!-- ===============================for chart=============================== -->    
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<!-- ========================================================================= -->
	<link href="/team4/resources/designCSS.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	
	<input type="hidden" name="num" value=${article.num}>
			
	</script>
<body>
<div id="container-fluid" style="padding: 50px">
<!-- =========================header=============================== -->
		<div class="col-md-12">
			<jsp:include page="../share/headerPooter.jsp" flush="true" />
	    </div>
		<div class="col-md-12" id="container-fluid" style="padding: 50px">
	</div>
</div>
</body>
<body>
	<table>
		
			<tr>
				<td><h1 align="center"> content </h1></td>
			</tr>
		
			<tr>	
				<td>${article.photo}</td>
			</tr>
						
			<tr>
				<td>성명</td>
				<td><b> ${article.name}</b></td>
			</tr>
			<tr>
				<td>정당명</td>
				<td><b> ${article.party}</b></td>
			</tr>
			<tr>
				<td>지역구</td>
				<td>${article.local}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="70" readonly>${article.content}</textarea></td>
			</tr>
			<tr>
				<td>선거공보</td>
				<td><button class="btn" onclick="window.location='/team4/adminCommitment/download.do?num=${article.num}'"><b>다운로드</b></button></td>
			</tr>			
			
			<tr>
			<td><button onclick="window.location='/team4/adminCommitment/list.do?pageNum=${pageNum}'" >리스트</button></td> 
			</tr>
			
			<c:if test="${sessionScope.sId == 'admin'}">
				<tr>
					<td colspan="2">
						<button onclick="window.location='/team4/adminCommitment/adminmodifyForm.do?num=${article.num}&pageNum=${pageNum}'">수   정</button>
						<button onclick="window.location='/team4/adminCommitment/deletePro.do?num=${article.num}&pageNum=${pageNum}'">삭   제</button>
					</td>
			</tr>
			</c:if>
	</table>
</div>
</body>
</html>