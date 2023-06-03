<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
<title>매수화면</title>
</head>
<style>

.Buy_container {
  display: flex;
  justify-content: center;
  padding-top: 1.5%;
  align-items: center;
  font-size: 24px;
}

.stockBuy {
  position: relative;
  transform: translateX(-50%);
  padding: 30px;
  background-color: #FFFFFF;
  border-radius: 15px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  width: 50vw;
  height: 45vh;
  left: 25%;
  margin: 0 auto;
}

.stockBuy p {
  margin: 10px 0;
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
  background: none;
  transition: border-bottom-color 0.3s;
  font-weight: bold;
}

.textForm input::placeholder {
  color: #adadad;
}

.textForm input:focus {
  border-bottom-color: #2ecc71;
}

.btn_div {
  text-align: center;
}

.btn {
  display: inline-block;
  text-align: center;
  margin: 10px;
  
}

.btn:hover {
  color: black;
  transition: 0.5s;
  transform: scale(1.2);
}

.error-message {
  padding-bottom: 20px;
  color: red;
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
<jsp:include page="/header"></jsp:include>
<div class="Buy_container">
<form method="post" action="/orderComplete" class="stockBuy">

<p>종목명 : ${itmsNm} </p>
<p>시장가 : <label for="orderPrice"><fmt:formatNumber value="${detail.mkp}" type="number"></fmt:formatNumber>원</label> </p>
<p>전일대비 : <span id="stockVariance">${detail.fltRt}% </span></p>
<p>변동가격 : <span id="stockRate"><fmt:formatNumber value="${detail.vs}" type="number"></fmt:formatNumber>원</span> </p><br>

		<div class="textForm">
		<span>주문가</span><input type="text" name="orderPrice" id="orderPrice" placeholder="원하시는 가격대를 적어주세요" autocomplete="off">
		<span>수량</span><input type="text" name="quantity" id="quantity" placeholder="수량을 입력해주세요" autocomplete="off">
			<input type="hidden" name="srtnCd" value="${srtnCd}">
			<input type="hidden" name="itmsNm" value="${itmsNm}">
			
		</div>
		<div class="btn_div">
		<div class="error-message"></div>
			<input type="submit" value="매수하기" class="btn btn-outline-success" id="buyButton">
			<button type="button" onclick="location.href='/stockDetail?itmsNm=${itmsNm}'" class="btn btn-outline-success">돌아가기</button>
		</div>
	</form>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function() {
    $("#buyButton").on("click", function(event) {
      var orderPrice = $("#orderPrice").val();
      var quantity = $("#quantity").val();

      if (orderPrice === "" || quantity === "") {
        $(".error-message").text("값을 입력해주세요.");
        event.preventDefault();
      } else if (!/^\d+$/.test(orderPrice) || !/^\d+$/.test(quantity)) {
        $(".error-message").text("숫자만 입력해주세요.");
        event.preventDefault(); 
      } else {
        $(".error-message").empty();
      }
    });
  });
  
  let scVs = "<c:out value='${detail.vs}'/>";
  let scFltRt = "<c:out value='${detail.fltRt}'/>";
  $("#stockVariance").css("color", scFltRt < 0 ? "blue" : (scFltRt > 0 ? "red" : ""));
  $("#stockRate").css("color", scVs < 0 ? "blue" : (scVs > 0 ? "red" : ""));
</script>
</body>
</html>