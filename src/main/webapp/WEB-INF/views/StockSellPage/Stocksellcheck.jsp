<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stock sell check 매도 결정 확인 페이지</title>
 <link rel="stylesheet" href="css/Stocksellcheck.css">
</head>
<body>
<header id="ansimH">
	<h1>안심증권 > 매도 결정 확인 페이지</h1>
	</header>
    <div id="box_green">
    	<div id="box_white">
    		<p>${order.itmsNm }</p>
    		<p>${order.quantity}주를 판매합니다</p>
            <div id="sin"></div>
			<br>
			<div id="totalOdAt">
				<pre class="total">총 주문 금액                         ${ order.mkp * order.quantity }원</pre>
			</div>
			<a href="http://localhost:8079/Mypage"><p onclick="alert('취소하시겠습니까? 취소 하시면 마이페이지로 돌아갑니다.')"><input type="button" class="w-btn w-btn-pink" value="취소"></p></a>
			<form action="StocksellCP">
			<input type="submit" onclick="alert('정말 판매하시겠습니까?')"class="w-btn w-btn-blue" value="확인">
			<input type="hidden" name="srtnCd" value="${order.srtnCd}">
			<input type="hidden" name="mkp" value="${order.mkp}">	
			<input type="hidden" name="itmsNm" value="${order.itmsNm}">	
			<input type="hidden" name="quantity" value="${order.quantity}">
			</div>
			
			
			</form>  
    	</div>
	</div>
</body>
</html> 