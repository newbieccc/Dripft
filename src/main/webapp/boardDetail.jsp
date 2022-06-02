<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드립프트 Dripft - 게시글</title>
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<!-- <script>
    document.title = "./boardDetail?b_title=?";
</script> -->
<!-- <script>
	document.write ( '<p>' + document.title + '</p>' );
	document.title = './boardDetail?b_title=?';
</script> -->
<script type="text/javascript">
	function needLogin() {

		alert("로그인페이지로 이동합니다.");
		location.href = "./login.jsp";
	}

	function doLike() {

		location.href = "./boardLike?b_no=${list.b_no}&action=like";
	}

	function doDislike() {
		location.href = "./boardLike?b_no=${list.b_no}&action=dislike";
	}
	
	function doBoardChange(){
		
		location.href = "./boardChange?b_no=${list.b_no}&del=0";
	}
	
	function doBoardDelete() {
		
		var result = confirm('글을 삭제하시겠습니까?');
		
		if(result){
			location.href = "./boardChange?b_no=${list.b_no}&del=1";			
		}
		
	}
	
	function report(){
		var result = confirm('글을 신고하시겠습니까?');
		if(result){
			
			var reason = prompt("신고사유를 입력해주세요");

			$.ajax({
				type:'post',
				url : './report',
				dataType : 'text',
				data : "reason=" + reason,
				success : function(reason){
        			alert(reason);
        		} 
			});
		}
	}
</script>
</head>
<body>
	<%@include file="./nav_main.jsp"%>
	<div class="container">
		<div class="row g-2">
			<div class="col-6">
				<div class="p-3 border bg-light">
					제목 : ${list.b_title}<small style="color: green">
						[${list.totalcomments}]</small>
						<img alt="" src="./img/report.png" height="20px" onclick="report()">
					<c:if test="${writerCheck ==  1 }">
						<button type="button" class="btn btn-outline-primary" onclick="doBoardChange()">글수정</button>
						<button type="button" class="btn btn-outline-danger" onclick="doBoardDelete()">글삭제</button>
					</c:if>
				</div>
			</div>
			<div class="col-6">
				<div class="p-3 border bg-light">작성자 : ${list.m_nickname}</div>
			</div>
			<div class="col-6">
				<div class="p-3 border bg-light">
					<small>조회수 ${list.b_viewcount}</small>
				</div>
			</div>
			<div class="col-6">
				<div class="p-3 border bg-light">
					작성일 : ${list.b_date} <small style="color : gray;">번호 : ${list.b_no}</small>
				</div>
			</div>
			<div class="col-6">
				<div class="p-3 border bg-light">추천/비추천 
					<small style="color: blue">${list.b_like }</small> / <small
						style="color: red">${list.b_dislike }</small> <img
						src="./img/like.png" height="30px" onclick="doLike()">
					<c:choose>
						<c:when test="${sessionScope.m_email ne null}">
							<img src="./img/dislike.png" height="30px" onclick="doDislike()">
						</c:when>
						<c:otherwise>
							<img src="./img/dislike.png" height="30px" onclick="needLogin()">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="border border-info">
		${list.b_content}
		</div>

		<form action="./commentWrite" method="post">
			<hr color="gray">
			<div class="input-group mb-3">
				<input type="hidden" name="b_no" value="${list.b_no}"> <input
					type="text" class="form-control" aria-describedby="button-addon2"
					name="c_content">
				<button class="btn btn-outline-secondary" id="button-addon2"
					type="submit">댓글쓰기</button>
			</div>
		</form>
		<table class="table">
			<c:forEach items="${commentList}" var="i">
				<tr>
					<td><img src="./img/user_smile.png" height="30px">${i.m_nickname }</td>
					<td>${i.c_content }</td>
					<td>${i.c_date }</td>
					<td><small style="color: blue">${i.c_like }</small> / <small
						style="color: red">${i.c_dislike }</small></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<%@include file="./footer.jsp"%>
</body>
</html>