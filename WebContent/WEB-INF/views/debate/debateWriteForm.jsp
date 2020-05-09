<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link href="/team4/resources/designCSS.css" rel="stylesheet" type="text/css">
		
</head>
<body style="background: #F2F2F2;">
	<div id="container-fluid" style="padding: 50px">
<!-- =========================header=============================== -->
		<div class="col-md-12">
			<jsp:include page="../share/headerPooter.jsp" flush="true" />
	    </div>
	
	<form action="/team4/debate/debatePro.do" method="post">
		<div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
	                        <div>
				                <span><strong>토론 주제 정하기</strong></span>
				            </div>
							<div class="form-group green-border-focus">
                           		<textarea class="form-control" style="width: 100% "  rows="5" id="sub" name="sub" placeholder="글을 입력해주세요."></textarea>
                           	</div>
                        </td>
                    </tr>
                     <tr>
                        <td>
                        	<div>
				                <span><strong>부연 설명 지어주기</strong></span>
				            </div>
							<div class="form-group green-border-focus">
                           		<textarea class="form-control" style="width: 100% "  rows="5" id="link" name="link" placeholder="글을 입력해주세요"></textarea>
                           	</div>
                        </td>
                    </tr>
                </table>
                <div style="width: 30%; float:none; margin:0 auto" >
					<input type="submit" value="저장" class="btn btn btn-danger btn-round" style="width: 100%"/>	
				</div>
            </div>
		</div>	
	</form>
	</div>
</body>
</html>