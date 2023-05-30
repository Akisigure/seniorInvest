<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>공시확인</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/disclosure.css">
<style>


</style>
<body>
<jsp:include page="../home/header.jsp"></jsp:include>
<div class="description">
<div id="info">최근 주요 공시를 확인할 수 있어요</div>
<div id="dataTable">
	<table style="margin-left: auto; margin-right: auto;">
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
	</div>
	<div id="dataContainer"></div>
	</div>
	<div id="loadingSpinner"><img src="../img/Loading_icon.gif" id="image"></div>
	<div id="holi"></div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(function() {
		  let holiday = '<c:out value="${holiday}"/>';

		  if (holiday == 6) {
		    $("#dataTable").hide();
		    $("#holi").append("오늘은 토요일이므로 공시가 없습니다.")
		  }
		  if (holiday == 7) {
		    $("#dataTable").hide();
		    $("#holi").append("오늘은 일요일이므로 공시가 없습니다.")
		  }

		  //reloadData();

		  setInterval(reloadData, 600000); // 10분 = 600000 밀리초

		  $(document).ajaxStart(function() {
			  console.log("ajax start");
			  $("#dataTable").hide();
			  $("#loadingSpinner").addClass("show");
			});

			$(document).ajaxStop(function() {
			  console.log("ajax stop");
			  $("#dataTable").show();
			  $("#loadingSpinner").addClass("show");
			  $("#image").css("display", "none");
			});
		  
		  $.ajax({
			    url: 'ajax/disclosure',
			    type: 'POST',
			    dataType: 'json',
			    global: true,
			    cache: true,
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
			    	$("#dataTable").hide();
			    	$("#holi").append("정보를 받아오는중 오류가 발생했습니다.");
			    	
			    }
			  });
		  
		});

		function reloadData() {
		  $.ajax({
		    url: 'ajax/disclosure',
		    type: 'POST',
		    dataType: 'json',
		    global: true,
		    cache: false,
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
		    	$("#dataTable").hide();
		    	$("#holi").append("정보를 받아오는중 오류가 발생했습니다.");
		    	
		    }
		  });
		}




	</script>
</body>
</html>