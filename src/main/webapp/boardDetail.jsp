<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href = "./boardChange?b_no=${list.b_no}">글수정</a>
	${list.b_no} ${list.b_title} ${list.b_content} ${list.b_date}
	${list.b_like} ${list.b_dislike} ${list.b_viewcount} ${list.m_nickname}
	${list.totalcomments}

	<table>
		<c:forEach items="${commentList}" var="i">
			<tr>
				<td>${i.c_content }</td>
				<td>${i.c_date }</td>
				<td>${i.c_like }</td>
				<td>${i.c_dislike }</td>
				<td>${i.m_nickname }</td>
			</tr>
		</c:forEach>
	</table>
		<a href = "./logout">로그아웃</a>
	<%= request.getParameter("error") %>
</body>
</html>