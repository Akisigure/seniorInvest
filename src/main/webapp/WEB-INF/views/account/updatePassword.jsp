<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
<title>비밀번호 수정</title>
<link rel="stylesheet" href="./css/updatePassword.css">
<link rel="stylesheet" href="./css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="./js/script.js"></script>
<!--  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script> -->
</head>
<body>
	<jsp:include page="../home/header.jsp"></jsp:include>

<p>비밀번호 변경</p>
	<form method="post" class="updateForm" action="/updatePassword">
	<div class="textForm">
        <input name="password" type="password" class="pw" placeholder="비밀번호" id="password">
        <span id="chkpw">6~15자리를 입력해주세요</span>	
        <div class="error">
        	<c:if test="${not empty passwordErrors}">
					<c:forEach items="${passwordErrors}" var="error">
						${error} 
					</c:forEach>
				</c:if>
        </div>
       	 
      </div>
       <div class="textForm">
         <input type="password" placeholder="비밀번호 확인" id="passwordCheck" class="pw" name="passwordCheck">
        	<span id="alert-clear" style="display: none;">비밀번호가 일치합니다.</span>
    		<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호를 확인해주세요</span>
      </div>
      
      <input type="submit" class="btn" value="확인"/>
      </form>
      
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		 $(".updateForm").submit(function() {
			 	var password = $("#password").val();
			 	var passwordCheck = $("#passwordCheck").val();
			 	
			 	if(!password){
			 		$(".error").html("비밀번호를 입력하세요.");
			 		return false;
			 	}		
			 	
			 	if(password.length < 6 || password.length > 15){
			 		$(".error").html("비밀번호는 6글자 이상, 15글자 이하여야 합니다.");
			 		return false;
			 		
			 	}
			 	
			 	if(password !== passwordCheck){
			 		$(".error").html("비밀번호가 일치하지 않습니다.");
			 		return false;
			 	}
		      });

	});
</script>
      
</body>
</html>