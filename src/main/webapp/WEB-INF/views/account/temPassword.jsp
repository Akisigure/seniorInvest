<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>�ӽ� ��й�ȣ</title>
</head>
<body>
<%@ page import="com.invest.user.controller.UserController" %>


<% UserController obj = new UserController();
   String temporaryPassword = obj.generateTemporaryPassword();%>

<p>�ӽú�й�ȣ: ${temporaryPassword}</p>

 <form  method="POST">

            <div class="input-box">
                <input id="userid" type="text" name="userid" placeholder="���̵�">
                <label for="userid">���̵�</label>
            </div>
            
            <c:if test="${param.error != null}">
 	<div id="error">
 		<p>���̵� ��й�ȣ�� �߸��Ǿ����ϴ�.</p>
 	</div>
</c:if>

            <div class="input-box">
                <input id="password" type="password" name="password" placeholder="��й�ȣ">
                <label for="password">��й�ȣ</label>
            </div>
            <input type="submit" value="�α���" class="btn">

        </form>
</body>
</html>