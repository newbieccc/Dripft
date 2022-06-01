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
<title>드립프트 Dripft - 로그인</title>
<link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico" />
<link href="./css/menu.css" rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
<script type="text/javascript" src="./js/common/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
</head>
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
element.style {
}
.panel {
	border-width: 1px;
	border: 1px;
	background-color: #f8f8f8;
	position: absolute;
  	left: 50%;
  	transform: translateX(-50%);
  	width: 500px;
}
div {
    display: block;
}
.content {
    width: 805px;
    min-height: 800px;
    margin: auto;
    margin-top: 100px;
}
.content-header {
    margin-top: 0;
    margin-bottom: 20px;
    color: #6f7275;
}
#content-heade{
	margin-bottom: 15px;
}
h3, .h3 {
    font-size: 24px;
}
h3 {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    margin: auto;
    text-align: center;
}
.form-group {
	margin-bottom: 15px;
}
p {
	margin: 0 0 10px;
}
.panel {
	border-width: 1px;
	border: 1px;
	background-color: #f8f8f8;
	position: absolute;
  	left: 50%;
  	transform: translateX(-50%);
}	
</style>
</head>
<body>
	<%@include file="./nav_main.jsp" %>
	
	<div id="edit-user" class="content" role="main">
    <h3 class="content-header">로그인</h3>
    <div class="col-md-6 main-block-left">
        <div class="panel panel-default" style="width: 550px;">
            <div class="panel-heading">
                <h5 class="panel-header">아이디 로그인</h5>
            </div>

            <form action="./login" class="form-signin form-user panel-body panel-margin" method="post" id="loginForm" autocomplete="off">
                    <input type="hidden" name="redirectUrl" value="%2Farticles%2Fquestions">
                <input type="email" name="m_email" value="<%=id %>" autocorrect="off" autocapitalize="off"  id="username" class="username form-control input-sm" placeholder="이메일" required="" autofocus="">
                <input type="password" name="m_password" class="password form-control input-sm" placeholder="비밀번호" required="">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="id_rem" id="id_rem" <%=id_rem%>> 로그인 유지
					<%if(id.length() > 1) out.println("checked"); %>
                    </label>
                </div>
                
                <div id="divUserLogin">
                    <button class="btn btn-primary btn-block" type="submit" id="btnUserLogin">로그인</button>
                </div>
                <div class="signup-block">
         	 	    <a href="join.jsp">회원가입</a>
                    <span class="inline-saperator">/</span>
                    <a href="./idFind.jsp">계정 찾기</a>
                    <span class="inline-saperator">/</span>
                    <a href="./join.jsp">회원 가입</a>
                </div>
            </form>
        </div>
    </div>
</div>

	<%-- <div id="main">
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
	</div>  --%>
		
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
</body>
</html>



