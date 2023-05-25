<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>매수화면</title>
</head>
<style>


.stockBuy {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 400px;
  height: auto;
  padding: 30px;
  background-color: #FFFFFF;
  border-radius: 15px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.stockBuy p {
  margin: 10px 0;
  font-size: 17pt;
  font-weight: bold;
}

.textForm {
  margin-bottom: 25px;
}

.textForm input {
  margin-bottom: 15px;
  padding: 10px;
  width: 100%;
  border: none;
  border-bottom: 2px solid #adadad;
  outline: none;
  color: #636e72;
  font-size: 16px;
  background: none;
  transition: border-bottom-color 0.3s;
}

.textForm input::placeholder {
  color: #adadad;
}

.textForm input:focus {
  border-bottom-color: #2ecc71;
}

.btn {
  display: inline-block;
  margin-top: 20px;
  padding: 10px 20px;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  color: white;
  background: linear-gradient(125deg, #2ecc71, #27ae60, #2ecc71);
  border-radius: 5px;
  border: none;
  cursor: pointer;
  transition: background 0.3s;
}

.btn:hover {
  background: linear-gradient(125deg, #27ae60, #2ecc71, #27ae60);
}
}
</style>
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

<form method="post" action="/orderComplete" class="stockBuy">

<p>종목명 : ${itmsNm} </p>
<p>시장가 : ${detail.mkp} </p>
<p>전일대비 : ${detail.fltRt} </p>
<p>변동가격 : ${detail.vs} </p>

		<div class="textForm">
		<input type="text" name="quantity" id="quantity" placeholder="수량을 입력해주세요">
		<input type="text" name="orderPrice" id="orderPrice" placeholder="원하시는 가격대를 적어주세요">
		<input type="hidden" name="srtnCd" value="${srtnCd}">
		<input type="hidden" name="itmsNm" value="${itmsNm}">
		</div>
		<input type="submit" value="매수하기" class="btn">
	</form>
</body>
</html>