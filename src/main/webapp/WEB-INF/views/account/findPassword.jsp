<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>비밀번호 찾기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<style>

* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.findPassword{
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

.email {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

#mail_ck{
	width : 120px;
	height : 40px;
	float : right;
	font-size : 18px;
	margin : -45px;
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

#ck_b  {
	width : 120px;
	height : 40px;
	float : right;
	font-size : 18px;
	margin : -45px;
}

.error{
	color:red;
}
</style>
</head>
<body>
<div>
<form:form method="POST" class="findPassword" id="findPassword" modelAttribute="findpassword">
	<h2>비밀번호 찾기</h2>
	<div class="textForm">
	<form:errors element="div"/>
	<input name="email" id="email" class="email" placeholder="이메일">
        <input type="button" id="mail_ck" value="메일 인증" class="btn btn-primary rounded-pill px-3"><span id="email_msg"></span>
         <form:errors path="email" delimiter=" " class="error" />
	</div>
	 <div class="textForm" style="display : none;" id="ck_form">
      		<div id="input" ><input id="ck_num" class="email" placeholder="인증번호 입력"> <input type="button" id="ck_b" value="인증 확인" class="btn btn-primary rounded-pill px-3"></div>
		<div id="result">
		</div>
      </div>
	<input type="submit" class="btn" value="확인">
</form:form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	
	$("#mail_ck").click(function(){
		let email = $("#email").val();
		if(!email){
			$("#email_msg").css("display","block").html("메일 주소를 입력하세요.");
			
			return false;
		}
		
		$.ajax({url:"/saveEmailCheck", data:"email="+email,datatype:"text"}
		).done(function(data){
			 $("#email_msg").html(data === "true" ? "사용할 수 있는 이메일 입니다." : "존재하지 않는 이메일 입니다.");
			 $("#email_msg").append("<input type='hidden' id='email_ck' value='" + (data === "true" ? "1" : "0") + "'>");
			if(data === "true"){
				$.ajax({
					url:"/send",
					data:"emailAddress="+email,
					dataType:"json"
				 }).done(function(data){
					 if(eval(data[1])){
						 num = data[0];
						 alert("메일전송완료. 인증번호를 입력해주세요.");
						 $("#input, #result, #ck_form").css("display", "block");
					 }
				 });
				}else{
					$("#email_msg").html("존재하지 않는 이메일 입니다.");
				}
			  });
			});
		
		$("#ck_b").click(function(){
			let ck_num = $("#ck_num").val();
			if(ck_num == num){
				
				$("#result").html("인증이 확인되었습니다.");
				$("#result").append("<input type='hidden' id='ck' value='1'>");
			} else {
				$("#result").html("인증에 실패했습니다. 다시 확인해주세요.");
			}
		});	
		
		$("#findPassword").submit(function() {
			  if ($("#email_ck").val() !== "1") {
			    $("#email_msg").html("이메일 인증을 하세요.");
			    return false;
			  }
			  if ($("#ck").val() !== "1") {
			    $("#result").html("인증 확인을 하세요.");
			    return false;
			  }
			});
})
</script>	
</body>
</html>