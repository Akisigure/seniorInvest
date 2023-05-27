<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/disclosure.css">
<style>


</style>
<body>
<jsp:include page="../home/header.jsp"></jsp:include>
<div class="container" >
<div class="description">
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
	</div>
	</div> <!-- container -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(function() {
  reloadData(); 
  
  setInterval(reloadData, 600000); // 10분 = 600000 밀리초
});

function reloadData() {
  $.ajax({
    url: 'ajax/disclosure',
    type: 'POST',
    dataType: 'json',
    success: function(response) {
		var dataTable = $('#dataTable tbody');
    	dataTable.empty();
      
      for (var i = 0; i < response.list.length; i++) {
        var item = response.list[i];
        var corpName = item.corp_name;
        var reportName = item.report_nm;
        var submitter = item.flr_nm;
        
        var row = $('<tr>');
        row.append($('<td>').text(corpName));
        row.append($('<td>').text(reportName));
        row.append($('<td>').text(submitter));
        
        dataTable.append(row);
      }
    },
    error: function(xhr, status, error) {
    }
  });
}



	</script>
</body>
</html>