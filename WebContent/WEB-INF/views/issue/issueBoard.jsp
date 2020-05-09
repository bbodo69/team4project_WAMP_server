<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>이슈 게시판</title>
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
    <style>
      .jb-xx-small { font-size: xx-small; }
      .jb-x-small { font-size: x-small; }
      .jb-small { font-size: small; }
      .jb-medium { font-size: medium; }
      .jb-large { font-size: large; }
      .jb-x-large { font-size: x-large; }
      .jb-xx-large { font-size: xx-large; }
    </style>
</head>
<body style="background: #F2F2F2;">
	<jsp:include page="../share/headerPooter.jsp" flush="true" />
	<div id="container-fluid" style="padding: 50px">		
		<div class="container-fluid">
			<div class="section" id="main"> 			 	
				<div class="row text-center">
					<div class="col-md-12" id="div_table_debate">
						<h1>공사중</h1>
					</div>
					
					<!-- 
					
					<div class="col-md-12" id="div_table_debate">
						<table id="debate_table" class="table" style="width: 100%">
							<colgroup>
								<col width="60%">
								<col width="20%">
								<col width="10%">
								<col width="10%">				
							</colgroup>
							<tbody>
								<tr>
									<th style="text-align:center;">헤드라인</th>
									<th style="text-align:center;">언론사</th>
									<th style="text-align:center;">조회수</th>
									<th style="text-align:center;">원본링크</th>
								</tr>
							</tbody>
							<c:forEach var = "issue" items = "${issueList}">
								<tr>
									<td style="color:#1C1C1C;"><h2>
									<a style="color:#1C1C1C;" href = "/team4/issue/issueBoardMain.do?num=${issue.num}&pageNum=${currentPage}">${issue.content}</a>
									</h2></td>
									<td style="color:#1C1C1C;">${issue.pre}</td>
									<td style="color:#1C1C1C;">${issue.readcount}</td>
									<td style="color:#1C1C1C;">${issue.link}</td>
								</tr>
							</c:forEach>						
						</table>
					</div>
					
					 -->
				</div>
			</div>
		</div>
	</div>
	
	<%-- 목록의 페이지 번호 뷰어 설정 --%>
	<div align="center">
	<c:if test="${count > 0}">
		<fmt:parseNumber var="res" value="${count/pageSize}" integerOnly="true"  />
		<c:set var="pageCount" value="${res + (count % pageSize == 0 ? 0 : 1)}" />
		<c:set var="pageBlock" value="10" />
		<fmt:parseNumber var="result" value="${currentPage/pageBlock}" integerOnly="true" />
		<fmt:parseNumber var="startPage" value="${result * pageBlock +1}" />
		<fmt:parseNumber var="endPage" value="${startPage + pageBlock - 1}" />
		<c:if test="${endPage > pageCount}" >
			<c:set var="endPage" value="${pageCount}" />
		</c:if>
		
		<c:if test="${startPage > pageBlock}">
			<a href="/team4/issue/issueBoard.do?pageNum=${startPage-pageBlock}" > &lt; </a>		
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" >
			<a href="/team4/issue/issueBoard.do?pageNum=${i}" class="nums"> &nbsp; ${i} &nbsp; </a>
		</c:forEach>
		<c:if test="${endPage < pageCount}">
			<a href="/team4/issue/issueBoard.do?pageNum=${startPage+pageBlock}" > &gt; </a>		
		</c:if>
	</c:if>
	</div>	
</body>
</html>