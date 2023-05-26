<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<link rel="stylesheet" href="./css/stockmainview.css">
<head>
<title>시가총액 상위 10</title>
</head>
<body>
	<div class="centered-container">
		<div class="centered-content">
			<h1>시가총액 상위 10</h1>
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
							<td><i id="star-${stock.itmsNm}" class="fa-star far"
								data-itms-nm="${stock.itmsNm}"
								onclick="toggleFavorite(this.id, this.dataset.itmsNm)"></i> <c:out
									value="${stock.itmsNm}" /></td>
							<td><c:out value="${stock.vs}" /></td>
							<td class="price <c:choose><c:when test='${stock.vs ge 0}'>up</c:when><c:otherwise>down</c:otherwise></c:choose>"><c:out value="${stock.fltRt}%" /></td>
							<td class="price <c:choose><c:when test='${stock.vs ge 0}'>up</c:when><c:otherwise>down</c:otherwise></c:choose>"><c:out value="${stock.mkp}" /></td>
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
        url: '/favoriteStock/addfavoriteStock',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(requestData),
        success: function(response) {
            element.toggleClass('far fas');
        },
        error: function(response) {

        }
    });
}

function getUserId() {
    return 'user1';
}
</script>
</html>
