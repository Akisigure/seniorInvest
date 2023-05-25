<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="./css/stockmainview.css">
<head>
<title>즐겨찾기 주식</title>
</head>
<body>
	<div class="centered-container">
		<div class="centered-content">
			<h1>관심있는 종목</h1>
			<table>
				<thead>
					<tr>
						<th></th>
						<th>종목명</th>
						<th>계정 ID</th>
						<th>사용자 ID</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="stock" items="${favoriteStocks}">
						<tr>
							<td><i id="star-${stock.itmsNm}"
								class="fa-star ${stock.favorited ? 'fas' : 'far'}"
								data-itms-nm="${stock.itmsNm}"
								onclick="toggleFavorite(this.id, this.dataset.itmsNm)"></i></td>
							<td><c:out value="${stock.itmsNm}" /></td>
							<td><c:out value="${stock.accountId}" /></td>
							<td><c:out value="${stock.userid}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="#" target="_blank" class="button">종목 확인하기</a>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
function toggleFavorite(elementId, itmsNm) {
    var element = $('#' + elementId);
    var isFavorited = element.hasClass('fas');

    var requestData = {
        userid: getUserId(),
        accountId: 'acc1',
        itmsNm: itmsNm
    };

    $.ajax({
        url: '/favoriteStock/favorite/stock/' + getUserId() + '/acc1/' + itmsNm,
        type: 'POST',
        success: function(response) {
            element.toggleClass('far fas');
        },
        error: function(response) {

        }
    });

    });
}

function getUserId() {
    return 'user1';
}
</script>
</html>