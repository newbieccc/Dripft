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
</head>
<body>
	<%@include file="./nav_main.jsp" %>	
	<table>
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
				<td><a href="./bestboardDetail?b_no=${i.b_no }">${i.b_title }</a></td>
				<td>${i.b_date }</td>
				<td>${i.b_like }</td>
				<td>${i.b_dislike }</td>
				<td>${i.b_viewcount }</td>
				<td>${i.m_nickname }</td>
				<td>${i.totalcomments }</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	pageNo = ${pageNo } <br> totalcount = ${totalcount }<br>
	totalpage = <fmt:parseNumber integerOnly="true" var="totalpage"	value="${totalcount / 10 }" />
			<c:if test="${(totalcount % 10) > 0 }">
				<c:set var="totalpage" value="${totalpage + 1}" />
			</c:if>
	변환된 : ${totalpage } <br>
	<hr>
	
	<!-- 페이지 시작,끝 번호 -->
	<c:if test="${pageNo % 10 ne 0 }">
		<fmt:parseNumber integerOnly="true" var="startpage" value="${pageNo / 10 }"/>
		<c:set var="startpage" value="${startpage * 10 + 1 }" />
	</c:if>
	<c:if test="${pageNo % 10 eq 0 }">
		<c:set var="startpage" value="${pageNo - 9 }" />
	</c:if>
	startpage : ${startpage } <br>
		
	<c:if test="${startpage + 10 gt totalpage }">
		<c:set var="endpage" value="${totalpage }" />
	</c:if>
	endpage : ${endpage }
	<hr>
	
	<button onclick="location.href='./bestBoardList?pageNo=1'">앞으로</button>
	<c:choose>
		<c:when test="${pageNo ne 1 }">
			<button onclick="location.href='./bestBoardList?pageNo=${pageNo - 1}'">1칸 왼쪽으로</button>
		</c:when>	
		<c:otherwise>
			<button disabled="disabled" onclick="location.href='./bestBoardList?pageNo=${pageNo - 1}'">1칸 왼쪽으로</button>
		</c:otherwise>
	</c:choose>
	
	<!-- 페이지 href 생성 -->
	<c:forEach begin="${startpage }" end="${endpage }" var="n">
		<a href="./bestBoardList?pageNo=${n }">${n }</a>
	</c:forEach>
	<c:choose>
		<c:when test="${pageNo ne totalpage }">
			<button onclick="location.href='./bestBoardList?pageNo=${pageNo + 1}'">1칸 오른쪽으로</button>
		</c:when>	
		<c:otherwise>
			<button disabled="disabled" onclick="location.href='./bestBoardList?pageNo=${pageNo + 1}'">1칸 오른쪽으로</button>
		</c:otherwise>
	</c:choose>
	<button onclick="location.href='./bestBoardList?pageNo=${totalpage }'">뒤로</button>

</body>
</html>