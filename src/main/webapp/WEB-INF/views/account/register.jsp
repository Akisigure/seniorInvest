<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html> 
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<link rel="stylesheet" href="./css/register.css">
<body>
<div>
	<form:form method="POST" class="joinForm" id="register" modelAttribute="users">
                                                                                               
      <h2>회원가입</h2>
      <div class="textForm">
      <form:errors element="div"/>
        <input name="userid" type="text" class="id" id="userid" placeholder="아이디" autocomplete="off"></input>
        <input type="button" id="id_check" value="중복 확인" class="btn btn-primary rounded-pill px-3"><span id="id_msg"></span>
        <form:errors path="userid" delimiter=" " class="error"/>
      </div>

<div class="textForm">
    <input name="password" type="password" class="pw" placeholder="비밀번호" id="password" autocomplete="off">
    <span id="chkpw">6~15자리를 입력해주세요</span>
    <c:choose>
        <c:when test="${status.error && status.errorMessages.contains('NotEmpty') && status.errorMessages.contains('Length')}">
        </c:when>
        <c:otherwise>
            <form:errors path="password" delimiter="<br>" class="error"/>
        </c:otherwise>
    </c:choose>
</div>

       <div class="textForm">
         <input type="password" placeholder="비밀번호 확인" id="passwordCheck" class="pw" name="passwordCheck" autocomplete="off">
        	<span id="alert-clear" style="display: none;">비밀번호가 일치합니다.</span>
    		<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호를 확인해주세요</span>
      </div>
      <div class="textForm">
        <input name="userName" type="text" class="name" placeholder="이름" id="userName" autocomplete="off">
        <form:errors path="userName" delimiter=" " class="error"/>
      </div>
 
       <div class="textForm">
 		<input name="email" id="email" class="email" placeholder="이메일" autocomplete="off">
        <input type="button" id="mail_ck" value="메일 인증" class="btn btn-primary rounded-pill px-3"><span id="email_msg"></span>
        <form:errors path="email" delimiter=" " class="error" />
      </div>
      <div class="textForm" style="display : none;" id="ck_form">
      		<div id="input" ><input id="ck_num" class="email" placeholder="인증번호 입력" autocomplete="off"> <input type="button" id="ck_b" value="인증 확인" class="btn btn-primary rounded-pill px-3"></div>
		<div id="result">
		</div>
      </div>
      <div class="textForm">
        <input name="phoneNumber" type="text" class="cellphoneNo" placeholder="핸드폰번호 -없이 입력" id="phoneNumber" autocomplete="off">
        <form:errors path="phoneNumber" delimiter=" " class="error" />
      </div>
        <div class="textForm">
        <input name="address" type="text" class="address" placeholder="주소" id="address" readonly></input>
         	<input name="addressDetail" type="text" class="address" placeholder="상세주소" id="addressDetail" autocomplete="off"></input>
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
	  
	  $("#phoneNumber").on("input", function() {
	      // 핸드폰 번호 입력값 체크
	      let phoneNumber = $(this).val();
	      if (!/^[0-9]*$/.test(phoneNumber)) {
	        alert("핸드폰 번호는 숫자만 입력 가능합니다.");
	        $(this).val("");
	      }
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