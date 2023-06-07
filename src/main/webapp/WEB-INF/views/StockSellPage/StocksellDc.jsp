<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매도 결정 페이지</title>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
<link rel="stylesheet" href="css/StocksellDcN.css">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link rel="stylesheet" href="/css/header.css">
<!--  Custom script -->
<script src="/js/script.js"></script>
<!-- Bootstrap Bundle-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body>
	<header class="sticky-top">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="/"> <img src="./img/logo1.png"></a> 
				<a href="updatepw">비밀번호 수정</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span></button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="news">뉴스</a></li>
						<li class="nav-item"><a class="nav-link" href="disclosure">공시</a></li>
						<li class="nav-item"><a class="nav-link" href="notices">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="intstock">관심종목</a></li>
						<li class="nav-item"><a class="nav-link" href="Mypage">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="qa">Q&A</a></li>
						<li class="nav-item"><a class="nav-link" href="login">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="stockSearch">주식검색</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<main>
	<div id="box_green">
		<div id="box_white">
			<div id="stockName"><p>${CPstock.itmsNm}</p></div>
			<div id="currentPrice">현재가격</div>
			<div id="currentP"><p>${CPstock.mkp }</p></div>
			<div id="Q">몇 주를 판매할까요?</div>
			<div id="available"><p>판매 가능 수량 : ${CPstock.stockEA }주</p></div>
			<script>
				$(function() {
					var availableEA = ${CPstock.stockEA}	; // 보유 수량
					var quantityInput = document.querySelector('.EnterA'); // 수량 입력 요소
					var form = document.querySelector('form'); // 전송 폼
					form.addEventListener('submit', function(e) { // 전송 이벤트 감지
						e.preventDefault(); // 제출 이벤트 중지
						var stockEA = Number(quantityInput.value); // 수량 가져오기
						if (isNaN(stockEA) || stockEA <= 0)  { // 0 이하의 수량 입력하면 경고
							alert("판매할 수량을 1 이상으로 입력하세요.");
						} else if (stockEA > availableEA) { // 보유 수량 이상 입력하면 경고
							alert("보유한 수량(" + availableEA + "주)보다 많은 수량을 입력할 수 없습니다.");
						} else { // 그 외에는 폼 제출
							form.submit();
						}
					});
				});
			</script>
			<div id="Enter">
			<form action="/Stocksellcheck" method="POST"> 
				<input type="text" class="EnterA" placeholder="수량입력" name="quantity" style="width:400px; height:250px; text-align: center;">
				<input type="hidden" name="srtnCd" value="${CPstock.srtnCd}">
				<input type="hidden" name="mkp" value="${CPstock.mkp}">	
				<input type="hidden" name="itmsNm" value="${CPstock.itmsNm}">	
				<input type="hidden" name="tradeNo" value="${tradeNo}">
				<a href="http://localhost:8079/Stocksellcheck"> 
				<input type="submit" class="w-btn w-btn-green" value="완료"></a>
			</form>
			</div>
		</div>
		</div>
</main>
</body>
</html>