<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
 <link rel="stylesheet" href="css/StocksellCPN.css">
<title>Stock sell complete 매도 완료 페이지</title>
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
<body>
	<main>
	<div id="box_green">
		<div id="box_white">
		<div id="sinCP">${order.itmsNm } ${order.quantity}주 판매완료 !</div>
		<div id="another">주당  ${ order.mkp}원에 판매되었습니다. 총 판매된 금액을 확인해 보세요</div>
		</div>
		<div id="sinCom">주문이 완료되었습니다</div>
		<div id="sinCCom"><span class="my-color">새로운 주식</span>을 살펴보세요</div>
		<div id="button_all">
		<a href="http://localhost:8079">
		<input type="button"class="w-btn w-btn-green1" value="메인페이지 바로가기"></a>
		<a href="http://localhost:8079/Mypage">
		<input type="button"class="w-btn w-btn-green2" value="마이페이지 바로가기"></a>
		</div>
		</div>
	</main>		
</body>
</html>