<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function nickCheck() {
	//alert("변경 ㅇㅋ?^^.");
	var id = $("#nickName").val();
 	//alert(id + "으로 닉넴 변경 ㄱㄱ?");
	if(id == "" || id.length <= 2){
		$("#checkResult").css("color", "red");
		$("#checkResult").text("2글자 이상이어야 합니다.");
	} else {
		$("#checkResult").css("color", "blue");
		$("#checkResult").text(id + "라고 입력했네요^.^");
		$.ajax({
			url : "./nickCheck",
			type : "POST",
			dataType : "html",
			data : {"nickName" : id},
			success : function(data) {
				alert(data);
				if(data == 0){
					$("#checkResult").css("color", "green");
					$("#checkResult").text(m_nickName + "는 가입 할 수 있습니다.");
					$("#nickBtn").attr("disabled", false);
				} else {
					$("#checkResult").css("color", "red");
					$("#checkResult").text(m_nickName + "는 이미 등록된 ID입니다.");				
					$("#nickBtn").attr("disabled", true);
					$("#m_nickName").focus();
				}
			},
			error : function(){
				alert("서버가 동작하지 않습니다.");
			}
			
		});		
	}
}

function check() {
	var form = document.nickform;
	alert("변경 완료 ㅅㄱ.");
}

</script>
</head>
<body>
	<div id="main">
		서버에서 오는 값 : ${userInfo } <br>
		이메일 : ${userInfo.m_email } <br>
		비밀번호 : ${userInfo.m_password } <br>
		이름: ${userInfo.m_name } <br>
		닉네임: ${userInfo.m_nickname } 
		<form name="nickform" action="./myInfoChange" method="post" onsubmit="return check()">
		<P>
			<input type="text" id="nickName" name="m_nickName" placeholder="닉네임 변경하기" class="form-control" onchange="nickCheck()">
			<div id="checkResult">닉네임 중복 확인 중입니다</div>
			<button type="submit" id="nickBtn" disabled="disabled">변경하기</button>
		</form>
		생일 : ${userInfo.m_birth } <br>
		성별 : ${userInfo.m_gender } <br>
		폰번 : ${userInfo.m_tel } <br>
		등급 : ${userInfo.m_authority } <br>
		가입일 : ${userInfo.m_joindate }<br>
	</div>
</body>
</html>
