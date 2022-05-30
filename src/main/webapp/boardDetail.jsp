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
	<a href="./boardChange?b_no=${list.b_no}&del=0">글수정</a>
	<a href="./boardChange?b_no=${list.b_no}&del=1">글삭제</a>
	<a href="./boardLike?b_no=${list.b_no}&action=like">좋아요</a>
	<a href="./boardLike?b_no=${list.b_no}&action=dislike">싫어요</a> 
	${list.b_no}
	${list.b_title} ${list.b_content} ${list.b_date} ${list.b_like}
	${list.b_dislike} ${list.b_viewcount} ${list.m_nickname}
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
	<form action="./commentWrite" method="post">
		<input type="text" name="c_content">
		<input type = "hidden" name = "b_no" value="${list.b_no}">
		<button type="submit">댓글쓰기</button>
	</form>
	<a href="./logout">로그아웃</a>
	<%= request.getParameter("error") %>
</body>
</html>