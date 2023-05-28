<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>유의종목 : ${itmsNm}</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/warning.css">
<body>
<jsp:include page="../home/header.jsp"></jsp:include>
<div class="container">
<div class="form">
<form method="get" action="/AgreeStockBuy">
<div class="warning">
<h1 id="warning_name">종목명 : ${itmsNm}</h1><br>
<h1>해당 종목은 급격한 변동성으로 인해 유의종목으로 지정되었습니다.</h1><br><br>
<h1>거래하시겠습니까?</h1>
</div>
<input type="hidden" name="srtnCd" value="${srtnCd}">
<input type="hidden" name="itmsNm" value="${itmsNm}">
<div class="div_btn">
<input type="submit" value="예" id="btn_yes" class="btn btn-outline-danger">
<button type="button" onclick="window.location.href='/stockSearch'" id="btn_no" class="btn btn-outline-success">아니오</button>

</div>
</form>
</div> <!-- form -->
</div> <!-- container -->
<script>

</script>
</body>
</html>