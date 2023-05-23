<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
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
   String temporaryPassword = obj.generateTemporaryPassword();%>

<p>임시비밀번호: ${temporaryPassword}</p>

 <form  method="POST">

            <div class="input-box">
                <input id="userid" type="text" name="userid" placeholder="아이디">
                <label for="userid">아이디</label>
            </div>
            
            <c:if test="${param.error != null}">
 	<div id="error">
 		<p>아이디나 비밀번호가 잘못되었습니다.</p>
 	</div>
</c:if>

            <div class="input-box">
                <input id="password" type="password" name="password" placeholder="비밀번호">
                <label for="password">비밀번호</label>
            </div>
            <input type="submit" value="로그인" class="btn">

        </form>
</body>
</html>