<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
        <!-- Bootstrap -->
        <link href="../plugin/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- font awesome -->
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <!-- Custom style -->
        <link rel="stylesheet" href="../plugin/bootstrap/css/style.css" media="screen" title="no title" charset="utf-8">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="../plugin/bootstrap/js/bootstrap.min.js"></script>
        <script src="../config/js/join.js"></script>

</head>
<script>
	// 유효성 검사
	function check(){
		var inputs = document.inputForm;
		if(!inputs.id.value){
			alert("아이디를 입력해주세요.")
			inputs.id.focus();
			return false;
		}
		
		if(!inputs.pw.value){
			alert("비밀번호를 입력해주세요.")
			inputs.pw.focus();
			return false;
		}
		
		if(!inputs.name.value){
			alert("이름을 입력해주세요.")
			inputs.name.focus();
			return false;
		}
		
		if(!inputs.gender.value){
			alert("성별을 선택해주세요.")
			return false;
		}
		
		if(!inputs.age.value){
			alert("나이를 입력해주세요.")
			inputs.age.focus();
			return false;
		}
		
		if(!inputs.td.value){
			alert("정치성향을 선택해주세요.")
			return false;
		}
		
		if(!inputs.qa1.value){
			alert("질문을 선택해주세요.")
			return false;
		}
		
		if(!inputs.qa2.value){
			alert("질문에 대한 답을 써주세요.")
			inputs.qa2.focus();
			return false;
		}
		
		if(!inputs.email.value){
			alert("eamil을 적어주세요.")
			inputs.eamil.focus();
			return false;
		}
	}

</script>
<c:if test="${sessionScope.sId != null}">
	<script>
		alert("유저께선 이미 가입된 상태이십니다.")
		window.location = "/team4/member/main.do";
	</script>
</c:if>

<c:if test="${sessionScope.sId == null}">
<body>
<article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
	
<h2 align="center"> 회원가입 </h2>
<form action="/team4/member/signupPro.do" onsubmit="return check()" method="post" name="inputForm">
<table>
	<tr>
		<td>아이디</td> 
		<td><input type="text" name="id" placeholder="아이디를 입력하세요."></td>
	</tr>
	
	<tr> 
		<td>비밀번호</td>
		<td><input type="password" name="pw" placeholder="비밀번호를 입력하세요."></td>
	</tr>
	
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" placeholder="이름을 입력하세요."></td>	
	</tr>
	
	<tr>
		<td>성별</td> 	
		<td>남성<input type="radio" name="gender" value="male"></td>
		<td>여성<input type="radio" name="gender" value="female"></td>
	<tr>
	
	<tr>
		<td>나이</td>
		<td><input type="text" name="age" placeholder="나이를 입력하세요."></td>
	</tr>
	<!-- option에 쓸데없는 태그 붙이지 말것. 그거 때문에 오류가 많았다. -->
	<tr>
		<td>본인확인질문</td>
		<td><select name="qa1">
		<option selected="selected">부모님의 성함은?</option>	
		<option>가장 존경하는 인물은?</option>
		<option>출신 학교는?</option>
		</select></td>
		<td>질문의 답</td>
		<td><input type="text" name="qa2"></td> 
	</tr>
	
	<tr>
		<td>당신의 정치 성향은 어느쪽이라고 생각하십니까?</td> 
		<td>진보<input type="radio" name="td" value="진보"></td>
		<td>중도<input type="radio" name="td" value="중도"></td>
		<td>보수<input type="radio" name="td" value="보수"></td>
	</tr>
	
	
	
	<tr>
		<td>email을 입력해주세요.</td>
		<td><input type="text" name="email"></td>
	</tr>
	
	<tr>
	<td colspan="2" align="center">
		<input type="submit" value="가입">
		<input type="reset" value="재작성">
		<input type="button" value="취소" onclick="window.location.href='/team4/member/main.do'">
	</td>
	</tr>
</table>
</form>	
</body>
</c:if>
</html>