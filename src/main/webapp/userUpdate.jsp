<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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