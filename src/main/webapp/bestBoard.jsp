<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드립프트 Dripft - 인기 게시판</title>
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

<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<style type="text/css">
table {
	text-align: center;
}
td {
	
}.text-center {
    text-align: center;
    font-size: 17px;
}
* {
    box-sizing: border-box;
}
div {
    display: block;
}
.pagination {
    margin: 0 auto;
}
.pagination {
    display: inline-block;
    padding-left: 0;
    margin: 20px 0;
    border-radius: 4px;
    justify-content: center;
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
.pagination > li {
    display: inline;
}
.pagination-sm > li:first-child > a, .pagination-sm > li:first-child > span {
    border-top-left-radius: 3px;
    border-bottom-left-radius: 3px;
}
.pagination > li:first-child > a, .pagination > li:first-child > span {
    margin-left: 0;
}
.pagination-sm > li > a, .pagination-sm > li > span {
    padding: 5px 10px;
    font-size: 12px;
}
.pagination > li > a, .pagination > li > span {
    position: relative;
    float: left;
    line-height: 1.42857143;
    color: #337ab7;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid #ddd;
}
a:-webkit-any-link, {
    cursor: pointer;
}
button {
    position: relative;
    float: left;
    line-height: 1.42857143;
    color: #337ab7;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid #ddd;
}
.pageNow {
    z-index: 2;
    color: #fff;
    cursor: default;
    background-color: #337ab7;
    border-color: #337ab7;
}
</style>
</head>
<body>
	<%@include file="./nav_main.jsp" %>
	<div style="width: 800px; height: 100%; margin: 0 auto;">
	<span class="badge bg-info text-dark" onclick="">인기게시글</span>
	<table class="table table-primary table-hover"
				style="font-size: 12px; vertical-align: middle;">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일자</th>
			<th>추천</th>
			<th>비추</th>
			<th>조회수</th>
			<th>닉네임</th>
			<th>댓글수</th>			
		</tr>
		<c:forEach items="${list }" var="i">
			<tr>
				<td>${i.b_no }</td>
				<td><a href="./boardDetail?b_no=${i.b_no }">${i.b_title }</a><small
								style="color: green">[${i.totalcomments}]</small></td>
				<td>${i.b_date }</td>
				<td>${i.b_like }</td>
				<td>${i.b_dislike }</td>
				<td>${i.b_viewcount }</td>
				<td>${i.m_nickname }</td>
				<td>${i.totalcomments }</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<%-- pageNo = ${pageNo } <br> totalcount = ${totalcount }<br> --%>
	<!-- totalpage = --> <fmt:parseNumber integerOnly="true" var="totalpage"	value="${totalcount / 10 }" />
			<c:if test="${(totalcount % 10) > 0 }">
				<c:set var="totalpage" value="${totalpage + 1}" />
			</c:if>
	<%-- 변환된 : ${totalpage } --%> <br>
	
	
	<!-- 페이지 시작,끝 번호 버튼 선언 -->
	<c:if test="${pageNo % 10 ne 0 }">
		<fmt:parseNumber integerOnly="true" var="startpage" value="${pageNo / 10 }"/>
		<c:set var="startpage" value="${startpage * 10 + 1 }" />
	</c:if>
	<c:if test="${pageNo % 10 eq 0 }">
		<c:set var="startpage" value="${pageNo - 9 }" />
	</c:if>
	<%-- startpage : ${startpage } --%> <br>
	<c:set var="endpage" value="${startpage + 9 }" />
	<c:if test="${startpage + 10 gt totalpage }">
		<c:set var="endpage" value="${totalpage }" />
	</c:if>
	<%-- endpage : ${endpage } --%>
	
	
	<div class="text-center">
		<ul class="pagination pagination-sm">
			<li class="prev">
				<button onclick="location.href='./bestBoardList?pageNo=1'" style="float: left;">&lt;&lt;</button>
				<c:choose>
					<c:when test="${pageNo ne 1 }">
						<li>
						<button onclick="location.href='./bestBoardList?pageNo=${pageNo - 1}'" style="float: left;">&lt;</button>
						</li>
					</c:when>	
					<c:otherwise>
						<li>
						<button disabled="disabled" onclick="location.href='./bestBoardList?pageNo=${pageNo - 1}'" style="float: left;">&lt;</button>
						</li>
					</c:otherwise>
				</c:choose>
				
				<!-- 페이지 href 생성 -->
				<c:forEach begin="${startpage }" end="${endpage }" var="n">
					<c:choose>
						<c:when test="${pageNo eq n}">
							<li class="pageNow" style="float: left;">
								<a href="./bestBoardList?pageNo=${n }" class="pageNow" style="background-color: #337ab7; z-index: 2; color: #fff;">${n }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li style="float: left;"><a href="./bestBoardList?pageNo=${n }">${n }</a></li>
						</c:otherwise>
					</c:choose>

				</c:forEach>
				<c:choose>
					<c:when test="${pageNo ne totalpage }">
						<li>
						<button onclick="location.href='./bestBoardList?pageNo=${pageNo + 1}'" style="float: left;">&gt;</button>
						</li>
					</c:when>	
					<c:otherwise>
						<li>
						<button disabled="disabled" onclick="location.href='./bestBoardList?pageNo=${pageNo + 1}'" style="float: left;">&gt;</button>
						</li>
					</c:otherwise>
				</c:choose>
				<li>
				<button onclick="location.href='./bestBoardList?pageNo=${totalpage }'" style="float: left;">&gt;&gt;</button>
			</li>
		</ul>
	</div>
	<hr>
<%@include file="./footer.jsp" %>
</body>
</html>