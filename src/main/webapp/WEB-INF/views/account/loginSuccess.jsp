<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
	<title>시큐리티 테스트</title>
</head>

<body>
	<h3><font color="red">로그인 인증을 성공하셨습니다.^^</font></h3>
	<h5><a href="/">INDEX 페이지로 이동</a></h5>
	<h5><a href="/member">Member 페이지로 이동</a></h5>
	<h5><a href="/manager">Manager 전용 페이지로 이동</a></h5>
	<h5><a href="/admin">Admin 전용 페이지로 이동</a></h5>	
</body>
</html>