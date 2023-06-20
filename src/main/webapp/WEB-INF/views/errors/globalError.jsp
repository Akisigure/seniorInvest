<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>문제발생</title>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}
.error_container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 60vh;
	text-align: center;
}

#error_message {
	padding-top: 5%;
	font-family: 'NanumSquareNeo-Variable';
	font-weight: bold;
	font-size: 34pt;
}

.div_btn {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-top: -5%;
}

#btn {
  width: 10vw;
  height: 5vw;
  display: inline-block;
}

#btn:hover {
  transition: 0.5s;
  transform: scale(1.2);
}

</style>
</head>
<body>
<div class="error_container">
<h2 id = "error_message">페이지 로딩중 문제가 발생했습니다.</h2>
</div>
<div class="div_btn">
<button id="btn" onclick="location.href='/'" class="btn btn-outline-success">메인으로 돌아가기</button>
</div>
</body>
</html>