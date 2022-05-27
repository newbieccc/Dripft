<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
		
	
	<h1>공지사항</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>		
			<th>조회</th>		
		</tr>
		
		<c:forEach items="${list }" var="i">
		<tr>
			<td>${i.n_no }</td>
			<td><a href="./noticeDetail?n_no=${i.n_no }">${i.n_title }</a></td>
			<td>${i.m_nickname }</td>
			<td>${i.n_date }</td>
			<td>${i.n_viewcount }</td>
		</tr>
		</c:forEach>
	</table>
	<hr>
	pageNo = ${pageNo } <br> totalcount = ${totalcount }<br>
	totalpage = <fmt:parseNumber integerOnly="true" var="totalpage"	value="${totalcount / 10 }" />
			<c:if test="${(totalcount % 10) > 0 }">
				<c:set var="totalpage" value="${totalpage + 1}" />
			</c:if>
	변환된 : ${totalpage }
	<hr>
	

</body>
</html>