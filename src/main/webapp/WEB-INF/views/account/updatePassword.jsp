<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ����</title>
</head>
<body>
	
	<div class="textForm">
        <input name="password" type="password" class="pw" placeholder="��й�ȣ" id="password">
        <span id="chkpw">6~15�ڸ��� �Է����ּ���</span>	
        <form:errors path="password" delimiter=" " class="error"/>
       	 
      </div>
       <div class="textForm">
         <input type="password" placeholder="��й�ȣ Ȯ��" id="passwordCheck" class="pw" name="passwordCheck">
        	<span id="alert-clear" style="display: none;">��й�ȣ�� ��ġ�մϴ�.</span>
    		<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">��й�ȣ�� Ȯ�����ּ���</span>
      </div>
</body>
</html>