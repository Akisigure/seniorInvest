<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Mypage 마이페이지</title>
 <link rel="stylesheet" href="css/Mypage.css">
 <meta charset="UTF-8">

</head>
<body>
	<header>안심증권 > 마이페이지</header>

	
<form>
	<div id="boxBalance">
		<div id=BaL><label for="Balance">나의 잔액 > </label></div>
		<span class="BalNum">
		<fmt:formatNumber value="${Balance.balance}" type="number" ></fmt:formatNumber>
		원
		
		</span>
	</div>

	<div id="boxAccount">
		<div id=Acc>나의 계좌 ></div>
		<span class="bankN">${Balance.accountid}</span>
	</div>

	<div id="stockEA">
		<div id="Sto">보유수량 ></div>
		<div id="table">
			<br> <br>
			<table>
				<thead>
					<tr>
						<th>종목명</th>
						<th>보유수량</th>
						<th>현재가</th>
					</tr>
				</thead>
				<tbody> <!--  ${StockEA} -->
					<c:forEach items="${StockEA}" var="stock">
					<tr>
						<td>${stock.itmsNm }</td>
						<td>${stock.stockEA}</td>
						<td>${ stock.mkp}</td>
						<td><a href="StocksellDc?srtnCd=${stock.srtnCd }&tradeNo=${stock.tradeNo}"> <input type="button" value="매도"></a></td>
					</tr>
					</c:forEach>
					</tbody>
			</table>
		</div>
	</div>
	<div id="stockEA">
	<div id="Sto">미체결 주문 ></div>
			<br> <br>
			<table>
				<thead>
					<tr>
						<th>종목명</th>
						<th>주문수량</th>
						<th>거래금액</th>
						<th>주문일시</th>
					</tr>
				</thead>
				<tbody> <!--  ${StockEA} -->
					<c:forEach items="${cList}" var="clist">
					<tr>
						<td>${clist.itmsNm }</td>
						<td>${clist.quantity}</td>
						<td>${clist.orderPrice}</td>
						<td><fmt:formatDate pattern="yyyy년 MM월 dd일 hh시 mm분" value="${clist.orderDate}"/> </td>
						<td><input type="button" onclick="location.href='/cancelTrade?no=${clist.no}&quantity=${clist.quantity}&orderPrice=${clist.orderPrice}&accountid=${clist.accountid}'" value="주문 취소"></td>
					</tr>
					</c:forEach>
					</tbody>
	</table>
	
	</div>
	</form>
</body>
</html>