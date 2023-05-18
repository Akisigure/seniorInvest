<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<div style='width: 50px; float: right;'>
				<a href="http://localhost:8079/Stocksell"> 
				<input type="button"class="w-btn w-btn-green" value="매도"></a>

			</div>
			<br> <br>
			<table>
				<thead>
					<tr>
						<th>종목명</th>
						<th>보유수량</th>
					
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>야놀자</td>
						<td>2</td>
						
					</tr>
					<tr>
						<td>당근마켓</td>
						<td>2</td>
						
					</tr>
					<tr>
						<td>현대카드</td>
						<td>2</td>
						
					</tr>
					<tr>
						<td>메리츠증권</td>
						<td>2</td>
					
					</tr>
					<tr>
						<td>대우건설</td>
						<td>2</td>
						
					</tr>
					<tr>
						<td>SFA 반도체</td>
						<td>2</td>
						
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</form>
</body>
</html>