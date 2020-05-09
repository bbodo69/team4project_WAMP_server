<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link href="/team4/resources/designCSS.css" rel="stylesheet" type="text/css"> 
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>    
    
    
</head>
<body style="background: #F2F2F2;">
<jsp:include page="../share/headerPooter.jsp" flush="true" />
	<div class="container-fluid" style="padding: 50px">
	        
	    <div class="row header">
	    </div>
	    <div class="container-fluid" style="padding: 50px">
		    <div class="row main section">
		    
		    
		        <div class="col-md-6" style="height:40%">
	        		<table id="debate_table" class="table" style="width: 100%">
						<colgroup>
							<col width="60%">
							<col width="20%">
							<col width="20%">				
						</colgroup>
						<tbody>
							<tr>
								<th style="text-align:center;">주제</th>
								<!-- 
								<th>기사</th>
								 -->
								<th style="text-align:center;">조회</th>
								<th style="text-align:center;">날짜</th>
							</tr>
						</tbody>
						<c:forEach var="debate" items="${debate}">
							<tr>
								<td><a style="color:#1C1C1C;;" href="/team4/debate/debateBoard.do?num=${debate.num}&pageNum=1">${debate.sub}</a></td>
								<!-- 
								<td>${debate.link}</td>
								 -->
								<td style="color:#1C1C1C;">${debate.readcount}</td>
								<td style="color:#1C1C1C;;">${debate.reg}</td>
							</tr>
						</c:forEach>						
					</table>
		        </div>
		        
		        
		        <div class="col-md-6" style="height:40%">
	        		<table id="debate_table" class="table" style="width: 100%">
						<colgroup>
							<col width="60%">
							<col width="20%">
							<col width="20%">				
						</colgroup>
						<tbody>
							<tr>
								<th style="text-align:center;">주제</th>
								<!-- 
								<th>기사</th>
								 -->
								<th style="text-align:center;">조회</th>
								<th style="text-align:center;">날짜</th>
							</tr>
						</tbody>
						<c:forEach var="com" items="${com}">
							<tr>
								<td><a style="color:#1C1C1C;;" href="/team4/adminCommitment/content.do?num=${com.num}&pageNum=${currentPage}">${com.sub}</a></td>
								<!-- 
								<td>${debate.link}</td>
								 -->
								<td style="color:#1C1C1C;">${com.readcount}</td>
								<td style="color:#1C1C1C;;">${com.reg}</td>
							</tr>
						</c:forEach>						
					</table>
		        </div>
		        
		        
		        
		        
		        <div class="col-md-6" style="height:40%">
	        		<table id="debate_table" class="table" style="width: 100%">
						<colgroup>
							<col width="60%">
							<col width="20%">
							<col width="20%">				
						</colgroup>
						<tbody>
							<tr>
								<th style="text-align:center;">주제</th>
								<!-- 
								<th>기사</th>
								 -->
								<th style="text-align:center;">조회</th>
								<th style="text-align:center;">날짜</th>
							</tr>
						</tbody>
						<c:forEach var="issue" items="${issue}">
							<tr>
								<td><a style="color:#1C1C1C;;" href="/team4/issue/issueBoardMain.do?num=${issue.num}&pageNum=1">${issue.content}</a></td>
								<td style="color:#1C1C1C;">${issue.td}</td>
								<td style="color:#1C1C1C;">${issue.reg}</td>
							</tr>
						</c:forEach>						
					</table>
		        </div>
		        
		        
		        
		        
		        <div class="col-md-6" style="height:40%">
	        		<table id="debate_table" class="table" style="width: 100%">
						<colgroup>
							<col width="60%">
							<col width="20%">
							<col width="20%">				
						</colgroup>
						<tbody>
							<tr>
								<th style="text-align:center;">주제</th>
								<!-- 
								<th>기사</th>
								 -->
								<th style="text-align:center;">조회</th>
								<th style="text-align:center;">날짜</th>
							</tr>
						</tbody>
						<c:forEach var="debate" items="${debate}">
							<tr>
								<td><a style="color:#1C1C1C;;" href="/team4/debate/debateBoard.do?num=${debate.num}&pageNum=${currentPage}">${debate.sub}</a></td>
								<!-- 
								<td>${debate.link}</td>
								 -->
								<td style="color:#1C1C1C;">${debate.readcount}</td>
								<td style="color:#1C1C1C;;">${debate.reg}</td>
							</tr>
						</c:forEach>						
					</table>
		        </div>
		        
		        
		    </div>
		</div>
	    <div class="container-fluid" style="padding: 50px">
		    <div class="row main section">
		        <div class="col-md-2"></div>
		        <div class="col-md-8"></div>
		        <div class="col-md-2"></div>
		    </div>
		</div>
		<div class="container-fluid" style="padding: 50px">
		    <div class="row footer">
		        <div class="col-xs-12"></div>
	    	</div>
	    </div>
	</div>
</body>
</html>