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

</script>
</head>
<body>
  <div id="main">
      서버에서 오는 값 : ${userInfo } <br>
      이메일 : ${userInfo.m_email } <br>
      비밀번호 : ${userInfo.m_password } <br>
      이름: ${userInfo.m_name } <br>
      닉네임: ${userInfo.m_nickname } <br>
      생일 : ${userInfo.m_birth } <br>
      성별 : ${userInfo.m_gender } <br>
      폰번 : ${userInfo.m_tel } <br>
      등급 : ${userInfo.m_authority } <br>
      가입일 : ${userInfo.m_joindate }<br>
      <button onclick = "location.href='./userUpdate'">정보수정</button>
   </div>
</body>
</html>