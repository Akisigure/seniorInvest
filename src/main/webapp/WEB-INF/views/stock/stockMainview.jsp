<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<h1>실시간 거래량 top10</h1>
			<div class="message">
				<c:if test="${not empty message}">
					<p>${message}</p>
				</c:if>
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
				<tbody>
					<c:forEach var="stock" items="${stockMainview}" varStatus="status">
						<c:if test="${status.index < 8}">
							<tr>
								<td class="star-icon"><i id="star-${stock.itmsNm}"
									class="fa-star ${stock.favorited ? 'fas' : 'far'}"
									data-itms-nm="${stock.itmsNm}"
									onclick="toggleFavorite(this.id, this.dataset.itmsNm)"></i></td>
								<td class="stock-name"><c:out value="${stock.itmsNm}" /></td>
								<td><c:out value="${stock.vs}" /></td>
								<td class="price ${stock.vs ge 0 ? 'up' : 'down'}"><c:out
										value="${stock.fltRt}%" /></td>
								<td class="price ${stock.vs ge 0 ? 'up' : 'down'}"><c:out
										value="${stock.mkp}" /></td>
							</tr>

						</c:if>
					</c:forEach>
				</tbody>
			</table>
			<a href="#" target="_blank" class="button">종목 확인하기</a>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		function toggleFavorite(elementId, itmsNm) {
			var element = $('#' + elementId);
			var favorited = element.hasClass('fas');

			var requestData = {
				userid : '${username}', // 로그인한 사용자 아이디
				accountId : '${currentUser.accountId}',
				itmsNm : itmsNm,
				favorited : favorited
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
		        url: url,
		        type: type,
		        data: { userid: '${username}' },
		        success: function(response) {
		            for (var i = 0; i < response.length; i++) {
		                var itmsNm = response[i].itmsNm;
		                var elementId = 'star-' + itmsNm;
		                var element = $('#' + elementId);

		                if (element.length) {
		                    element.addClass('fas').removeClass('far');
		                }
		            }
		        },
		        error: function(response) {
		            // 에러 처리
		        }
		    });
		});
	</script>
</body>
</html>
