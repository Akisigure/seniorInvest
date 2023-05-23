<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 작성</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Custom script -->
<script src="/js/create_notice.js"></script>
</head>
<body>
	<h1>새 공지사항 작성</h1>
	<form id="notice-form">
		<label for="title">제목:</label><br> <input type="text" id="title"
			name="title"><br> <label for="content">내용:</label><br>
		<textarea id="content" name="content"></textarea>
		<br> <input type="submit" value="작성">
	</form>
</body>
</html>