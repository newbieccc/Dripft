<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%
Cookie[] cookie = request.getCookies();
String id = "";
String domain = "";
String id_rem = null;
if(cookie != null){
	for(int i = 0; i < cookie.length; i++){
		if(cookie[i].getName().trim().equals("id")){
			System.out.println(cookie[i].getValue());
			id = cookie[i].getValue();
		}
		if(cookie[i].getName().equals("domain")){
			domain = cookie[i].getValue();
		}
		if(cookie[i].getName().equals("id_rem")){
			id_rem = cookie[i].getValue();
		}
	}
	if(!id.equals("") && !domain.equals("")){
		id = id + "@" + domain;
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="./css/menu.css" rel="stylesheet">
<style type="text/css">
#main{
	margin: 0 auto;
	width: 800px;
	height: 100%;
}
#loginform{
	margin:0 auto;
	margin-top:150px;
	height: 450px;
	width: 300px;
	background-color: gray;
	padding: 10px;
}
#loginform input, button{
	margin: 0;
	padding: 0;
	background-color: white;
	border: 0;
	height: 40px;
	width: 100%;
}
#loginform input{
	margin-bottom: 10px;
}
#loginform input:hover, button:hover{
}
</style>
</head>
<body>
	<%-- <%@include file="./menu.jsp"%> --%>
	<div id="main">
		<div id="loginform">
			<form action="./login" method="post" >
				<img alt="" src="./img/drip.png" height="300px;">
				ID :<input type="text" name="m_email" value="<%=id %>" required="required">
				PW : <input type="password" name="m_password" required="required">
				ID기억 <input type="checkbox" name="id_rem" <%=id_rem%>>
				<%if(id.length() > 1) out.println("checked"); %>
				<input type="submit" value="로그인">
			</form>
			<a href="join.jsp">회원가입</a>
			<div id="idFind">
				<form action="./idFind">			
				<a href="idFind.jsp">아이디 찾기</a>
				</form>
			</div>
			<div id="pwFind">
				<form action="./pwFind">			
				<a href="pwFind.jsp">비번 찾기</a>
				</form>
			</div>
		</div>
		
		<%
		String error = request.getParameter("error");
		if (error != null) {
		%>
		<script type="text/javascript">
			alert("아이디와 비밀번호가 일치하지 않습니다.\n다시 입력해주세요.");
		</script>
		<%
		}
		%>
	</div>
</body>
</html>



