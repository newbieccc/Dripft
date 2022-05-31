<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드립프트 Dripft - 비밀번호 재설정</title>
<link rel="shortcut icon" type="image/x-icon" href="fabicon.ico" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>	
	<form name="pwFind" action="./pwFind" method="post">
		<h2>PW 재설정!</h2>
		<input type="text" name="m_email" placeholder="이메일"><br>
		<input type="text" name="m_name" placeholder="이름"><br>
		<input type="text" name="m_tel" placeholder="전화번호"><br>
		<input type="text" name="m_password" placeholder="비번"><br>
		<input type="text" name="pw2" placeholder="비번확인"><br>
		<button type="submit">확인 버튼</button>
	</form>
</body>
</html>