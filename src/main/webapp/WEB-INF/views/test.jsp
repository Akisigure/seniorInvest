<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<style>
* {
	text-align: center;
}

</style>
<body>
	<table id="dataTable">
		<thead>
			<tr>
				<th>공시 대상 회사</th>
				<th>보고서 명</th>
				<th>제출인</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>데이터 1-1</td>
				<td>데이터 1-2</td>
				<td>데이터 1-3</td>
			</tr>
			<tr>
				<td>데이터 2-1</td>
				<td>데이터 2-2</td>
				<td>데이터 2-3</td>
			</tr>
		</tbody>
	</table>
	<div id="dataContainer"></div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(function() {
  reloadData(); // 초기 데이터 요청
  
  // 10분마다 데이터를 갱신하기 위해 setInterval을 사용
  setInterval(reloadData, 600000); // 10분 = 600000 밀리초
});

function reloadData() {
  $.ajax({
    url: 'ajax/disclosure',
    type: 'POST',
    dataType: 'json',
    success: function(response) {
      // 데이터 처리 로직
			var dataTable = $('#dataTable tbody');
      dataTable.empty();
      
      // 받은 JSON 데이터를 반복하여 HTML로 출력합니다.
      for (var i = 0; i < response.list.length; i++) {
        var item = response.list[i];
        var corpName = item.corp_name;
        var reportName = item.report_nm;
        var submitter = item.flr_nm;
        
        // 테이블 행을 생성하여 데이터를 넣습니다.
        var row = $('<tr>');
        row.append($('<td>').text(corpName));
        row.append($('<td>').text(reportName));
        row.append($('<td>').text(submitter));
        
        dataTable.append(row);
      }
    },
    error: function(xhr, status, error) {
      // 오류 처리 로직
    }
  });
}



	</script>
</body>
</html>