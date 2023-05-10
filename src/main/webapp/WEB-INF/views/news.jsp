<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안심증권-뉴스페이지-</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<!-- Main Content -->   
	<jsp:include page="header.jsp"></jsp:include>

	<main class="container-fluid p-0">
		<div class="col section-container">
			<div class="container">
				<hr class="mt-0 mb-4"
					style="border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
				<h1 class="mb-4">경제 뉴스</h1>
				<hr class="mt-0 mb-4"
					style="border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">

				<c:forEach var="news" items="${newsPage.content}">
					<div class="news-item">
						<c:choose>
							<c:when test="${not empty news.urlToImage}">
								<img src="${news.urlToImage}" alt="News Image"
									class="news-image">
							</c:when>
						</c:choose>

						<div class="news-text">
							<p>
								<a href=${news.url}><h2>${news.title}</h2></a>
							</p>
							<p class="news-description">${news.description}</p>
							<p class="news-date">${news.publishedAt}</p>
						</div>
					</div>

				</c:forEach>
				<c:if test="${newsPage.totalPages > 1}">
					<div class="pagination mt-5">
						<c:set var="startPage"
							value="${newsPage.number - 4 > 0 ? newsPage.number - 4 : 0}" />
						<c:set var="endPage"
							value="${newsPage.number + 4 < newsPage.totalPages ? newsPage.number + 4 : newsPage.totalPages - 1}" />


						<c:if test="${startPage > 0}">
							<a href="<c:url value="/news?page=0&size=15"/>"
								class="btn-pagination">1</a>
							<span class="ellipsis">...</span>
						</c:if>

						<c:forEach begin="${startPage}" end="${endPage}" varStatus="loop">
							<a href="<c:url value="/news?page=${loop.index}&size=15"/>"
								class="btn-pagination ${loop.index == newsPage.number ? 'active' : ''}">${loop.index + 1}</a>
						</c:forEach>

						<c:if test="${endPage < newsPage.totalPages - 1}">
							<span class="ellipsis">...</span>
							<a
								href="<c:url value="/news?page=${newsPage.totalPages - 1}&size=15"/>"
								class="btn-pagination">${newsPage.totalPages}</a>
						</c:if>
					</div>
				</c:if>
			</div>
		</div>
	</main>
</body>

</html>
