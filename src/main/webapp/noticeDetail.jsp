<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드립프트 Dripft - 공지사항 글</title>
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
	<div>
	작성자 : ${dto.m_nickname}<br>
	제목 : ${dto.n_title}<br>
	내용 : ${dto.n_content}<br>
	날짜 : ${dto.n_date}<br>
	
	</div>

</body>
</html>