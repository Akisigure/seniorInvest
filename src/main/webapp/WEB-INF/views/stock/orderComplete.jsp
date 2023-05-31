<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
<title>주문 완료</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/orderComplete.css">
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<div class="complete_container">

	<h2>매수주문이 완료되었습니다.</h2>
	<br><br><br>
	<h4>새로운 주식을 확인해보세요</h4>

<div class="div_btn">
<button class="button" id="btn" onclick="location.href='/stockSearch'">주식 검색</button>
<button class="button" id="btn" onclick="location.href='/Mypage'">매수주문 확인</button>
</div>
</div>
<script>

function noEvent() {
    if (event.keyCode == 116) {
        event.keyCode= 2;
        return false;
    }
    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
    {
        return false;
    }
}
window.history.forward(); function noBack(){ 
	  window.history.forward();
	}

document.onkeydown = noEvent;

</script>


<body oncontextmenu="return false">
</html>