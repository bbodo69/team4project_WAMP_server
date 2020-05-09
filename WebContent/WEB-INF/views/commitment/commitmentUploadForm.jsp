<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background: #F2F2F2;">
<h1>파일 업로드</h1>
<form class= "fileUploadForm" id="fileUploadForm" action="commitmentUpload.do", method="post" enctype="multipart/form-data">
    <input type="file", name="fileUpload" id="fileUpload" placeholder="파일 선택" /><br/>
    <input type="file", name="fileUpload" id="fileUpload2" placeholder="파일 선택" /><br/>
    <input type="button" value="업로드" onClick="fileSubmit();">
</form>
<script>
	function fileSubmit(){
		alert("ajax method")
		var formData = new FormData($("#fileUploadForm")[0]);
		alert(formData);
		$.ajax({
			type : 'post',
			url : 'commitmentUpload.do',
			data : formData,
			processData : false,
			contentType : false,
			success : function(data) {
				alert("파일 업로드 하였습니다.");
			},
			error : function(error){
				alert("파일 업로드에 실패하였습니다.");
				console.log(error);
				console.log(error.status);
			}
		});
	}
</script>

</body>
</html>