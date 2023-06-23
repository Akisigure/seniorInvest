<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Mypage 마이페이지</title>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
<link rel="stylesheet"  href="/css/MypageN.css">
<meta charset="UTF-8">
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
	<jsp:include page="/header"></jsp:include>
	<div id="Picon">
		<div id="userN">${userid}님, 환영합니다</div>
	</div>
	<main>
	<form>
	<div id="uInfo"> 나의 정보 </div>
		<div id="boxBalance">
			<div id=BaL>  나의 잔액 ></div>
			<div class="BalNum"> 
			<fmt:formatNumber value="${Balance.balance}" type="number"></fmt:formatNumber>원</div>
		</div>
		<div id="boxAccount" style="display: inline-block; , width: 30%;">
			<div id=Acc>나의 계좌번호 ></div>
			<span class="bankN">${Balance.accountid}</span>
		</div>

		<div id="stockEA">
			<div id="Sto">보유수량 ></div>
			<div class="content">
		<div class="container">
			<div class="table-responsive custom-table-responsive">
				<table class="table custom-table">
					<thead>
						<tr>
							<th>종목명</th>
							<th>보유수량</th>
							<th>현재가</th>
							<th>수익률</th>
						</tr>
					</thead>
					<tbody>
							<!--  ${StockEA} -->
							<c:forEach items="${StockEA}" var="stock">
								<tr>
							<tr class="spacer">
						<td colspan="100"></td>
						</tr>
						<tr class="active">
									<td>${stock.itmsNm }</td>
									<td>${stock.stockEA}</td>
									<td>${stock.mkp}</td>
									<td>${stock.rofreturn }</td>
									<td><a href="StocksellDc?srtnCd=${stock.srtnCd }&tradeNo=${stock.tradeNo}">
										<input type="button" class="w-btn" value="매도"></a>
											</td>
								</tr>
							</c:forEach>
							<tr class="spacer">
								<td colspan="100"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</div>
		<div id="stockEA">
			<div id="Sto">미체결 주문 ></div>
			<div class="content">
				<div class="table-responsive custom-table-responsive">
					<!--  전체 회색 박스 -->

					<table class="table custom-table">
						<thead>
							<tr>
								<th scope="col"></th>
								<th>종목명</th>
								<th>주문수량</th>
								<th>거래금액</th>
								<th>주문일시</th>
							</tr>
						</thead>
						<tbody>
							<!--  ${StockEA} -->
							<c:forEach items="${cList}" var="clist">
								<tr>
									<th scope="row"></th>
									<td>${clist.itmsNm }</td>
									<td>${clist.quantity}</td>
									<td>${clist.orderPrice}</td>
									<td><fmt:formatDate pattern="yyyy년 MM월 dd일 hh시 mm분"
											value="${clist.orderDate}" /></td>
									<td><input type="button"
										onclick="location.href='/cancelTrade?no=${clist.no}&quantity=${clist.quantity}&orderPrice=${clist.orderPrice}&accountid=${clist.accountid}'"
										value="주문 취소"></td>
								</tr>
							</c:forEach>
							<tr class="spacer">
								<td colspan="100"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	
	</form>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</main>
</body>
</html>