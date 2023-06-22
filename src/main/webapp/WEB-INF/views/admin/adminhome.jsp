<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
    <!-- CSS -->
    <link rel="stylesheet" href="./css/adminstyle.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
    <style>
    	.admin_container {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 500px;
  height: 400px;
    		text-align: center;	
    		justify-content: center;
    		font-size: 36px;
    		text-decoration: none;
 			background-color: #efefef;
 			border-radius: 5%;
    	}
    	
    	.admin_container p{
    		margin-top: 10%;
    	}
    	
    	.link {
    		text-decoration: none;
    		color: black;
    		 font-weight: bold;

    	}
    	

    	
    
    
    
    </style>
<title>관리자 대시보드</title>
</head>
<body>
<jsp:include page="/header"></jsp:include>
	<div class="admin_container">
		<p><a href="/admin/qaList" class="link">Q&A 관리하기</a></p>
		<p><a href="/notice/list" class="link">공지사항 관리하기</a></p>
		<p><a href="/admin/tradeList" class="link">거래내역 확인하기</a></p>
	</div>
</body>
</html>
