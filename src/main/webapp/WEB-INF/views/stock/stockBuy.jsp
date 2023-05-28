<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>매수화면</title>
</head>
<style>

.container {
	display: flex;
	justify-content: center;
}

 .stockBuy {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  padding: 30px;
  background-color: #FFFFFF;
  border-radius: 15px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  width: 50vw;
  height: 40vh;
}

.stockBuy p {
  margin: 10px 0;
  font-size: 17pt;
  font-weight: bold;
}

.textForm {
  margin-bottom: 25px;
}

.textForm input {
  margin-bottom: 15px;
  padding: 10px;
  width: 100%;
  border: none;
  border-bottom: 2px solid #adadad;
  outline: none;
  color: #636e72;
  font-size: 16px;
  background: none;
  transition: border-bottom-color 0.3s;
}

.textForm input::placeholder {
  color: #adadad;
}

.textForm input:focus {
  border-bottom-color: #2ecc71;
}

.btn {
  margin-top: 20px;
  font-size: 20px;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  color: white;
  background: linear-gradient(125deg, #2ecc71, #27ae60, #2ecc71);
  border-radius: 5px;
  border: none;
  cursor: pointer;
  transition: background 0.3s;
  	display: inline-block;
	width: 200px;
	height: 100px;
}

.btn:hover {
  background: linear-gradient(125deg, #27ae60, #2ecc71, #27ae60);
} 

	
</style>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="./css/style.css">
    <!--  Custom script -->
    <script src="./js/script.js"></script>
    <!-- Bootstrap Bundle-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<body>
<jsp:include page="../home/header.jsp"></jsp:include>
<div class="container">
<form method="post" action="/orderComplete" class="stockBuy">

<p>종목명 : ${itmsNm} </p>
<p>시장가 : <label for="orderPrice">${detail.mkp}</label> </p>
<p>전일대비 : ${detail.fltRt} </p>
<p>변동가격 : ${detail.vs} </p><br>

		<div class="textForm">
		<span>주문가</span><input type="text" name="orderPrice" id="orderPrice" placeholder="원하시는 가격대를 적어주세요">
		<span>수량</span><input type="text" name="quantity" id="quantity" placeholder="수량을 입력해주세요">
		<input type="hidden" name="srtnCd" value="${srtnCd}">
		<input type="hidden" name="itmsNm" value="${itmsNm}">
		</div>
		<input type="submit" value="매수하기" class="btn">
	</form>
	</div>
</body>
</html>