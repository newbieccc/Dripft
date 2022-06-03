<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색목록</title>
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
	rel="stylesheet">
</head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<body>
	<jsp:include page="nav_main.jsp"></jsp:include>
	<div class="container">
	<div class="panel">
		<span class="badge bg-info text-dark" onclick=""></span>
	<table class="table table-primary table-hover"
		style="font-size: 12px; text-align: center; vertical-align: middle;">
		<tbody>
			<tr>
				<th width="10%">글번호</th>
				<th width="30%">제목</th>
				<th width="10%">작성자</th>
				<th width="20%">작성일자</th>
				<th width="10%">추천/비추천</th>
				<th width="10%">조회수</th>
				<th width="5%;">닉네임</th>
				<th width="5%">댓글수</th>
			</tr>
			<c:forEach items="${list}" var="i">
			
				<tr>
					<td>${i.b_no }</td>
					<td><a href="./boardDetail?b_no=${i.b_no }">${i.b_title }</a></td>
					<td>${i.b_date }</td>
					<td>${i.b_like }</td>
					<td>${i.b_dislike }</td>
					<td>${i.b_viewcount }</td>
					<td>${i.m_nickname }</td>
					<td>${i.totalcomments }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
</body>
</html>