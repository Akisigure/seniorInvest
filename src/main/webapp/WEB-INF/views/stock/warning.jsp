<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>유의종목 : </title>
</head>
<body>
<form method="post" action="/AgreeStockBuy">
<h1>해당 종목은 급격한 변동성으로 인해 유의종목으로 지정되었습니다.</h1>
<h1>거래하시겠습니까?</h1>
<input type="hidden" name="srtnCd" value="${srtnCd}">
<input type="hidden" name="itmsNm" value="${itmsNm}">

<input type="submit" value="예">
</form>
<button onclick="window.location.href='/stockSearch'">아니오</button>
<script>

</script>
</body>
</html>