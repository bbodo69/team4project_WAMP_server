<%@page import="org.springframework.web.multipart.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<!-- ===============================for bootstrap=============================== -->
	<meta charset="UTF-8">
	<title>admin 작성</title>
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
<c:if test="${sessionScope.sId != 'admin'}">
	<script>
		alert("관리자님만 접근이 가능한 페이지입니다.")
		window.location="/team4/member/main.do";
	</script>
</c:if>
<c:if test="${sessionScope.sId == 'admin'}">
<body>
	<div id="container-fluid" style="padding: 50px">
<!-- =========================header=============================== -->
		<div class="col-md-12">
			<jsp:include page="../share/headerPooter.jsp" flush="true" />
	    </div>
		<div class="col-md-12" id="container-fluid" style="padding: 50px">
			<!-- jquery 사용선언 -->
			<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
			<script type="text/javascript">
				$(function(){
					$("#imgInp").on('change',function(){
						readURL(this);
					});
				});
				function readURL(input){
					if(input.files && input.files[0]){
						var reader = new FileReader();
						
						reader.onload =  function(e){
							$('#blah').attr('src',e.target.result);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
			</script>
			
			
			<h1> 작성 </h1>
			<form action="/team4/adminCommitment/adminWritePro.do" method="post" enctype="multipart/form-data">
				
				<table>
					
					<tr>		
						<td> 이름 </td>
						<td><input type="text" name="name"></td>
					</tr>
					
					<tr>
						<td> 정당 </td>
						<td>더불어민주당<input type="radio" name="party" value="더불어민주당" ></td>
						<td>미래통합당<input type="radio" name="party" value="미래통합당" ></td>
						<td>민생당<input type="radio" name="party" value="민생당" ></td>
						<td>미래한국당<input type="radio" name="party" value="미래한국당" ></td>
						<td>더불어시민당<input type="radio" name="party" value="더불어시민당" ></td>
						<td>정의당<input type="radio" name="party" value="정의당" ></td>
						<td>우리공화당<input type="radio" name="party" value="우리공화당" ></td>
						<td>민중당<input type="radio" name="party" value="민중당" ></td>
						<td>한국경제당<input type="radio" name="party" value="한국경제당" ></td>
						<td>국민의당<input type="radio" name="party" value="국민의당" ></td>
		
					</tr>
					
					<tr>
						<td> 지역구 </td>
						<td><input type="text" name="local"></td>
					</tr>
					
					<tr>
						<td> 내용 </td>
						<td><input type="text" name="content"></td>
					</tr>
					
					
					<tr>
						<td> 원본링크(공약내용) </td>
						<td><input type="file" name="uploadPdf" id="url" onchange="readURL(this)">선거공보 다운로드</td>
					</tr>
					
					<tr>
						<td> 사진 </td>
						<td><input type="file" name="uploadFile" id="imgInp"></td>
						<td><img id="blah" src="#" alt="img"></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="submit" value="저장" />
							<input type="reset" value="재작성" />
							<input type="button" value="리스트보기" onclick="window.location='/team4/commitment/list.do'" />
						</td>
					</tr>	
		
				</table>
			</form>
		</div>
	</div>
</body>
</c:if>
</html>