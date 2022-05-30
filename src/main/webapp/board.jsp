<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
				<td><a href="./boardDetail?b_no=${i.b_no }">${i.b_title }</a></td>
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
	
	<button onclick="location.href='./boardlist?pageNo=1'">앞으로</button>
	<c:choose>
		<c:when test="${pageNo ne 1 }">
			<button onclick="location.href='./boardlist?pageNo=${pageNo - 1}'">1칸 왼쪽으로</button>
		</c:when>	
		<c:otherwise>
			<button disabled="disabled" onclick="location.href='./boardlist?pageNo=${pageNo - 1}'">1칸 왼쪽으로</button>
		</c:otherwise>
	</c:choose>
	
	<!-- 페이지 href 생성 -->
	<c:forEach begin="${startpage }" end="${endpage }" var="n">
		<a href="./boardlist?pageNo=${n }">${n }</a>
	</c:forEach>
	<c:choose>
		<c:when test="${pageNo ne totalpage }">
			<button onclick="location.href='./boardlist?pageNo=${pageNo + 1}'">1칸 오른쪽으로</button>
		</c:when>	
		<c:otherwise>
			<button disabled="disabled" onclick="location.href='./boardlist?pageNo=${pageNo + 1}'">1칸 오른쪽으로</button>
		</c:otherwise>
	</c:choose>
	<button onclick="location.href='./boardlist?pageNo=${totalpage }'">뒤로</button>

</body>
</html>