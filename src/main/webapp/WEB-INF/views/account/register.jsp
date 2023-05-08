<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>
<body>
<div>
	<form method="post" id="register">
		<table>
			<tr><td>아이디 : <input type="text" name="userid" id="userid">
						<input type="button" id="id_check" value="중복 확인"><span id="id_msg"></span></td></tr>
			<tr><td>비밀번호 : <input type="password" name="password" id="password"></td></tr>
			<tr><td>계좌번호 : <input type="text" name="accountid" id="accountid"></td></tr>
			<tr><td>전화번호 : <input type="text" name="phoneNumber" id="phoneNumber"></td></tr>
			<tr><td>이름 : <input type="text" name="userName" id="userName"></td></tr>
			<tr><td>이메일 : <input type="text" name="email" id="email"></td></tr>
			<tr><td>주소 : <input type="text" name="address" id="address">
						<input type="button" id="addbtn" value="우편번호 검색" onclick="addPost()"></td></tr>
			<tr><td><input type="submit" value="가입하기"></td></tr>
		</table>
	</form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function addPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            	document.querySelector("#address").value = data.address;
        }
    }).open();
}

$(function(){
	$("#id_check").click(function(){
		let userid = $("#userid").val();
		if(!userid){
			$("#id_msg").html("아이디를 입력하세요")
			return false;
		}
		$.ajax({url:"/", data:"userid="+userid, datatype:"text"}
		).done(function(data){
			
			if(data == ""){
				$("#id_msg").html("사용할 수 있는 아이디 입니다.");
				$("#id_msg").append("<input type='hidden' userid='id_ck' value='1'>");
			}else{
				$("#id_msg").html("이미 사용중인 아이디 입니다.");
			}
		})
	});
	
	$("#register").submit(function(){
		if($("#id_ck").val() != 1){
			$("#id_msg").html("아이디 중복 체크 하셔야 합니다..")
			return false;
		}
		if(!$("#password").val()){
			alert("비밀번호를 입력해야 합니다.");
			return false;
		}
	});
	
})//ready
</script>
</body>
</html>