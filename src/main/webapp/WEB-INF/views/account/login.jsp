<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인페이지</title>
</head>
<body>
<form method="post" action="redirect:">
<table>
<tr>
	<td><input type="text" name="userid"></td>
	<td><input type="text" name="password"></td>
	<td><input type="submit" value="로그인"></td>
	<td><a href="/register">아직 회원가입을 하지 않으셨나요?</a></td>
</tr>
</table>
</form>
</body>
</html>