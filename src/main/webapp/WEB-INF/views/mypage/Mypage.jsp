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
  <div id="wrap">
  <header></header>
        <div id="header">
            <h1 id="logo">
               <a href="#"><img src="img/logoR.png"/></a>
            </h1>
            <div id="gnb">
                <ul>
                    <li><a href="#">메인페이지</a></li>
                    <li><a href="#">로그인</a></li>
                    <li><a href="#">뉴스/공시</a></li>
                    <li><a href="#">Q&A</a></li>
                </ul>
            </div>
        </div>
      

    </div>
<form>
	<div id="boxBalance">
		<div id=BaL><label for="Balance">나의 잔액 > </label></div>
		<span class="BalNum">
		<fmt:formatNumber value="${Balance.balance}" type="number" ></fmt:formatNumber>원</span>
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
						<th>수익률</th>
					</tr>
				</thead>
				<tbody> <!--  ${StockEA} -->
					<c:forEach items="${StockEA}" var="stock">
					<tr>
						<td>${stock.itmsNm }</td>
						<td>${stock.stockEA}</td>
						<td>${stock.mkp}</td>
						<td>수익률</td>
						<td><a href="StocksellDc?srtnCd=${stock.srtnCd }"> <input type="button" value="매도"></a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
	</form>
</body>
</html>