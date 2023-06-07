<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
<title>임시 비밀번호</title>
<link rel="stylesheet" href="./css/temPassword.css">
</head>
<body>
<%@ page import="com.invest.user.controller.UserController" %>


<% UserController obj = new UserController();
   String temporaryPassword = obj.generateTemporaryPassword();
   String userid = (String) request.getAttribute("userid");
%>
<div class="container">
<div id="tempwd">
<p>${users.userid}님의 임시비밀번호입니다.<br><br>${temporaryPassword}</p>
</div>
<form method="post" action="/temPassword">
	<input type="hidden" name="email" value="${email}">
	<div class="btn-container">
	<input type="submit" value="확인" class="btn">
	</div>
</form>
</div>
</body>
</html>