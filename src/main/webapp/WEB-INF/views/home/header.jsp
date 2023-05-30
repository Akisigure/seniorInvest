<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link rel="stylesheet" href="/css/header.css">
<!--  Custom script -->
<script src="/js/script.js"></script>
<!-- Bootstrap Bundle-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<header class="sticky-top">

	<nav class="navbar navbar-expand nav-custom-color">
		<div class="container">
			<ul class="navbar-nav" style="margin-left: auto;">
				<li class="nav-item"><a class="nav-link mininav" href="/mypage">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link mininav" href="#">비밀번호 변경</a></li>
				<li class="nav-item"><a class="nav-link mininav" href="/login">로그아웃</a></li>

			</ul>
		</div>
	</nav>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="/"> <img src="/img/logo1.png">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/news">뉴스</a></li>
					<li class="nav-item"><a class="nav-link" href="/notices">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="/intstock">관심종목</a></li>
					<li class="nav-item"><a class="nav-link" href="/rtstock">실시간종목</a></li>
					<li class="nav-item"><a class="nav-link" href="/selling">매도주문</a></li>
					<li class="nav-item"><a class="nav-link" href="/qa">Q&A</a></li>
					<div id="stockSearch-container">
    					<jsp:include page="../stock/stockSearch.jsp"></jsp:include>
					</div> 
				</ul>
			</div>
		</div>
	</nav>
</header>
</html>
