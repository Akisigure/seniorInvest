<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
    <!-- CSS -->
    <link rel="stylesheet" href="./css/adminstyle.css">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/adminheader"></jsp:include>

<div class="grid-container">
  <div class="grid-item">
    <jsp:include page="/admin/notice/write"></jsp:include>
  </div>
  <div class="grid-item">
    <jsp:include page="/stockMainview"></jsp:include>
  </div>
  <div class="grid-item">
    <jsp:include page="/board3"></jsp:include>
  </div>
  <div class="grid-item">
    <jsp:include page="/board4"></jsp:include>
  </div>
</div>
  
</body>
</html>
