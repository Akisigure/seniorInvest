<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="./css/stockmainview.css">
<head>
<title>실시간 거래량 top10</title>
</head>
<body>
	<div class="centered-container">
		<div class="centered-content">
			<h1>실시간 거래량 top10</h1>
			<table>
				<thead>
					<tr>
						<th>종목명</th>
						<th>전일 대비</th>
						<th>등락률</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="stock" items="${stockMainview}">
						<tr>
							<td><c:out value="${stock.itmsNm}" /></td>
							<td><c:out value="${stock.vs}" /></td>
							<td
								class="price <c:choose><c:when test='${stock.vs ge 0}'>up</c:when><c:otherwise>down</c:otherwise></c:choose>"><c:out
									value="${stock.fltRt}%" /></td>
							<td
								class="price <c:choose><c:when test='${stock.vs ge 0}'>up</c:when><c:otherwise>down</c:otherwise></c:choose>"><c:out
									value="${stock.mkp}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="${stock}" target="_blank" class="button">종목 확인하기</a>
		</div>
	</div>

</body>
</html>
