<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
	
<!DOCTYPE html>
<html>
<head>

<!-- ===============================for bootstrap=============================== -->
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
	<jsp:include page="../share/headerPooter.jsp" flush="true" />
	<div id="container-fluid" style="padding: 50px">
<!-- =========================header=============================== -->
<!-- =========================header=============================== -->	    
		<div class="row text-center">
			<div class="col-md-12" id="debateSub">
				<h1>${article.sub}</h1>	        	
		       	<div id="reple_button">		
		       		<br/><br/><br/><br/><br/>								<!-- collapse : https://getbootstrap.com/docs/4.3/components/collapse/-->
		       	</div>
			</div>
		</div>
		
		
<!-- =========================reple=============================== -->
			<jsp:include page="debateRepleForm.jsp" flush="true">
	    		<jsp:param name="num" value="${article.num}" />
	    	</jsp:include>
  
	    <div class="row">
	        <div class="col-md-12" id="article">
<!-- =========================reple=============================== -->	
<!-- https://kuzuro.blogspot.com/2018/10/18-ajax.html 댓글추가기능 참고 -->	        
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-12" id="link">
	        </div>
	    </div>
	     <div class="row">
	        <div class="col-md-12" id="footer">
	        </div>
	    </div>
	</div>
</body>
</html>