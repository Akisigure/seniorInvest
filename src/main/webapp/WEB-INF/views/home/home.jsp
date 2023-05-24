<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>안심증권-노년층을 위한최고의 증권-</title>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link rel="stylesheet" href="./css/style.css">
<script src="./js/script.js"></script>
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>


	<main class="container-fluid p-0">
		<section id="section-1" class="row vh-100 m-0">
			<div class="col section-container">
				<div class="container">
					<div class="latest-news">
						<img class="news-img" src="${latestNews.urlToImage}" alt="News Image"> <a href="${latestNews.url}">
							class="news-link">
							<h3 class="news-title">${latestNews.title}</h3>
						</a>
						<p class="news-description">${latestNews.description}</p>
						<a href="${latestNews.url}" target="_blank" class="view-article">기사보기</a>
					</div>

				</div>
			</div>
		</section>
		<section id="section-2" class="row vh-100 m-0">
			<div class="col section-container">
				<div class="container">
					<h2 class="text-center">Section 2</h2>
					<p class="text-center">공지사항</p>
				</div>
			</div>
		</section>
		<section id="section-3" class="row vh-100 m-0">
			<div class="col section-container">
				<div class="container">
					<h2 class="text-center">Section 3</h2>
					<p class="text-center">관심 종목</p>
				</div>
			</div>
		</section>
	</main>

</body>

</html>