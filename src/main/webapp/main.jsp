<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>드립프트 Dripft</title>
<link rel="stylesheet" href="./css/bootstrap.css">
<script type="text/javascript" src="./js/common/jquery.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>
</head>

<body>
	<jsp:include page="nav_main.jsp"></jsp:include>
    <div class="container">
        <div>
            <div class="row" style="background-color: pink; width: 45%; display: -moz-grid-line;">
                <c:forEach items="${bboard}" var="i">
                    <table class = "table">
                        <tr>
                            <td>${i.b_no}</td>
                            <td>${i.b_title}</td>
                            <td>${i.b_date}</td>
                            <td>좋아요 = ${i.b_like}</td>
                            <td>${i.b_dislike}</td>
                            <td>${i.b_viewcount}</td>
                            <td>${i.m_nickname}</td>
                            <td>${i.totalcomments}</td>
                        </tr>
                    </table>
                </c:forEach>
            </div>
            <div class="row" style="background-color: limegreen; width: 45%;">
                <c:forEach items="${board}" var="i">
                    <table class = "table">
                        <tr>
                            <td>${i.b_no}</td>
                            <td>${i.b_title}</td>
                            <td>${i.b_date}</td>
                            <td>좋아요 = ${i.b_like}</td>
                            <td>${i.b_dislike}</td>
                            <td>${i.b_viewcount}</td>
                            <td>${i.m_nickname}</td>
                            <td>${i.totalcomments}</td>
                        </tr>
                    </table>
                </c:forEach>
            </div>
            <div class="row" style="background-color: blue; width: 45%;">
                <c:forEach items="${notice}" var="i">
                    <table class = "table">
                        <tr>
                            <td>${i.n_no}</td>
                            <td>${i.n_title}</td>
                            <td>${i.n_date}</td>
                            <td>좋아요 = ${i.n_viewcount}</td>
                            <td>${i.m_nickname}</td>
                        </tr>
                    </table>
                </c:forEach>
            </div>
        </div>
    </div>
    </body>
</html>