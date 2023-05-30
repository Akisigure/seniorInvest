<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안심증권-뉴스페이지-</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/topicnews.css">
</head>
<body>

    <jsp:include page="/header"></jsp:include>

    <main class="container main-container">
        <h1 class="mt-5 mb-5">종합 최신 뉴스</h1>
       <div class="topic-buttons">
        <a href="/news" class="btn btn-topic custom-btn">종합뉴스</a>
		<a href="/news/반도체주" class="btn btn-topic custom-btn ${topic == '반도체주' ? 'active' : ''}">반도체주</a>
		<a href="/news/2차전지주" class="btn btn-topic custom-btn ${topic == '2차전지주' ? 'active' : ''}">2차전지주</a>
		<a href="/news/전기자동차주" class="btn btn-topic custom-btn ${topic == '전기자동차주' ? 'active' : ''}">전기자동차주</a>
		<a href="/news/OLED주" class="btn btn-topic custom-btn ${topic == 'OLED주' ? 'active' : ''}">OLED주</a>
		<a href="/news/코로나주" class="btn btn-topic custom-btn ${topic == '코로나주' ? 'active' : ''}">코로나주</a>
		<a href="/news/임플란트주" class="btn btn-topic custom-btn ${topic == '임플란트주' ? 'active' : ''}">임플란트주</a>
		<a href="/news/AI주" class="btn btn-topic custom-btn ${topic == 'AI주' ? 'active' : ''}">AI주</a>
		<a href="/news/우주항공주" class="btn btn-topic custom-btn ${topic == '우주항공주' ? 'active' : ''}">우주항공주</a>
	</div>


        <c:forEach var="news" items="${newsPage.content}">
            <div class="news-item">
                <div>
                    <a href="${news.url}" class="news-title">${news.title}</a>
                </div>
                <div>
                    <p class="news-description">${news.description}</p>
                    <p class="news-date">${news.publishedAt}</p>
                </div>
            </div>
        </c:forEach>


        <c:if test="${newsPage.totalPages > 1}">
            <div class="pagination mt-5">
                <c:set var="startPage" value="${newsPage.number - 4 > 0 ? newsPage.number - 4 : 0}" />
                <c:set var="endPage" value="${newsPage.number + 4 < newsPage.totalPages ? newsPage.number + 4 : newsPage.totalPages - 1}" />

                <c:if test="${startPage > 0}">
                    <a href="<c:url value="/news?page=0&size=15"/>" class="btn-pagination">1</a>
                    <span class="ellipsis">...</span>
                </c:if>

                <c:forEach begin="${startPage}" end="${endPage}" varStatus="loop">
                    <a href="<c:url value="/news?page=${loop.index}&size=15"/>" class="btn-pagination ${loop.index == newsPage.number ? 'active' : ''}">${loop.index + 1}</a>
                </c:forEach>

                <c:if test="${endPage < newsPage.totalPages - 1}">
                    <span class="ellipsis">...</span>
                    <a href="<c:url value="/news?page=${newsPage.totalPages - 1}&size=15"/>" class="btn-pagination">${newsPage.totalPages}</a>
                </c:if>
            </div>
        </c:if>
    </main>
</body>

<script>
$(document).ready(function() {
    $(".btn-topic").click(function() {
        $(".btn-topic.active").removeClass("active");
        $(this).addClass("active");
    });
});
</script>


</html>
