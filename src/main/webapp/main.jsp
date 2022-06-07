<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>드립프트 Dripft</title>
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
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<style type="text/css">
ul.tabs{
  margin: 0px;
  padding: 0px;
  list-style: none;
}
ul.tabs li{
  background: none;
  color: #222;
  display: inline-block;
  padding: 10px 25px;
  cursor: pointer;
}

ul.tabs li.current{
  background: #ededed;
  color: #222;
}

.tab-content{
  display: none;  
  padding: 15px 0;
  border-top:3px solid #eee;
}

.tab-content.current{
  display: inherit;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	   
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');
	 
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	 
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })
	 
	})
</script>
</head>

<body>
	<jsp:include page="nav_main.jsp"></jsp:include>
	<div class="container">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">인기게시글</li>
			<li class="tab-link" data-tab="tab-2">일반게시글</li>
			<li class="tab-link" data-tab="tab-3">공지사항</li>
		</ul>
		<div class="panel tab-content current" id = "tab-1">
			<table class="table table-primary table-hover"
				style="font-size: 12px; text-align: center; vertical-align: middle;">
				<tbody>
					<tr>
						<th width="10%">글번호</th>
						<th width="35%">제목</th>
						<th width="15%">작성자</th>
						<th width="20%">작성일자</th>
						<th width="10%">추천/비추천</th>
						<th width="10%">조회수</th>
					</tr>
					<c:forEach items="${bboard}" var="i">
						<tr>
							<td>${i.b_no}</td>
							<td><a href="./boardDetail?b_no=${i.b_no}">${i.b_title}</a><small
								style="color: green">[${i.totalcomments}]</small></td>
							<td>${i.m_nickname}</td>
							<td>${i.b_date}</td>
							<td>${i.b_like}/${i.b_dislike}</td>
							<td>${i.b_viewcount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="panel tab-content" id = "tab-2">
			<table class="table table-warning table-hover"
				style="font-size: 12px; text-align: center; vertical-align: middle;">
				<tbody>
					<tr>
						<th width="10%">글번호</th>
						<th width="35%">제목</th>
						<th width="15%">작성자</th>
						<th width="20%">작성일자</th>
						<th width="10%">추천/비추천</th>
						<th width="10%">조회수</th>
					</tr>
					<c:forEach items="${board}" var="i">
						<tr>
							<td>${i.b_no}</td>
							<td><a href="./boardDetail?b_no=${i.b_no}">${i.b_title}</a><small
								style="color: green">[${i.totalcomments}]</small></td>
							<td>${i.m_nickname}</td>
							<td>${i.b_date}</td>
							<td>${i.b_like}/${i.b_dislike}</td>
							<td>${i.b_viewcount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="panel tab-content" id = "tab-3">
			<table class="table table-dark table-hover"
				style="font-size: 12px; text-align: center; vertical-align: middle; color: white;">
				<tbody>
					<tr>
						<th width="10%">글번호</th>
						<th width="50%">제목</th>
						<th width="10%">작성자</th>
						<th width="20%">작성일자</th>
						<th width="10%">조회수</th>
					</tr>
					<c:forEach items="${notice}" var="i">
						<tr>
							<td>${i.n_no}</td>
							<td><a href="./noticeDetail?n_no=${i.n_no}">${i.n_title}</a></td>
							<td>${i.m_nickname}</td>
							<td>${i.n_date}</td>
							<td>${i.n_viewcount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<hr>
	<%@include file="./footer.jsp" %>
</body>
</html>