<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드립프트 Dripft - 게시글 등록</title>
<style type="text/css">
#main {
	margin: 0 auto;
}

#main input {
	width: 100%;
	margin-bottom: 10px;
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}

#main input {
	width: 100%;
	height: 30px;
}

#main textarea {
	width: 100%;
	height: 500px;
}

#btn {
	height: 50px;
	width: 150px;
	background-color: skyblue;
}
</style>
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
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
	<%@include file="./nav_main.jsp" %>
	<div id="main">
		<form action="/dangun/market/write.do" method="post">
			<input type="text" name="b_title">
			<textarea name="b_content" id="summernote"></textarea>

			<button id="btn" type="submit">글쓰기</button>
		</form>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#summernote').summernote({
				height : 400
			});
		});
	</script>
</body>
</html>