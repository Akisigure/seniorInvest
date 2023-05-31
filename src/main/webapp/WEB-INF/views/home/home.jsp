<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>안심증권-노년층을 위한최고의 증권-</title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>



	<main class="container-fluid p-0">
		<section id="section-1" class="row vh-100 m-0">
			<div class="col section-container">
				<div class="container">
					<jsp:include page="/stockMainview"></jsp:include>
				</div>
			</div>
		</section>
		<section id="section-2" class="row vh-100 m-0">
			<div class="col section-container">
				<div class="container">
					<jsp:include page="/favoriteStock/stockFavorites"></jsp:include>
				</div>
			</div>
		</section>
	</main>

</body>
<script src="/js/script.js"></script>
</html>