<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="./css/login.css">

    <head>
    <title>로그인</title>
    <link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
        <meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
    </head>
    <body>
    
	
            <header>
            <h2>로그인</h2>
        </header>

        <form  method="POST">

            <div class="input-box">
                <input id="userid" type="text" name="userid" placeholder="아이디" autocomplete="off">
                <label for="userid">아이디</label>
            </div>
            
            <c:if test="${param.error != null}">
 	<div id="error">
 		<p>아이디나 비밀번호가 잘못되었습니다.</p>
 	</div>
</c:if>

            <div class="input-box">
                <input id="password" type="password" name="password" placeholder="비밀번호" autocomplete="off">
                <label for="password">비밀번호</label>
            </div>
            <div class="href_box">
            <a class="a_reg" href="register">회원가입</a>
            <a class="a_pwd" href="findPassword">비밀번호 찾기</a>
            </div>
            <input type="submit" value="로그인" class="btn">

        </form>

</body>
</html>