<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list page</title>
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
	
		
</head>
<body style="background: #F2F2F2;">
<!-- 세션값이 admin이 아닐 때 -->
	<c:if test="${count == 0}">
		<table>	
		<c:if test="${sessionScope.sId != 'admin'}">
			<jsp:include page="../share/headerPooter.jsp" flush="true" />
	<div id="container-fluid" style="padding: 50px">		
		<div class="container-fluid">
			<div class="section" id="main"> 			 	
				<div class="row text-center">
					<div class="col-md-12" id="div_table_debate">
						<h1>공사중</h1>
					</div>
					<div class="col-md-12" id="div_table_debate">
						<table id="debate_table" class="table" style="width: 100%">
							<colgroup>
								<col width="10%">
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<tbody>
								<tr>
									<th style="text-align:center;">No.</th>
									<th style="text-align:center;">이름</th>
									<th style="text-align:center;">사진</th>
									<th style="text-align:center;">정당</th>
									<th style="text-align:center;">지역구</th>
									<th style="text-align:center;">내용</th>
								</tr>
							</tbody>
		<c:forEach var="article" items="${articleList}">
			<tr>
				<td>${number}<!-- 글번호 -->
					<c:set var="number" value="${number-1}"/>
				</td>
			
			<td align="center">
				<c:set var="wid" value="0"/>
				<a style="color:black;" href="/team4/adminCommitment/content.do?num=${article.num}&pageNum=${currentPage}">${article.name}</a>
			</td>
			
			<td>${article.photo}</td>			
			<td>${article.party}</td>
			<td>${article.local}</td>
			<td>${article.content}</td>
			
			</tr>
		
		</c:forEach>
			<tr>
				<td align="center">등록된 후보 정보가 없습니다.</td>
			</tr>
		</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		</table>
	</c:if>
	<!-- 게시글이 있을 때 -->
	<c:if test="${count > 0}">
		<c:if test="${sessionScope.sId != 'admin'}">
		
	<jsp:include page="../share/headerPooter.jsp" flush="true" />
	<div id="container-fluid" style="padding: 50px">		
		<div class="container-fluid">
			<div class="section" id="main"> 			 	
				<div class="row text-center">
					
			
					<div class="col-md-12" id="div_table_debate">
						<table id="debate_table" class="table" style="width: 100%">
							<colgroup>
								<col width="10%">
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<tbody>
								<tr>
									<th style="text-align:center;">No.</th>
									<th style="text-align:center;">이름</th>
									<th style="text-align:center;">사진</th>
									<th style="text-align:center;">정당</th>
									<th style="text-align:center;">지역구</th>
									<th style="text-align:center;">내용</th>
								</tr>
							</tbody>
		<c:forEach var="article" items="${articleList}">
			<tr>
				<td>${number}<!-- 글번호 -->
					<c:set var="number" value="${number-1}"/>
				</td>
			
			<td align="center">
				<c:set var="wid" value="0"/>
				<a style="color:black;" href="/team4/adminCommitment/content.do?num=${article.num}&pageNum=${currentPage}">${article.name}</a>
			</td>
			
			<td>${article.photo}</td>			
			<td>${article.party}</td>
			<td>${article.local}</td>
			<td>${article.content}</td>
			
			</tr>
		
		</c:forEach>
		
			<tr>
				<td><button onclick="window.location='/team4/adminCommitment/adminWrite.do'">등록하기</button></td>
					
			</tr>
				</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</c:if>
	</c:if>
	
	<c:if test="${count>=0}">
		<c:if test="${sessionScope.sId == 'admin'}">
		
	<jsp:include page="../share/headerPooter.jsp" flush="true" />
	<div id="container-fluid" style="padding: 50px">		
		<div class="container-fluid">
			<div class="section" id="main"> 			 	
				<div class="row text-center">
					<div class="col-md-12" id="div_table_debate">
						<table id="debate_table" class="table" style="width: 100%">
							<colgroup>
								<col width="10%">
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<tbody>
								<tr>
									<th style="text-align:center;">No.</th>
									<th style="text-align:center;">이름</th>
									<th style="text-align:center;">사진</th>
									<th style="text-align:center;">정당</th>
									<th style="text-align:center;">지역구</th>
									<th style="text-align:center;">내용</th>
								</tr>
							</tbody>
		<c:forEach var="article" items="${articleList}">
			<tr>
				<td>${number}<!-- 글번호 -->
					<c:set var="number" value="${number-1}"/>
				</td>
			
			<td align="center">
				<c:set var="wid" value="0"/>
				<a style="color:black;" href="/team4/adminCommitment/content.do?num=${article.num}&pageNum=${currentPage}">${article.name}</a>
			</td>
			
			<td>${article.photo}</td>			
			<td>${article.party}</td>
			<td>${article.local}</td>
			<td>${article.content}</td>
			
			</tr>
		
		</c:forEach>
		
			<tr>
				<td><button onclick="window.location='/team4/adminCommitment/adminWrite.do'">등록하기</button></td>
					
			</tr>
				</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	</c:if>
	
	
	
	<br />
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
			<a href="/spring/board/list.do?pageNum=${startPage-pageBlock}" > &lt; </a>		
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" >
			<a href="/spring/board/list.do?pageNum=${i}" class="nums"> &nbsp; ${i} &nbsp; </a>
		</c:forEach>
		
		
		<c:if test="${endPage < pageCount}">
			<a href="/spring/board/list.do?pageNum=${startPage+pageBlock}" > &gt; </a>		
		</c:if>
	</c:if>
<jsp:include page="../share/pooter.jsp" flush="true"/>
	</div>
</body>