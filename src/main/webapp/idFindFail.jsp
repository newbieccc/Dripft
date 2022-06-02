<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
			<div class="col-sm-8 col-sm-offset-2">
			    <div class="panel panel-default panel-margin-10">
			        <div class="panel-body panel-body-content text-center" style="width: 600px;">
			        <br>
			            <p class="lead">해당 계정을 찾을 수 없습니다.</p>
			            	<p>다시 입력 하시려면 돌아가기 버튼을 눌러주세요.<br></p>
			            		<div class="form-group">
			        	    </div>
			    	        <button class="btn btn-primary" onclick="location.href='./idFind.jsp'">돌아가기</button> <a href="./main" class="btn btn-default">메인으로</a>
			    	        <br>
							<hr>
				        </div>
				    </div>
				</div>
			</form>
		</div>
</body>
</html>