<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>
<style>
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image:#34495e;
}

#input , #result{ display: none;}

.joinForm {
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

.joinForm h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.name {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
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

.nickname {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.cellphoneNo {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.accountid {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
  position: relative;
}



optgroup option {
 border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.address {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}
#id_check  {
	position:absolute;
	float : right;

}
#id_msg {
	position:absolute;
	float : right;
}

span {
	position : absolute;
	right : -220px;
	width : 190px;
	height : 20px;
}



.btn:hover {
  background-position: right;
}

</style>
<body>
<div>
	<form  method="POST" class="joinForm" id="register">
                                                                                               
      <h2>회원가입</h2>
      <div class="textForm">
        <input name="userid" type="text" class="id" id="userid" placeholder="아이디"></input>
        <input type="button" id="id_check" value="중복 확인"><span id="id_msg"></span>
      </div>
      <div class="textForm">
      <select id="accountType" name="accountType">
		<optgroup class="bank" label="은행 선택">
			<option value = "국민은행">국민은행</option>
			<option value = "농협은행">농협은행</option>
			<option value = "신한은행">신한은행</option>
			<option value = "우리은행">우리은행</option>
			<option value = "하나은행">하나은행</option>
			<option value = "수협은행">수협은행</option>
			<option value = "토스뱅크">토스뱅크</option>
			<option value = "카카오뱅크">카카오뱅크</option>
			</optgroup>
		</select>
       	 <input name="accountid" type="text" class="accountid" id="accountid" placeholder="계좌번호 -없이 입력"></input>
      </div>
      <div class="textForm">
        <input name="password" type="password" class="pw" placeholder="비밀번호" id="password">
      </div>
       <div class="textForm">
        <input name="password" type="password" class="pw" placeholder="비밀번호 확인" id="password">
      </div>
      <div class="textForm">
        <input name="userName" type="text" class="name" placeholder="이름">
      </div>
 
       <div class="textForm">
 		<input name="email" id="email" class="email" placeholder="이메일">
        <input type="button" id="mail_ck" value="메일 인증">
		<div id="input"><input id="ck_num"> <input type="button" id="ck_b" value="인증 확인"></div>
		<div id="result">
		</div>
      </div>
      <div class="textForm">
        <input name="phoneNumber" type="text" class="cellphoneNo" placeholder="전화번호">
      </div>
        <div class="textForm">
        <input name="address" type="text" class="address" placeholder="주소" id="address"></input>
         	<input name="addressDetail" type="text" class="address" placeholder="상세주소" id="addressDetail"></input>
        <input name="addressNumber" type="text" class="address" placeholder="우편번호" id="addressNumber"></input>
        <input type="button" name="addressNumber" id="addbtn" value="우편번호 검색" onclick="addPost()">
     
      </div>

        

      <input type="submit" class="btn" value="회 원 가 입"/>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function addPost() {
	  new daum.Postcode({
	    oncomplete: function(data) {
	      document.querySelector("#address").value = data.address;
	      alert("나머지 주소도 입력하세요.");
	    }
	  }).open();
	}

	let num ="";

	$(function() {
	  $("#id_check").click(function() {
	    let userid = $("#userid").val();
	      if(!userid) {
	        $("#id_msg").html("아이디를 입력하세요")
	        return false;
	      }
	      $.ajax({url:"/idCheck", data:"userid="+userid,datatype:"text"}
	      ).done(function(data) {

	        if(data == ""){
	          $("#id_msg").html("사용할 수 있는 id입니다.");
	          $("#id_msg").append("<input type='hidden' id='id_ck' value='1'>");
	        }else {
	          $("#id_msg").html("이미 사용중인 id 입니다.");
	        }
	      })//아이디 중복 확인 click
	    });
	  
	  $("#mail_ck").click(function() {
		  let email = $("#email").val();
		  if(!email) {
			  $("#result").css("display","block").html("메일 주소 입력하세요");
		  	
			  return false;
		  }
		 $.ajax({url:"/send",
			data:"emailAddress="+email,
			dataType:"json"
		 }
		 ).done(function(data){
			if(eval(data[1])){
				num = data[0];
				alert("메일전송완료. 인증번호를 입력해주세요.")
				$("#input,#result").css("display","block");
			}
		 });//ajax
		 	$("#ck_b").click(function(){
		 		let ck_num = $("#ck_num").val();
		 		if(ck_num == num) {
		 			$("#result").html("인증이 확인됨.")
		 			$("#result").append("<input type='hidden' id='ck' value='1'>");
		 		}else {
		 			$("#result").html("인증에 실패했습니다. 다시확인해주세요.");
		 		}
		 	})
		  
	  })
		  
	      $("#joinform").submit(function() {
	        if($("#id_ck").val() != 1) {
	          $("#id_msg").html("아이디 중복체크를 해주세요.");
	            return false;
	        }
	        if(!$("#password").val()) {
	          alert("비밀번호를 입력하셔야 합니다.");
	          return false;
	        }
	      });
	}) //ready

</script>
</body>
</html>