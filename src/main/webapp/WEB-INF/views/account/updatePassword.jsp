<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>비밀번호 수정</title>
</head>
<style>
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

.updateForm{
  position:absolute;
  width:400px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.textForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.pw{
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

#chkpw{
	position: absolute;
	right : -180px;
	width : 200px;
	height : 20px;
}

.btn{
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg, #2ecc71, #27ae60, #2ecc71);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
   font-size: 24px;
}
.error{
	color: #d92742;
	font-weight: bold;
}

</style>
<body>
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