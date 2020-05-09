<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
	
<!DOCTYPE html>
<html>
<head>
<head>
<!-- ===============================for bootstrap=============================== -->
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 	
	<link href="/team4/resources/designCSS.css" rel="stylesheet" type="text/css">
     
<!-- ===============================for chart=============================== -->    
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
	
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<!-- ========================================================================= -->
		
</head>
<body>
	<div class="container">
		 <div class="row">
	        <div class="col-xs-12" id="header">
	        	<h3>========헤더부분========<a href="http://localhost:8080/team4/debate/debateBoardMain.do">메인으로 이동</a></h3>
	        	
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-xs-12" id="debateSub">
	        	<h3>${article.sub}</h3>	        	
	        	<div id="reple_button">										<!-- collapse : https://getbootstrap.com/docs/4.3/components/collapse/-->
	        		<p>
	        			<a class="btn btn-primary" data-toggle="collapse" href="#debate_reple_div" role="button" aria-expanded="false" aria-controls="collapseExample">
	        				글쓰기
	        			</a>	        			
	        		</p>
	        	</div>
	        </div>
	    </div>
	    
<!-- ============================그래프부분==================================== -->
<!-- https://bootsnipp.com/snippets/0e45j  -->	    
	    <div class="row">
	        <div class="col-xs-12" id="graph">
	        	<div class="widget widget-black shadow">
	                <div class="widget-title">찬성 VS 반대</div>

	                <div style="clear: both;"></div>
	                <div class="" style="max-height: 5px;">
	                    <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" style="width:20%">
	                        <strong style="color: black;">찬성 20%</strong>
	                    </div>
	                    <div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" style="width:80%">
	                        <strong style="color: black;">반대 80%</strong>
	                    </div>
	
	                </div>
	                <div class="widget-controls hidden">
	                    <a href="#" class="widget-control-right"><span class="fa fa-times"></span></a>
	                </div>
	            </div>
	        </div>       	        
	    </div>
<!-- ================================================================ -->	   
		<div class="collapse" id="debate_reple_div">
			<div class="card card-body">								<!-- ajax 이용 글 등록 : https://gangnam-americano.tistory.com/32 -->
	    		<jsp:include page="debateRepleForm.jsp" flush="true">
	    			<jsp:param name="num" value="${article.num}" />
	    		</jsp:include>
	    	</div>	        		
	    </div>
	    <div class="row">
	        <div class="col-xs-12" id="article">
	        
	        	<jsp:include page="debateRepleList.jsp" flush="true">
	        		<jsp:param name="num" value="${article.num}" />
	        	</jsp:include>
	        	
	        	<h3>ajax 이용 reple 관리하기,  ${article.num}</h3>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-xs-12" id="link">
	        	<h3>기사 링크 뿌려주기</h3>
	        </div>
	    </div>
	     <div class="row">
	        <div class="col-xs-12" id="footer">
	        	<h3>========푸터부분========</h3>
	        </div>
	    </div>
	</div>
	
</body>
</html>