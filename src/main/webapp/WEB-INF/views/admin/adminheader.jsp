<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
    <!-- CSS -->
    <link rel="stylesheet" href="./css/adminstyle.css">

    <title>어드민</title>
</head>
<body id="body-pd">
    <div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
               <div class="nav__brand">
    		<div class="nav__toggle" id="nav-toggle">
        		<i class="fa-sharp fa-solid fa-bars" class="nav__icon"></i>
        		<span class="nav_name">안심 증권</span>
        		</div>

                <div class="nav__list">
                    <a href="#" class="nav__link active">
                        <i class="fa-solid fa-house" class="nav__icon"></i>
                        <span class="nav_name">Dashboard</span>
                    </a>
                    <a href="#" class="nav__link">
                        <i class="fa-solid fa-comment" class="nav__icon"></i>
                        <span class="nav_name">Q&A</span>
                    </a>

					
                    <a href="#" class="nav__link">
                        <i class="fa-solid fa-folder" class="nav__icon"></i>
                        <span class="nav_name">거래 내역</span>
					</a>

                    <a href="#" class="nav__link">
                        <i class="fa-solid fa-chart-pie" class="nav__icon"></i>
                        <span class="nav_name">거래 주식 관리</span>
                    </a>

                    <a href="#" class="nav__link">
                        <i class="fa-solid fa-user" class="nav__icon"></i>
                        <span class="nav_name">사용자 관리</span>
                    </a>

                </div>
                <a href="#" class="nav__link">
                    <i class="fa-solid fa-right-from-bracket" class="nav__icon"></i>
                    <span class="nav_name">로그 아웃</span>
                </a>
            </div>
            </div>
        </nav>
    </div>
</body>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- JS -->
    <script src="./js/adminscript.js"></script>
</html>