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
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <!-- Main Content -->
    <jsp:include page="/header"></jsp:include>

    <main class="container">
        <h1 class="mt-5 mb-5">${topic} 관련 뉴스</h1>
        <c:forEach var="news" items="${newsPage.content}">
            <div class="news-item">
                <a href=${news.url } class="news-title">${news.title}</a>
                <p class="news-description">${news.description}</p>
                <p class="news-date">${news.publishedAt}</p>
            </div>
        </c:forEach>

        <!-- Pagination -->
        <c:if test="${newsPage.totalPages > 1}">
            <div class="pagination mt-5">
                <c:set var="startPage" value="${newsPage.number - 4 > 0 ? newsPage.number - 4 : 0}" />
                <c:set var="endPage" value="${newsPage.number + 4 < newsPage.totalPages ? newsPage.number + 4 : newsPage.totalPages - 1}" />

                <c:if test="${startPage > 0}">
                    <c:url var="topicUrl" value="/topicnews">
                        <c:param name="topic" value="${fn:escapeXml(topic)}" />
                        <c:param name="page" value="0" />
                        <c:param name="size" value="15" />
                    </c:url>
                    <a href="${topicUrl}" class="btn-pagination">1</a>
                    <span class="ellipsis">...</span>
                </c:if>

                <c:forEach begin="${startPage}" end="${endPage}" varStatus="loop">
                    <c:url var="topicUrl" value="/topicnews">
                        <c:param name="topic" value="${fn:escapeXml(topic)}" />
                        <c:param name="page" value="${loop.index}" />
                        <c:param name="size" value="15" />
                    </c:url>
                    <a href="${topicUrl}" class="btn-pagination ${loop.index == newsPage.number ? 'active' : ''}">${loop.index + 1}</a>
                </c:forEach>

                <c:if test="${endPage < newsPage.totalPages - 1}">
                    <c:url var="topicUrl" value="/topicnews">
                        <c:param name="topic" value="${fn:escapeXml(topic)}" />
                        <c:param name="page" value="${newsPage.totalPages - 1}" />
                        <c:param name="size" value="15" />
                    </c:url>
                    <span class="ellipsis">...</span>
                    <a href="${topicUrl}" class="btn-pagination">${newsPage.totalPages}</a>
                </c:if>
            </div>
        </c:if>
    </main>
</body>
<!-- Custom JS -->
<script src="./js/script.js"></script>
</html>