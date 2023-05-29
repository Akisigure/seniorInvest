<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>임시 비밀번호</title>
</head>
<body>
<%@ page import="com.invest.user.controller.UserController" %>


<% UserController obj = new UserController();
   String temporaryPassword = obj.generateTemporaryPassword();
   %>

<p>임시비밀번호: ${temporaryPassword}</p>
<form method="post" action="/temPassword">
	<input type="hidden" name="email" value="${email}">
	<input type="submit" value="확인" class="btn">
	</form>
</body>

</html>