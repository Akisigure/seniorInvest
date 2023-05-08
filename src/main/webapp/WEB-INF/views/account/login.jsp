<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<style>
           header{
                display:flex;
                justify-content: center;
            }
            form{
                padding:10px;
            }
            .input-box{
                position:relative;
                margin:10px 0;
                text-align: center;
            }
            .input-box > input{
                background:transparent;
                border:none;
                border-bottom: solid 1px #ccc;
                padding:20px 0px 5px 0px;
                font-size:14pt;
                width:50%;
            }
            input::placeholder{
                color:transparent;
                
            }
            input:placeholder-shown + label{
                color:#aaa;
                font-size:14pt;
                top:15px;
				position: absolute;
    			left: 30%;
    			transform: translateX(-100%);
    			text-align: center;
            }
            input:focus + label, label{
                color:#8aa1a1;
                font-size:10pt;
                pointer-events: none;
                position: absolute;
                left:480px;
                top:10px;
                transition: all 0.2s ease ;
                -webkit-transition: all 0.2s ease;
                -moz-transition: all 0.2s ease;
                -o-transition: all 0.2s ease;
                text-align: center;
            }

            input:focus, input:not(:placeholder-shown){
                border-bottom: solid 1px #8aa1a1;
                outline:none;
            }
            input[type=submit]{
                background: linear-gradient(125deg, #2ecc71, #27ae60, #2ecc71);
                border:none;
                color:white;
                border-radius: 5px;
                width:50%;
                height:35px;
                font-size: 14pt;
                margin:100px auto 0;
                display:block;
            }
            a{
              font-size: 16pt;
              color:black;
              margin:10px 0px;
              text-decoration: none;
              display: block;
              text-align: center;
            }
</style>

    <head>
        <meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
    </head>
    <body>
    
<c:if test="${param.error != null}">
  <script>
    alert("로그인에 실패하였습니다. 다시 시도해주세요.");
  </script>
</c:if>
            <header>
            <h2>로그인</h2>
        </header>

        <form action="" method="POST">


            <div class="input-box">
                <input id="userid" type="text" name="userid" placeholder="아이디">
                <label for="userid">아이디</label>
            </div>

            <div class="input-box">
                <input id="password" type="password" name="password" placeholder="비밀번호">
                <label for="password">비밀번호</label>
            </div>
            <a href="insert">회원가입</a>
            <a href="pwdSearch">비밀번호 찾기</a>
            <input type="submit" value="로그인">

        </form>

</body>
</html>