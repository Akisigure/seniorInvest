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
</head>
    <header class="sticky-top">
        <div class="d-flex justify-content-between py-3 px-5 align-items-center">
            <div class="logo">
            <a href="/">
                <img src="./img/logo1.png"  width="200" height="120"> 
                </a>
            </div>
            <nav>
                <ul class="nav">
                    <li class="nav-item"><a class="nav-link" href="#section-1">뉴스</a></li>
                    <li class="nav-item"><a class="nav-link" href="#section-2">공지 사항</a></li>
                    <li class="nav-item"><a class="nav-link" href="#section-3">관심 종목</a></li>
                    <li class="nav-item"><a class="nav-link" href="login">로그인</a></li>
                </ul>
            </nav>
        </div>
    </header>
</html>
