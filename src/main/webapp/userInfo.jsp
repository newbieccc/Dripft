<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/userInfo.css"> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드립프트 Dripft - 회원정보 보기</title>
<link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script type="text/javascript" src="./js/common/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">


</script>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
	
<style type="text/css">
#delBtn {
	margin-left: 40px;
}
</style>

</head>
<script src="resources/js/bootstrap.js"></script>
<body>
  <%@include file="./nav_main.jsp" %>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<div class="container bootstrap snippets bootdey">
    <div class="row">
        <div class="main-content">
            
        	<div class="tab-content profile-page">
        		<!-- PROFILE TAB CONTENT -->
        		<div class="tab-pane profile active" id="profile-tab">
        			<div class="row">
        				<div class="col-md-3">
        					<div class="user-info-left">
        						<img class="img-responsive" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Profile Picture" width=300px;>
        						<h2>${userInfo.m_email }<br><i class="fa fa-circle green-font online-icon"></i><sup class="sr-only">online</sup></h2>
        						
        					</div>
        				</div>
        				<div class="col-md-8" >
        					<div class="user-info-right">
        						<div class="basic-info">
        							<h3 style = "font-size:5em;"><i class="fa fa-user activity-icon pull-left"></i>${userInfo.m_email }님의 정보</h3>
        							<p class="data-row">
        								<span class="data-name" style = "font-size:2em;">Email</span>
        								<span class="data-value" style = "font-size:2em;">${userInfo.m_email }</span>
        							</p>
        							<p class="data-row">
        							
        								<span class="data-name" style = "font-size:2em;">이름</span>
        								<span class="data-value" style = "font-size:2em;">${userInfo.m_name }</span>
        							</p>
        							<p class="data-row">
        							
        								<span class="data-name" style = "font-size:2em;">닉네임</span>
        								<span class="data-value" style = "font-size:2em;">${userInfo.m_nickname }</span>
        							</p>
        							<p class="data-row">
        							
        								<span class="data-name" style = "font-size:2em;">생년월일</span>
        								<span class="data-value" style = "font-size:2em;">${userInfo.m_birth }</span>
        							</p>
        							<p class="data-row">
        							
        								<span class="data-name" style = "font-size:2em;">성별</span>
        								<span class="data-value" style = "font-size:2em;">${userInfo.m_gender }</span>
        							</p>
        							<p class="data-row">
        							
        								<span class="data-name" style = "font-size:2em;">전화번호</span>
        								<span class="data-value" style = "font-size:2em;">${userInfo.m_tel }</span>
        							</p>
        							
        							<p class="data-row">
        							
        								<span class="data-name" style = "font-size:2em;">등급</span>
        								<span class="data-value" style = "font-size:2em;">${userInfo.m_authority }</span>
        							</p>
        							
        							<p class="data-row">
        							
        								<span class="data-name" style = "font-size:2em;">가입날짜</span>
        								<span class="data-value" style = "font-size:2em;">${userInfo.m_joindate }</span>
        							</p>
        							
        							
        						</div>
        						<button onclick = "location.href='./userUpdate'" id="joinBtn" class="btn btn-outline-success" style = "font-size:2em;">정보수정</button>
        						<button onclick = "location.href='./accountDel.jsp'" id="delBtn" class="btn btn-outline-danger" style = "font-size:2em;">회원탈퇴</button>
        						
        						
        					</div>
        				</div>
        			</div>
        		</div>
        		<!-- END PROFILE TAB CONTENT -->
        
        		
        		
        
        		 
  
  
  
  	
      <%-- 서버에서 오는 값 : ${userInfo } <br> --%>
      
   </div>
 </div> 
</body>
</html>