<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
  <head>
  <link rel="stylesheet" href="css/mypage_test.css">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Style -->
    <link rel="stylesheet" href="css/style.css">
    <title>Table #5</title>
  </head>
  <body>
  <div class="content">
      <div class="table-responsive custom-table-responsive"><!--  전체 회색 박스 -->

        <table class="table custom-table">
          <thead>
            <tr>  
              <th scope="col"> </th>
              <th scope="col">종목명</th>
              <th scope="col">보유수량</th>
              <th scope="col">현재가</th>
              <th scope="col">수익률</th>
            </tr>
          </thead>
          <tbody>
			<tr>
             <th scope="row"></th>
             <td>삼성전자</td>
           	 <td>4</td>
             <td>72000</td>
            <td>2.35</td>
           </tr>
            <tr class="spacer"><td colspan="100"></td></tr>
            <tr>
              <th scope="row"></th>
                <td>아모레퍼시픽</td>
              <td>6</td>
              <td>32000 </td>
              <td>0.36</td>
            </tr>
            
          </tbody>
        </table>
      </div>
    </div>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>