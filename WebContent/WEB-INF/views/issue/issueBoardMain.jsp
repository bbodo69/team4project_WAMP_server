<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- ===============================for bootstrap=============================== -->
   <meta charset="UTF-8">
   <title>이슈 게시판 메인</title>
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
</head>

<body style="background: #F2F2F2;">
	<jsp:include page="../share/headerPooter.jsp" flush="true" />
	<div id="container-fluid" style="padding: 50px">
		<br />
			<div class="row text-center">
				<div class="col-md-12" id="debateSub"><h1>${issue.content}</h1><br /><br />
				</div>
			</div>
			<blockquote class='blockquote-reverse'>
			언론사 : ${issue.pre}
			원본 기사 링크 : ${issue.link}
			조회수 : ${issue.readcount}
			</blockquote>
				<c:if test = "${sessionScope.sId eq admin}">
				<button onclick="window.location='/team4/issue/issueBoardMainModifyForm.do?num=${num}&pageNum=${pageNum}'">수   정</button>
				<button onclick="window.location='/team4/issue/issueBoardMainDeleteForm.do?num=${num}&pageNum=${pageNum}'">삭   제</button>
				</c:if>
				<%-- 댓글버튼처리 : num 등등 DB에서 받은정보 보내주면서 이동 --%>
				<jsp:include page = "issueBoardMainReple.jsp" flush="true">
					<jsp:param name="num" value="${num}"/>
				</jsp:include>
				<blockquote class='blockquote-reverse'>
					<button class="btn btn-primary" onclick="window.location='/team4/issue/issueBoard.do?pageNum=${pageNum}'">리스트</button>
				</blockquote>
	</div>
				
				
			
			
</body>
</html>