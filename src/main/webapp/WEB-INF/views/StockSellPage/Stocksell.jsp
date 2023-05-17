<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stock Sell Page 매도 페이지</title>
<link rel="stylesheet" href="css/Stocksell.css">

</head>
<body>
	<header id="ansimH">
		<h1>안심증권 > 매도페이지</h1>
	</header>
	<div id="boxStockEA">
		<div id="stockEAUser">< 현재 나의 주식 보유 정보 ></div>
		<div id="whiteS">
				<table>
					<thead>
						<tr>
							<th>종목명</th>
							<th>보유수량</th>
							<th>현재가</th>
						</tr>
					</thead>
					<tbody>
						<!--  ${StockEA} -->
						<c:forEach items="${StockEA}" var="stock">
							<tr>
								<td>${stock.itmsNm }</td>
								<td>${stock.stockEA}</td>
								<td>${ stock.mkp}</td>
							</tr>


						</c:forEach>
					</tbody>
				</table>
			</div>


		<br> <a href="http://localhost:8079/StocksellDc"> <input
			type="button" class="w-btn w-btn-green" value="판매하기"></a>

	</div>

</body>
</html>