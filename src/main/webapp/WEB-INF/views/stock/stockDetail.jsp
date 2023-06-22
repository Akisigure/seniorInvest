<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${itmsNm} : ${detail.mkp}원</title>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
</head>
<style>
    * {
        margin: 0px;
        padding: 0px;
        text-decoration: none;
        font-family:sans-serif;
        text-align: center;
    }
    
    .container {
    		display: flex;
    		justify-content: space-between;
    }
    

    body {
        background-image:#34495e;
    }

    .bg {
        background-color: #fff;
        margin: 10px;
        padding: 10px;
        border-radius: 5px;
    }

    .fw-bold {
    	font-size:30pt;
        font-weight: bold;
        color: black;
        
    }

    .text-primary {
        color: #2ecc71;
        padding-top: 20px;
    }

    .text-center {
        text-align: center;
    }

    .mx-auto {
        margin: 0 auto;
    }
    
    #stockbuy{
      background: linear-gradient(125deg, #8BC34A, #4CAF50, #8BC34A);
      color:white;
      border:none;
      font-size:16pt;
      font-weight: bold;
      cursor:pointer;
      width : 10vw;
	  height : 5vh;
	  border-radius:10px;
	  margin-right: 10px;
	  
    }
    
    #loadingAnimation {
    		
    		margin-top: 120px;
    		
    }
    
    #myChart {
    		display: flex;
    		height: 25vh;
    		width: 	50vw;
    }
    
    #stockbuy:hover {
	color: black;
	transition : 0.5s;
	transform: scale(1.2);
}

#stocksell {

      background: linear-gradient(125deg, #8BC34A, #4CAF50, #8BC34A);
      color:white;
      border:none;
      font-size:16pt;
      font-weight: bold;
      cursor:pointer;
      width : 10vw;
	  height : 5vh;
	  border-radius:10px;
	  margin-left: 10px;
	  
    
}

#stocksell:hover {
	color: black;
	transition : 0.5s;
	transform: scale(1.2);

}
     
</style>
<body>
<jsp:include page="../home/header.jsp"></jsp:include>
<div class="container">
    <div class="text-center mx-auto">
        <div id="stockname" class="text-primary">
            <h2 class="fw-bold">이름 : ${itmsNm}</h2>
        </div>
        <div id="stockMarketPrice" class="bg">
            <h2>가격 : <span><fmt:formatNumber value="${detail.mkp}" type="number"></fmt:formatNumber>원</span></h2>
        </div>
        <div id="stockRate" class="bg">
            <h2>전일대비 : <span>${detail.fltRt}% </span></h2>
        </div>
        <div id="stockVariance" class="bg">
            <h2>변동가격 : <span><fmt:formatNumber value="${detail.vs}" type="number"></fmt:formatNumber>원</span></h2>
        </div>
        <div> 
            <form method="get" action="/stockBuy">
                <input type="hidden" name="itmsNm" value="${detail.itmsNm}">
                <input type="hidden" name="srtnCd" value="${detail.srtnCd}">
                <input type="submit" value="매수하기" id="stockbuy">
                <input type="button" onclick="location.href='/Mypage'" value="매도하기" id="stocksell">
            </form>
        </div>
        <div id="loadingAnimation"><img src="../img/Loading_icon.gif"></div>
        <canvas id="myChart"></canvas>
    </div>
    </div> <!-- container -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
    $(function() {
    	
    		$("#loadingAnimation").show();

    	
        const APIKEY = "<c:out value='${APIKEY}'/>";
        let stockName = "<c:out value='${itmsNm}'/>";
       	let scVs = "<c:out value='${detail.vs}'/>";
       	let scFltRt = "<c:out value='${detail.fltRt}'/>";
       	
        let url = "https://apis.data.go.kr/1160100/service/GetStockSecuritiesInfoService/getStockPriceInfo?serviceKey=" + APIKEY;
        let y = new Date();
        let z = new Date();

        y.setDate(y.getDate() - 1); // 어제 날짜 세팅
        z.setDate(z.getDate() - 12);
        

        
        let yesterday = y.getFullYear() + ("0" + (y.getMonth() + 1)).slice(-2)  + ("0" + y.getDate()).slice(-2);

        let twoWeek = z.getFullYear() + ("0" + (z.getMonth() + 1)).slice(-2)  + ("0" + z.getDate()).slice(-2);

        console.log(yesterday);
        console.log(twoWeek);

        $.getJSON(url + "&resultType=json&beginBasDt=" + twoWeek + "&endBasDt=" + yesterday + "&itmsNm=" + stockName, function(data) {
        	console.log(data);
        		
        	$("#loadingAnimation").hide();
        		
            let chartInfo = data.response.body.items.item;
            let monthList = [];
            let monthData = [];

            chartInfo.forEach(function(item, index) {
                let date = item.basDt;
                let price = item.mkp;
				
                let formattedDate = date.substring(0, 4) + "년" + date.substring(4, 6) + "월" + date.substring(6) + "일";
                monthList.unshift(formattedDate);
                monthData.unshift(price);
            });

            updateChart(monthList, monthData);
        }); //API호출

        function updateChart(labels, data) {
            const ctx = document.getElementById('myChart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        data: data,
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    }]
                },

                options: {
                    responsive: false,
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            });
        } //chart 호출
       
        $("#stockRate span").css("color", scVs < 0 ? "blue" : (scVs > 0 ? "red" : ""));
        $("#stockVariance span").css("color", scFltRt < 0 ? "blue" : (scFltRt > 0 ? "red" : ""));

        
        
 
    }); //ready
    </script>
</body>
</html>