<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="./css/style.css">
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</head>
 <header class="sticky-top">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/">
                <img src="./img/logo1.png"> 
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="#section-1">뉴스</a></li>
                    <li class="nav-item"><a class="nav-link" href="#section-2">공지 사항</a></li>
                    <li class="nav-item"><a class="nav-link" href="#section-3">관심 종목</a></li>
                    <li class="nav-item"><a class="nav-link" href="#section-3">실시간 종목</a></li>
                    <li class="nav-item"><a class="nav-link" href="news">마이 페이지</a></li>
                    <li class="nav-item"><a class="nav-link" href="#section-3">매도 주문</a></li>
                    <li class="nav-item"><a class="nav-link" href="#section-3">Q&A</a></li>
                    <li class="nav-item"><a class="nav-link" href="login">로그 아웃</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

</html>