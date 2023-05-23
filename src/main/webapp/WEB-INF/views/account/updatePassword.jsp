<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 수정</title>
</head>
<body>
	
	<div class="textForm">
        <input name="password" type="password" class="pw" placeholder="비밀번호" id="password">
        <span id="chkpw">6~15자리를 입력해주세요</span>	
        <form:errors path="password" delimiter=" " class="error"/>
       	 
      </div>
       <div class="textForm">
         <input type="password" placeholder="비밀번호 확인" id="passwordCheck" class="pw" name="passwordCheck">
        	<span id="alert-clear" style="display: none;">비밀번호가 일치합니다.</span>
    		<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호를 확인해주세요</span>
      </div>
</body>
</html>