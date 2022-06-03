<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드립프트 Dripft - 공지사항 글</title>
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
	
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link	href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<!-- <script>
    document.title = "./noticeDetail?n_title=?";
</script> -->
<!-- <script>
	document.write ( '<p>' + document.title + '</p>' );
	document.title = './noticeDetail?n_title=?';
</script> -->
</head>

<body>
<%@include file="./nav_main.jsp" %>
	<div class="container">
		<div class="row g-2">
			<div class="col-6">
				<div class="p-3 border bg-light">
					제목 : ${dto.n_title}
					<c:if test="${writerCheck ==  1 }">
						<button type="button" class="btn btn-outline-primary" onclick="doBoardChange()">글수정</button>
						<button type="button" class="btn btn-outline-danger" onclick="doBoardDelete()">글삭제</button>
					</c:if>
				</div>
			</div>
			<div class="col-6">
				<div class="p-3 border bg-light">작성자 : ${dto.m_nickname}</div>
			</div>
			<div class="col-6">
				<div class="p-3 border bg-light">
					<small>조회수 ${dto.n_viewcount}</small>
				</div>
			</div>
			<div class="col-6">
				<div class="p-3 border bg-light">
					작성일 : ${dto.n_date} <small style="color : gray;">번호 : ${dto.n_no}</small>
				</div>
			</div>
			<div class = "border border-info">
			${dto.n_content}
			</div>
			
			</div>
		</div>
	<%@include file="./footer.jsp"%>
	
	
	
	


</body>
</html>