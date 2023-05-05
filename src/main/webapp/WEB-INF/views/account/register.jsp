<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>
<body>
<div>
	<form method="post" action="insert">
		<table>
			<tr><td>아이디 : <input type="text" name="userid" id="userid"></td></tr>
			<tr><td>비밀번호 : <input type="password" name="password" id="password"></td></tr>
			<tr><td>계좌번호 : <input type="text" name="accountid" id="accountid"></td></tr>
			<tr><td>이름 : <input type="text" name="userName" id="userName"></td></tr>
			<tr><td>이메일 : <input type="text" name="email" id="email"></td></tr>
			<tr><td>주소 : <input type="text" name="address" id="address"></td></tr>
			<tr><td><input type="hidden" name="JoinedDate" id="JoinedDate"></td></tr>
			<tr><td><input type="submit" value="가입하기"></td></tr>
		</table>
	</form>
</div>
</body>
</html>