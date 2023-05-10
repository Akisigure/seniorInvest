<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
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
#id_check {
	width : 120px;
	height : 40px;
	float : right;
	font-size : 18px;
	margin : -37px;
	padding-left: -20px;
}
/* #id_msg {
	position:absolute;
	float : right;
	right : -220px;
	width : 190px;
	height : 20px;
	padding-left : 50px;
	padding-right: -40px;
} */

/* span {
	position : absolute;
	right : -220px;
	width : 190px;
	height : 20px;
} */

#check {
	position:absolute;
	float : right;

}
#accountType  {
	position:relative;
	float :	left;
}
#mail_ck  {
	width : 120px;
	height : 40px;
	float : right;
	font-size : 18px;
	margin : -45px;
}

#ck_b  {
	width : 120px;
	height : 40px;
	float : right;
	font-size : 18px;
	margin : -45px;
}


#addbtn {
	width : 120px;
	height : 40px;
	float : right;
	font-size : 15px;
	margin : -58px;
}

#chkpw {
	position: absolute;
	right : -180px;
	width : 200px;
	height : 20px;

}

#alert-danger {
	position: absolute;
		right : -180px;
	width : 190px;
	height : 20px;
	float : right;

}


.btn:hover {
  background-position: right;
}

.error{
	color:red;
}

</style>
<body>
<div>
	<form:form method="POST" class="joinForm" id="register" modelAttribute="users">
                                                                                               
      <h2>회원가입</h2>
      <div class="textForm">
      <form:errors element="div"/>
        <input name="userid" type="text" class="id" id="userid" placeholder="아이디"></input>
        <input type="button" id="id_check" value="중복 확인" class="btn btn-primary rounded-pill px-3"><span id="id_msg"></span>
        <form:errors path="userid" delimiter=" " class="error"/>
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
       	  <form:errors path="accountid" delimiter=" " class="error" />
      </div>
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
      <div class="textForm">
        <input name="userName" type="text" class="name" placeholder="이름" id="userName">
        <form:errors path="userName" delimiter=" " class="error"/>
      </div>
 
       <div class="textForm">
 		<input name="email" id="email" class="email" placeholder="이메일">
        <input type="button" id="mail_ck" value="메일 인증" class="btn btn-primary rounded-pill px-3"><span id="email_msg"></span>
        <form:errors path="email" delimiter=" " class="error" />
      </div>
      <div class="textForm" style="display : none;" id="ck_form">
      		<div id="input" ><input id="ck_num" class="email" placeholder="인증번호 입력"> <input type="button" id="ck_b" value="인증 확인" class="btn btn-primary rounded-pill px-3"></div>
		<div id="result">
		</div>
      </div>
      <div class="textForm">
        <input name="phoneNumber" type="text" class="cellphoneNo" placeholder="전화번호 -없이 입력" id="phoneNumber">
        <form:errors path="phoneNumber" delimiter=" " class="error" />
      </div>
        <div class="textForm">
        <input name="address" type="text" class="address" placeholder="주소" id="address" readonly></input>
         	<input name="addressDetail" type="text" class="address" placeholder="상세주소" id="addressDetail"></input>
        <input name="addressNumber" type="text" class="address" placeholder="우편번호" id="addressNumber" readonly></input>
        <input type="button" name="search" id="addbtn" value="우편번호 검색" onclick="addPost()" class="btn btn-primary rounded-pill px-3">
     	</div>
  

        

      <input type="submit" class="btn" value="회 원 가 입"/>
    </form:form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function addPost() {
    new daum.Postcode({
      oncomplete: function(data) {
          var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
          var extraRoadAddr = ''; // 도로명 조합형 주소 변수

          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
              extraRoadAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if(data.buildingName !== '' && data.apartment === 'Y'){
             extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if(extraRoadAddr !== ''){
              extraRoadAddr = ' (' + extraRoadAddr + ')';
          }
          // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
          if(fullRoadAddr !== ''){
              fullRoadAddr += extraRoadAddr;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          console.log(data.zonecode);
          console.log(fullRoadAddr);
          
          
          $("[name=addressNumber]").val(data.zonecode);
          $("[name=address]").val(fullRoadAddr);
          
          /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
          document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
          document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
      }
   }).open();
  }





$(function() {
	
	let idInput = document.querySelector('#userid');
	let idErrorMsg = document.querySelector('.error[id="userid.errors"]');

	idInput.addEventListener('input', () => {
		idErrorMsg.style.display = 'none';
	});
	
	let accountidInput = document.querySelector('#accountid');
	let accountidErrorMsg = document.querySelector('.error[id="accountid.errors"]');

	accountidInput.addEventListener('input', () => {
		accountidErrorMsg.style.display = 'none';
	});
	
	let pwInput = document.querySelector('#password');
	let pwErrorMsg = document.querySelector('.error[id="password.errors"]');

	pwInput.addEventListener('input', () => {
		pwErrorMsg.style.display = 'none';
	});
	
	let emailInput = document.querySelector('#email');
	let emailErrorMsg = document.querySelector('.error[id="email.errors"]');

	emailInput.addEventListener('input', () => {
	emailErrorMsg.style.display = 'none';
	});
	
	let usernameInput = document.querySelector('#userName');
	let usernameErrorMsg = document.querySelector('.error[id="userName.errors"]');

	usernameInput.addEventListener('input', () => {
	usernameErrorMsg.style.display = 'none';
	});
	
	let phoneNumberInput = document.querySelector('#phoneNumber');
	let phoneNumberErrorMsg = document.querySelector('.error[id="phoneNumber.errors"]');

	phoneNumberInput.addEventListener('input', () => {
	phoneNumberErrorMsg.style.display = 'none';
	});



	let num ="";


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
			  $("#email_msg").css("display","block").html("메일 주소를 입력하세요");
		  	
			  return false;
		  }
		  
		  $.ajax({url:"/emailCheck", data:"email="+email,datatype:"text"}
	      ).done(function(data) {

	        if(data == ""){
	          $("#email_msg").html("사용할 수 있는 이메일 입니다.");
	          $("#email_msg").append("<input type='hidden' id='email_ck' value='1'>");
	          
	          $.ajax({url:"/send",
	        		data:"emailAddress="+email,
	        		dataType:"json"
	        	 }
	        	 ).done(function(data){
	        		if(eval(data[1])){
	        			num = data[0];
	        			alert("메일전송완료. 인증번호를 입력해주세요.")
	        			$("#input,#result,#ck_form").css("display","block");
	        		}
	        	 });//ajax
	        	 	$("#ck_b").click(function(){
	        	 		let ck_num = $("#ck_num").val();
	        	 		if(ck_num == num) {
	        	 			$("#result").html("인증이 확인되었습니다.")
	        	 			$("#result").append("<input type='hidden' id='ck' value='1'>");
	        	 		}else {
	        	 			$("#result").html("인증에 실패했습니다. 다시확인해주세요.");
	        	 		}
	        	 	})
	          
	        }else {
	          $("#email_msg").html("이미 사용중인 이메일 입니다.");
	        }
	      })//이메일 중복 확인 click
	    });
		  
	  
	      $('.pw').focusout(function () {
        var pwd1 = $("#password").val();
        var pwd2 = $("#passwordCheck").val();
  
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                $("#alert-clear").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
    }); //비밀번호 확인 스크립트 
		  
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