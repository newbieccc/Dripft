<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드립프트 Dripft - 회원가입</title>
<link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="./css/menu.css" rel="stylesheet">
<style type="text/css">
#main {
	margin: 0 auto;
	width: 800px;
	height: 100%;
}

#joinbox {
	margin: 0 auto;
	width: 430px;
	min-height: 600px;
	background-color: #F0FFF0;
	padding: 10px;
	box-sizing: border-box;
	text-align: center;
	border-radius: 15px;
}

#joinbox input {
	margin-bottom: 10px;
	height: 40px;
}

#joinbox button {
	width: 150px;
	border: 0px;
	font-size: large;
	font-weight: bold;
	height: 40px;
}
</style>
<script type="text/javascript">
	//주석처리 : 자바스크립트 영역
	function emailCheck() {
		var email = $("#m_email").val();//
		if(email == "" || email.length < 4){
			$("#checkResult").css("color", "red");
			$("#checkResult").text("4글자 이상이어야 합니다.");
		}else{
			//$("#checkResult").css("color", "blue");
			//$("#checkResult").text(id + "라고 입력했습니다.");
		$.ajax({
			url : "./emailCheck",
			type : "POST",
			dataType : "html",
			data : {"m_email" : email}, // 키값 : 값(var 뒤에 오는 값)
			success : function(result) {
				if (result == 0) {
					$("#checkResult").css("color", "green");
					$("#checkResult").text(email + "은 가입할 수 있습니다.");
				} else {
					$("#checkResult").css("color", "red");
					$("#checkResult").text(email + "는 이미 사용중이거나 탈퇴한 Email입니다.");
					$("#joinBtn").attr("disabled", true);
					$("#email").focus();
				}
			},
			error : function() {
				alert("서버가 동작하지 않습니다.");
			}
		});

		}
	}

	function checkpw() {
		var password = document.getElementById('m_password').value;
		var password2 = document.getElementById('m_password2').value;
		
		if(password != password2) {
			alert("비밀번호가 일치하지 않습니다");
			$("#joinBtn").attr("disabled", true);
			return false;
		} else {
			alert("비밀번호가 일치합니다");
			return true;
		}
		
	}
	
	function nickCheck() {
		var nickname = $("#m_nickname").val();//
		
		$.ajax({
			url : "./nickCheck",
			type : "GET",
			dataType : "html",
			data : {"m_nickname" : nickname}, // 키값 : 값(var 뒤에 오는 값)
			success : function(result) {
				if (result == 0) {
					$("#checkResult1").css("color", "green");
					$("#checkResult1").text(nickname + "은 가입할 수 있습니다.");
					$("#joinBtn").attr("disabled", true);
				} else {
					$("#checkResult1").css("color", "red");
					$("#checkResult1").text(nickname + "는 이미 등록된 닉네임입니다.");
					$("#joinBtn").attr("disabled", false);
					$("#nickname").focus();
				}
			},
			error : function() {
				alert("서버가 동작하지 않습니다.");
			}
		});
	}
	
	 function check() {
		var password = document.getElementById('m_password').value;
		if(password == ''){
			alert("비밀번호에 공백 있음");
			return false;
		} 
	 }
	 
	
</script>
</head>



	<h1></h1>
	<div id="main">
		
		
		<div id="joinbox">
			
			<h1><img alt="" src="./img/logo.png" width = 80px;>회원가입</h1>
			
			<hr>
			<form name="joinform" action="./join" method="post"	onsubmit="return check()">
				<input type="email" name="m_email" id="m_email" placeholder="이메일을 입력하세요" class="form-control" onchange="emailCheck()">
				<div id="checkResult">이메일을 확인중입니다.</div>
				<input type="password" name="m_password"  id="m_password" placeholder="비밀번호를 입력하세요" required="required" class="form-control"> 
				<input type="password" name="m_password2" id="m_password2" placeholder="비밀번호를 다시한번 입력하세요" required="required" class="form-control" onchange="checkpw()"> 
				<input type="text" name="m_name" id="m_name" placeholder="이름을 입력하세요" required="required" class="form-control" > 
				<input type="text" name="m_nickname" id="m_nickname" placeholder="닉네임을 입력하세요" required="required" class="form-control" onchange="nickCheck()">
				<div id="checkResult1">닉네임을 확인중입니다.</div>
				<input type="date" name="m_birth" placeholder="생일을 입력하세요" class="form-control"> 
				<input type="radio" name="m_gender" value="male" class="custom-control-input" checked>남자 
				<input type="radio"	name="m_gender" value="female" class="custom-control-input">여자 
				<input	type="tel" name="m_tel" placeholder="전화번호를 입력하세요" required="required" class="form-control">
				<button type="submit" id="joinBtn" class="btn btn-outline-success" disabled="disabled">가입하기</button>
			</form>
		</div>







	</div>
</body>
</html>