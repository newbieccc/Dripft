<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드립프트 Dripft - 회원정보 수정</title>
<link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script type="text/javascript" src="./js/common/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	
	<!-- font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<style>

#userinfobox {
	margin: 0 auto;
	margin-top: 80px;
	width: 430px;
	min-height: 300px;
	background-color: #F0FFF0;
	padding: 10px;
	box-sizing: border-box;
	text-align: center;
	border-radius: 15px;
}


#userinfo button {
	width: 150px;
	border: 0px;
	font-size: large;
	font-weight: bold;
	height: 40px;
}
</style>
</head>
<script type="text/javascript">



function nickCheck() {
	var nickname = $("#m_nickname").val();//
	  if(nickname == "" || nickname.length < 4){
		$("#checkResult1").css("color", "red");
		$("#checkResult1").text("4글자 이상이어야 합니다.");
	}else{  
		//$("#checkResult").css("color", "blue");
		//$("#checkResult").text(id + "라고 입력했습니다."); 
	$.ajax({
		url : "./nickCheck",
		type : "GET",
		dataType : "html",
		data : {"m_nickname" : nickname}, // 키값 : 값(var 뒤에 오는 값)
		success : function(result) {
			if (result == 0) {
				$("#checkResult1").css("color", "green");
				$("#checkResult1").text(nickname + "은 가입할 수 있습니다.");
				$("#joinBtn").attr("disabled", false);
			} else {
				$("#checkResult1").css("color", "red");
				$("#checkResult1").text(nickname + "는 이미 등록된 닉네임입니다.");
				$("#joinBtn").attr("disabled", true);
				$("#nickname").focus();
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
		return false;
	} else {
		alert("비밀번호가 일치합니다");
		return true;
	}
	
	
	
}


</script>
<body>
	<%@include file="./nav_main.jsp" %>	
	<form action="./userUpdate" method="POST"> <!-- 포스트로 변경된 값을 보냄 -->
 	  <%-- 서버에서 오는 값 : ${userInfo } <br> --%>
 	  <div id= userinfobox>
      이메일 : ${userInfo.m_email } <br><br>
      <%-- 비밀번호 : ${userInfo.m_password } <br> --%>
      비밀번호 재설정
      <input type="password" name="m_password"  id="m_password" value="${userInfo.m_password }" placeholder="비밀번호를 입력하세요" class="form-control"> <br> 
	  <input type="password" name="m_password2" id="m_password2" value="${userInfo.m_password }" placeholder="비밀번호를 다시한번 입력하세요" class="form-control" onchange="checkpw()"> <br>
      <input type="text" name="m_nickname" id="m_nickname" class="form-control" onchange="nickCheck()" value="${userInfo.m_nickname }">
	  <div id="checkResult1">닉네임을 확인중입니다.</div><br>
      생일 : ${userInfo.m_birth } <br><br>
      성별 : ${userInfo.m_gender } <br><br>
      <input type="tel" name="m_tel" placeholder="변경할 전화번호를 입력하세요"	class="form-control" value="${userInfo.m_tel }"> <br>
      등급 : ${userInfo.m_authority } <br>
      가입일 : ${userInfo.m_joindate }<br><br>
      
       <button type="submit" id="joinBtn" class="btn btn-outline-success">수정완료</button>
       </div>
	</form>
</body>
</html>