<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link href="/team4/resources/designCSS.css" rel="stylesheet" type="text/css"> 
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
</head>
<body>
	<div id="container-fluid" style="padding: 50px">
		<div class="col-md-12">
			<jsp:include page="../share/headerPooter.jsp" flush="true" />
	    </div>
		<div class="container-fluid">		
		 	<div class="section" id="main"> 			 	
			 	<div class="row text-center" style="width: 100%">
			 		<div class="col-md-2" style="width: 30%; float:none; margin:0 auto">		 
			 		</div>
					<div class="col-md-8" id="div_table_debate">
						<table id="debate_table" class="table">
							<colgroup>
								<col width="55%">
								<col width="15%">
								<col width="10%">
								<col width="20%">				
							</colgroup>
							<tbody>
								<tr>
									<th>제목</th>
									<th>기사</th>
									<th>조회</th>
									<th>날짜</th>
								</tr>
							</tbody>
								<c:forEach var="debate" items="${articleList}">
									<tr>
										<td><a href="/team4/debate/debateBoard.do?num=${debate.num}&pageNum=${currentPage}">${debate.sub}</a></td>
										<td>${debate.link}</td>
										<td>${debate.readcount}</td>
										<td>${debate.reg}</td>
									</tr>
								</c:forEach>						
						</table>			
						<!-- =============================================pagination ============================================= -->
						<div id="div_pageNumber" class="pagination">
							<c:if test="${count > 0 }">
								<fmt:parseNumber var="res" value="${count/pageSize}" integerOnly="true" />
								<c:set var="pageCount" value="${res + (count % pageSize == 0 ? 0 : 1)}" />
								<c:set var="pageBlock" value="10" />
								<fmt:parseNumber var="result" value="${currentPage/pageBlock}" integerOnly="true" />
								<fmt:parseNumber var="startPage" value="${result * pageBlock +1}" />
								<fmt:parseNumber var="endPage" value="${startPage + pageBlock - 1}" />
								<c:if test="${endPage > pageCount}" >
									<c:set var="endPage" value="${pageCount}" />
								</c:if>										
								<c:if test="${startPage > pageBlock}">
										<nav>
										  <ul class="pagination">
										    <li>
										      <a href="#" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										      </a>
										    </li>
										    <li><a class="page-numbers" href="/team4/debate/debateBoardMain.do?pageNum=${startPage-pageBlock}" > &lt; </a></li>								    
										    <li>
										      <a href="#" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										      </a>
										    </li>
										  </ul>
										</nav>										
								</c:if>									
								<nav>
								  <ul class="pagination">
								    <li>
								      <a href="#" aria-label="Previous">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>		
									<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" >							
										<li><a class="page-numbers" href="/team4/debate/debateBoardMain.do?pageNum=${i}" class="nums"> &nbsp; ${i} &nbsp; </a></li>							
									</c:forEach>
									<li>
									  <a href="#" aria-label="Next">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
								    </li>
								  </ul>
								</nav>							
									<c:if test="${endPage < pageCount}">
										<nav>
										  <ul class="pagination">
										    <li>
										      <a href="#" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										      </a>
										    </li>								    
										    <li><a class="page-numbers" href="/team4/debate/debateBoardMain.do?pageNum=${startPage+pageBlock}" > &gt; </a></li>
										    <li>
										      <a href="#" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										      </a>
										    </li>
										  </ul>
										</nav>								
									</c:if>					
							</c:if>			
						</div>
						<!-- ================================================================================================== -->
					</div>
					<div class="col-md-2">
					</div>
				</div>
			</div>
			
			<footer>
				<div class="row footer">
					<div class="col-xs-12">
						<h3>푸터</h3>
					</div>
				</div>
			</footer>	
		</div>
	</div>
	
</body>
</html>