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
	function cdoLike(c_no) {
		location.href = "./commentLike?c_no=" + c_no + "&action=like";
	}

	function cdoDislike(c_no) {
		location.href = "./commentLike?c_no=" + c_no + "&action=dislike";
	}

	$(document).ready(function(){
		$("#report").click(function(){
			var result = confirm('글을 신고하시겠습니까?');
			if(result){
				
				var reason = prompt('신고사유를 입력해주세요', '');
				var b_no = '${list.b_no}';
				var m_email = '${sessionScope.m_email}';
				
				$.ajax({
					type : 'POST',
					url : './report',
					dataType : 'html',
					data : {"m_email" : m_email, "b_no": b_no, "rb_reason" : reason},
					success : function(){
						alert(reason);
					}
				});
			}
		});
	});

	function Cchange(c_no, c_content){
		var result2 = confirm('댓글을 수정하시겠습니까?');
		if(result2){
			var c_no = c_no;
			var content = prompt('변경 내용을 입력해주세요', c_content);
			
			if(content != null && content != ""){
				$.ajax({
				type : 'POST',
				url : './commentChange',
				dataType : 'html',
				data : {"c_no" : c_no,"c_content" : content, "action" : 'commentChange'},
				success : function(result){
					if(result == 1){
						alert('댓글수정이 완료되었습니다');
						location.reload();
					}else{
						alert('댓글수정 권한이 없습니다.');
						location.reload();
					}
				}
			});
			}else{
				alert('공백은 입력할 수 없습니다.');
			}
		}
	}

	function CDelete(c_no){
		var result2 = confirm('댓글을 삭제하시겠습니까?');
		if(result2){
			var c_no = c_no;
			
			$.ajax({
				type : 'POST',
				url : './commentChange',
				dataType : 'html',
				data : {"c_no" : c_no, "action" : 'commentDelete'},
				success : function(result){
					if(result == 1){
						alert('댓글수정이 완료되었습니다');
						location.reload();
					}else{
						alert('댓글수정 권한이 없습니다.');
						location.reload();
					}
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
						<img id="report" src="./img/report.png" height="20px">
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
					<td style="width:50%;">${i.c_content }</td>
					<td>
						<small>${i.c_date }</small>
					</td>
					<td style="width: 20%;"><small style="color: blue">${i.c_like }</small> / <small style="color: red">${i.c_dislike }</small>
						<img src="./img/like.png" height="20px" onclick="cdoLike(${i.c_no})">
						<c:choose>
							<c:when test="${sessionScope.m_email ne null}">
								<img src="./img/dislike.png" height="20px" onclick="cdoDislike(${i.c_no})">
							</c:when>
							<c:otherwise>
								<img src="./img/dislike.png" height="20px" onclick="needLogin()">
							</c:otherwise>
						</c:choose>
						<c:if test="${i.writerCheck == 1 }">
							<button type="button" class="btn btn-primary btn-sm Cchange" onclick="Cchange(${i.c_no}, '${i.c_content}')">수정</button>
							<button type="button" class="btn btn-danger btn-sm CDelete" onclick="CDelete(${i.c_no})">삭제</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<%@include file="./footer.jsp"%>
</body>
</html>