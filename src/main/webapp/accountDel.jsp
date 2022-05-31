<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="shortcut icon" type="image/x-icon" href="fabicon.ico" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function delCheck() {
	//alert("탈퇴하시겠습니까?.");
	var id = $("#id").val();
	//alert(id + "님은 탈퇴하시겠습니까?");
	if(id != '탈퇴'){
		$("#checkResult").css("color", "red");
		$("#checkResult").text("탈퇴를 입력해주세요.");
		$("#delBtn").attr("disabled", true);
	} else {
		$("#checkResult").css("color", "green");
		$("#checkResult").text(id + "라고 입력했습니다.");
		$("#delBtn").attr("disabled", false);
	} 
}
function check() {
	var form = document.delform;
	alert("탈퇴하였습니다.");
}

</script>
</head>
<body>
	
	<form name="delform" action="./deleteAccount" method="post" onsubmit="return check()">
		<input type="text" id="id" name="id" placeholder="'탈퇴'를 입력하세요" class="form-control" onchange="delCheck()">
		<div id="checkResult">탈퇴를 확인중입니다.</div>
		<button type="submit" id="delBtn" disabled="disabled">서블렛 경로의 탈퇴</button>
	</form>


</body>
</html>