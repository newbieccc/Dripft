<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드립프트 Dripft - 회원 탈퇴</title>
<link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript" src="./js/common/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Brush+Script&display=swap"
	rel="stylesheet"><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
.content {
    width: 880px;
    min-height: 800px;
    margin: auto;
    margin-top: 100px;
}
.content-header {
    margin-top: 0;
    margin-bottom: 20px;
    color: #6f7275;
}
h3, .h3 {
    font-size: 24px;
}
h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
    font-family: inherit;
    font-weight: 500;
    line-height: 1.1;
}
* {
    box-sizing: border-box;
}
h3 {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
#create-user .panel {
    border: 0;
    border-radius: 3px !important;
    box-shadow: 0px 1px 3px rgba(0,0,0,0.05), 0px 2px 5px 1px rgba(0,0,0,0.05), 0px 0px 2px 0px rgba(0,0,0,0.2);
    padding: 4px;
}
.panel-margin-10 {
    margin-left: 10px;
    margin-right: 10px;
}
.panel {
    margin-bottom: 20px;
    background-color: #fff;
}
.panel-body-content {
    padding: 30px 50px;
}
.panel-body-content {
    padding: 30px 50px;
}
.text-center {
    text-align: center;
}
.clearfix:before, .clearfix:after, .dl-horizontal dd:before, .dl-horizontal dd:after, .container:before, .container:after, .container-fluid:before, .container-fluid:after, .row:before, .row:after, .form-horizontal .form-group:before, .form-horizontal .form-group:after, .btn-toolbar:before, .btn-toolbar:after, .btn-group-vertical > .btn-group:before, .btn-group-vertical > .btn-group:after, .nav:before, .nav:after, .navbar:before, .navbar:after, .navbar-header:before, .navbar-header:after, .navbar-collapse:before, .navbar-collapse:after, .pager:before, .pager:after, .panel-body:before, .panel-body:after, .modal-footer:before, .modal-footer:after {
    display: table;
    content: " ";
}
.lead {
    margin-bottom: 20px;
    font-weight: 300;
    line-height: 1.4;
}
p {
    margin: 0 0 10px;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.text-left {
    text-align: left;
}
ul, ol {
    margin-top: 0;
    margin-bottom: 10px;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
::marker {
    unicode-bidi: isolate;
    font-variant-numeric: tabular-nums;
    text-transform: none;
    text-indent: 0px !important;
    text-align: start !important;
    text-align-last: start !important;
}
b, strong {
    font-weight: bold;
}
a {
    color: #2a6496;
}
a {
    text-decoration: none;
}
a {
    background-color: transparent;
}
a:-webkit-any-link {
    cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="nav_main.jsp"></jsp:include>
<div id="create-user" class="content" role="main">
	<h3 class="content-header">회원 탈퇴</h3>
	    <div class="panel panel-default panel-margin-10">
	        <div class="panel-body panel-body-content text-center">
	            <p class="lead">회원 탈퇴시 아래의 조취가 취해 집니다.</p>
				<form name="delform" action="./deleteAccount" method="post">
		            <ul class="text-left">
		                <li>회원 탈퇴 일로부터 계정과 닉네임을 포함한 계정 정보(이메일/닉네임/전화번호)는 <strong>'개인 정보 보호 정책'에
		                따라 영구히 보관(잠김) 되며,</strong> 탈퇴한 계정은 더 이상 복구할 수 없게 됩니다.</li>
		                <li><strong>작성된 게시물은 삭제되지 않으며, 익명처리 후 Dripft로 소유권이 귀속됩니다.</strong></li>
		                <li><strong>게시물 삭제가 필요한 경우에는 관리자에게 문의해 주시기 바랍니다.</strong></li>
		            </ul>
					<a href="./userInfo" class="btn btn-default">아니오</a>
					<button type="submit" id="delBtn" class="btn btn-danger">예, 탈퇴하겠습니다.</button>
				</form>
        	</div>
    	</div>
	</div>
</body>
</html>