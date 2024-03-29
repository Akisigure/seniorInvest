<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
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
<title>Stock sell check 매도 결정 확인 페이지</title>
 <link rel="stylesheet" href="/css/StocksellcheckT.css">
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
    		<div id="stockNm">${order.itmsNm }</div>
    		<div id="stockSell">${order.quantity}주를 판매합니다</div>
			<br>
			<div id="totalOdAt">총 주문 금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ order.mkp * order.quantity }원</div>
			
			<form action="StocksellCP" method="post">
			<div class="button_center">
			<a href="http://localhost:8079/Mypage">
			<input type="button" onclick="alert('취소하시겠습니까? 취소 하시면 마이페이지로 돌아갑니다.')" class="w-btn w-btn-pink" value="취소"></a>
			<input type="submit" onclick="alert('정말 판매하시겠습니까?')"class="w-btn w-btn-blue" value="확인">
			<form action="StocksellCP" method="post" id="sellForm">
			<div class="button_center">
			<input type="button" onclick="cancel();" class="w-btn w-btn-pink" value="취소">
			<input type="button" onclick="sellComplete();"class="w-btn w-btn-blue" value="확인">
			</div>
			<input type="hidden" name="srtnCd" value="${order.srtnCd}">
			<input type="hidden" name="mkp" value="${order.mkp}">	
			<input type="hidden" name="itmsNm" value="${order.itmsNm}">	
			<input type="hidden" name="quantity" value="${order.quantity}">
			<input type="hidden" name="tradeNo" value="${order.tradeNo}">
			</form>  
			
			</div>	
    	</div>
	</main>
	<script>
		function cancel() {
			
			let result = confirm('취소하시겠습니까? 취소 하시면 마이페이지로 돌아갑니다.')
			
			if(result == true) {
				location.href='/Mypage';
			} else {
				return false;
			}
			
		}
		
	function sellComplete() {
			
			let result = confirm('정말 판매하시겠습니까?')
			
			if(result == true) {
				let form = event.target.form;
				form.submit();
			}else {
				return false;
			}
		
	}
	
	
	
	</script>
</body>
</html> 