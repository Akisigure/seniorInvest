<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="/css/stockmainview.css">
<head>
<title>실시간 거래량 top10</title>
</head>
<body>
	<div class="centered-container">
		<div class="centered-content">
			<h1 style="text-align: center;">시가총액 상위 10</h1>
			<div class="message">
			</div>

		<table>
				<thead>
					<tr>
						<th></th>
						<th>종목명</th>
						<th>전일 대비</th>
						<th>등락률</th>
						<th>가격</th>
					</tr>
				</thead>
					<c:forEach var="stock" items="${stockMainview}" varStatus="status">
						<c:if test="${status.index < 8}">
							<tr>
								<td class="star-icon"><i id="star-${stock.itmsNm}"  style="color: yellow;"
									class="fa-star ${stock.favorited ? 'fas' : 'far'}"
									data-itms-nm="${stock.itmsNm}" data-vs="${stock.vs}"
									data-mkp="${stock.mkp}" data-flt-rt="${stock.fltRt}"
									onclick="toggleFavorite(this.id, this.dataset.itmsNm,'${stock.vs}', '${stock.mkp}', '${stock.fltRt}')"></i> </td>
								<td class="stock-name"><a href="/stockDetail?itmsNm=${stock.itmsNm}">${stock.itmsNm}</a></td>
								<td><c:out value="${stock.vs}" /></td>
								<td class="price ${stock.vs ge 0 ? 'up' : 'down'}">
								<c:out value="${stock.fltRt}%" /></td>
								<td class="price ${stock.vs ge 0 ? 'up' : 'down'}">
								<fmt:formatNumber value="${stock.mkp}" type="number"></fmt:formatNumber> 원</td>
							</tr>

						</c:if>
					</c:forEach>
			</table>
			<a href="/stockSearch" target="_blank" class="button">종목 확인하기</a>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		function toggleFavorite(elementId, itmsNm, vs, mkp, fltRt) {
			var element = $('#' + elementId);
			var favorited = element.hasClass('fas');

			var requestData = {
				userid : '${username}',
				accountId : '${currentUser.accountId}',
				itmsNm : itmsNm,
				favorited : favorited,
				vs : vs,
				mkp : mkp,
				fltRt : fltRt
			};

			var url = '/favoriteStock/addOrRemoveFavorite';
			var type = 'POST';

			$.ajax({
				url : url,
				type : type,
				contentType : 'application/json',
				data : JSON.stringify(requestData),
				success : function(response) {
					if (response.favorited) {
						element.addClass('fas').removeClass('far');
					} else {
						element.addClass('far').removeClass('fas');
					}
				},
				error : function(response) {
					// 에러 처리
				}
			});
		}

		$(document).ready(function() {
			var url = '/favoriteStock/getFavorites';
			var type = 'GET';

			$.ajax({
				url : url,
				type : type,
				data : {
					userid : '${username}'
				},
				success : function(response) {
					for (var i = 0; i < response.length; i++) {
						var itmsNm = response[i].itmsNm;
						var elementId = 'star-' + itmsNm;
						var element = $('#' + elementId);

						if (element.length) {
							element.addClass('fas').removeClass('far');
						}
					}
				},
				error : function(response) {
					// 에러 처리
				}
			});
		});
	</script>
</body>
</html>
