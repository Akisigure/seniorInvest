<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>검색 페이지</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<style>
  body, html{
  	height: 100%;
  }
  
  .searchForm{
  	display: flex;
  	align-items: center;
  	justify-content: center;
  	height: 100%;
  }

  .searchResult {
    display: none;
  }
  
  #autoComplete{
  	width: 500px;
  	height: 40px;
  	text-align: center;
  }
  
  #stockSearch{
    width : 120px;
	height : 40px;
	font-size : 18px;
	color: white;
	background: linear-gradient(125deg, #2ecc71, #27ae60, #2ecc71);
	border:none;
  	cursor:pointer;
  	display:inline;
  	font-weight: bold;
  }
</style>
<body>
  <div class="searchForm">
    <form method="post" action="/stockDetail" id="searchForm">
      <input type="text" name="itmsNm" id="autoComplete">
      <input type="submit" value="검색" id="stockSearch">
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