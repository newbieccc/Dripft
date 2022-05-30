<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

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
</script>
<body>
 	  서버에서 오는 값 : ${userInfo } <br>
      이메일 : ${userInfo.m_email } <br>
      비밀번호 : ${userInfo.m_password } <br>
      이름: ${userInfo.m_name } <br>
      닉네임: ${userInfo.m_nickname } <br>
      <input type="email" name="m_email" id="m_email" placeholder="이메일을 입력하세요" class="form-control" onchange="emailCheck()">
	  <div id="checkResult">이메일을 확인중입니다.</div>
      생일 : ${userInfo.m_birth } <br>
      성별 : ${userInfo.m_gender } <br>
      폰번 : ${userInfo.m_tel } <br>
      등급 : ${userInfo.m_authority } <br>
      가입일 : ${userInfo.m_joindate }<br>
      
       <button onclick = "location.href='./userInfo.jsp'">수정완료</button>
</body>
</html>