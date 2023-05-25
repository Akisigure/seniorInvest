<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>안심증권-노년층을 위한최고의 증권-</title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
          <section id="section-1" class="row vh-100 m-0">
            <div class="col section-container">
            
                <div class="container">
               <h1>테마별로 기사보기</h1>
                    <div class="row">
                        <div class="col"><a href="/news/반도체주" class="btn btn-primary btn-block my-2">반도체주</a></div>
                        <div class="col"><a href="/news/2차전지주" class="btn btn-primary btn-block my-2">2차전지주</a></div>
                        <div class="col"><a href="/news/전기자동차주" class="btn btn-primary btn-block my-2">전기자동차주</a></div>
                        <div class="col"><a href="/news/고령화주" class="btn btn-primary btn-block my-2">고령화주</a></div>
                    </div>
                    <div class="row">
                        <div class="col"><a href="/news/코로나주" class="btn btn-primary btn-block my-2">코로나주</a></div>
                        <div class="col"><a href="/news/임플란트주" class="btn btn-primary btn-block my-2">임플란트주</a></div>
                        <div class="col"><a href="/news/ai주" class="btn btn-primary btn-block my-2">AI주</a></div>
                        <div class="col"><a href="/news/우주항공주" class="btn btn-primary btn-block my-2">우주항공주</a></div>
                    </div>
                </div>
            </div>
        </section>
        <section id="section-2" class="row vh-100 m-0">
            <div class="col section-container">
                <div class="container">
                <jsp:include page="/stockMainview"></jsp:include>
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
<!-- Custom JS -->
<script src="./js/script.js"></script>
</html>