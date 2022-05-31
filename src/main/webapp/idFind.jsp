<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드립프트 Dripft - 아이디 찾기</title>
<link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function id_Search() {
	var id = document.idFind;
	
 	if (id.m_name.value.length < 1) {
	  alert("이름을 입력해주세요");
	  return;
	 }

	 if (id.m_tel.value.length < 1) {
		alert("핸드폰번호를 정확하게 입력해주세요");
		return;
	 }
 id.method = "post";
 id.action = "idFind";
 id.submit();  
}
	


</script>
</head>
<body>
	<form name="idFind"  action="./idFind" method="post">
		<h2>ID 찾기</h2>
		<input type="text" name="m_name" placeholder="이름"><br>
		<input type="text" name="m_tel" placeholder="전화번호"><br>
		<!-- <input type="button" name="enter" value="찾기" onClick="id_Search()"> -->
		<button type="submit" onClick="id_Search()">찾기 버튼!!!</button>
		<div id="checkResult">이 자리는 변경 자리</div><br>	
		${m_email }
		
		<% String m_email = (String)request.getAttribute("m_email"); %>
	</form>
</body>
</html>