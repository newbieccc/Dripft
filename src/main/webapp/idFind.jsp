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
<!-- 합쳐지고 최소화된 최신 CSS -->
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
<style type="text/css">
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
<jsp:include page="nav_main.jsp"></jsp:include>
	<div id="create-user" class="content" role="main">
		<h3 id="content-heade">계정 찾기</h3>
			<form name="idFind"  action="./idFind" method="post">
			<div class="col-sm-8 col-sm-offset-2">
			    <div class="panel panel-default panel-margin-10">
			        <div class="panel-body panel-body-content text-center">
			        <br>
			            <p class="lead">이름과 전화번호를 입력해 주세요.</p>
			            	<p>회원 가입시 입력하신 이름과 전화번호를 입력하시면,<br> 하단에 이메일 계정을 알려드립니다.</p>
			            		<div class="form-group">
			            	    <input type="text" name="m_name" class="form-control form-control-inline text-center" placeholder="이름" value="">
			            	    <input type="text" name="m_tel" class="form-control form-control-inline text-center" placeholder="전화번호" value="">
			        	    </div>
			    	        <button type="submit" class="btn btn-primary" onClick="id_Search()">계정 찾기</button> <a href="/main.jsp" class="btn btn-default">취소</a>
			    	        <br>
			    	        <div id="checkResult">이 자리는 변경 자리</div><br>
							<% String m_email = (String)request.getAttribute("m_email"); %>
							${m_email }
				        </div>
				    </div>
				</div>
			</form>
		</div>
</body>
</html>