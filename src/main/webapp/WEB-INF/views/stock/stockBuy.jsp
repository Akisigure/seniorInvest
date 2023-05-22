<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>매수화면</title>
</head>
<body>
종목명 : ${itmsNm}
시장가 : ${detail.mkp}
전일대비 : ${detail.fltRt}
변동가격 : ${detail.vs}

<form method="post" action="/orderComplete">
<input type="text" name="quantity" placeholder="수량을 입력해주세요">
<input type="text" name="orderPrice" placeholder="원하시는 가격대를 적어주세요">
<input type="hidden" name="srtnCd" value="${srtnCd}">
<input type="submit" value="매수하기">
</form>
</body>
</html>