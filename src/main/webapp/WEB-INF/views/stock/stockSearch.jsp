<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>주식 검색</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<link rel="stylesheet" href="./css/stocksearch.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="./css/style.css">
    <!--  Custom script -->
    <script src="./js/script.js"></script>
    <!-- Bootstrap Bundle-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<body>
 <header class="sticky-top">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/">
                <img src="./img/logo1.png"> 
            </a>
            <a href="updatePassword">비밀번호 수정</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="news">뉴스</a></li>
                    <li class="nav-item"><a class="nav-link" href="disclosure">공시</a></li>
                    <li class="nav-item"><a class="nav-link" href="notices">공지사항</a></li>
                    <li class="nav-item"><a class="nav-link" href="intstock">관심종목</a></li>
                    <li class="nav-item"><a class="nav-link" href="Mypage">마이페이지</a></li>
                    <li class="nav-item"><a class="nav-link" href="qa">Q&A</a></li>
                    <li class="nav-item"><a class="nav-link" href="login">로그아웃</a></li>
                    <li class="nav-item"><a class="nav-link" href="stockSearch">주식검색</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<body>
  <div class="searchForm">
    <form method="post" action="/stockDetail" id="searchForm">
      <input type="text" name="itmsNm" id="autoComplete">
      <div>
      	<input type="submit" value="검색" id="stockSearch">
    	  </div>	
    </form>
    
  </div>

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
    $(function () {
      $('#autoComplete').autocomplete({
        source: function (request, response) { //source: 입력시 보일 목록
          $.ajax({
            url: "/ajax/stockSearch",
            type: "POST",
            dataType: "JSON",
            data: { value: request.term }, // 검색 키워드
            success: function (data) { // 성공
              if (data.resultList.length > 0) {
                response(
                  $.map(data.resultList, function (item) {
                    return {
                      label: item.itmsNm, // 목록에 표시되는 값
                      value: item.itmsNm, // 선택 시 input창에 표시되는 값
                      idx: item.SEQ, // index
                    };
                  })
                ); //response
              } 
            },
            error: function () {
              alert("오류가 발생했습니다.");
            },
          }); //ajax
        },
        focus: function (event, ui) {
          // 방향키로 자동완성단어 선택 가능하게 만들어줌
          return false;
        },
        minLength: 1, // 최소 글자수
        autoFocus: true, // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
        delay: 500, //autocomplete 딜레이 시간(ms)
        select: function (evt, ui) {
          // 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
          console.log(ui.item.label);
          console.log(ui.item.idx);
        },
      });

      $("#searchForm").submit(function (event) {
          event.preventDefault();

          var selectedValue = $("#autoComplete").val();
          
          if(selectedValue.trim() === ""){
        	  alert("주식 이름을 작성해주세요.");
        	  return;
          }

          $.ajax({
            url: "/ajax/stockSearch",
            type: "POST",
            dataType: "JSON",
            data: { 'value': selectedValue },
            success: function (data) {
              if (!data.isStockExist) {
            	  alert("존재하지 않는 주식입니다.");
            	
              }else{
            	  location.href="/stockDetail?itmsNm=" + selectedValue;
              }
            },
            error: function () {
              alert("오류가 발생했습니다.");
            },
          });
        });
    });
  </script>
</body>
</html>