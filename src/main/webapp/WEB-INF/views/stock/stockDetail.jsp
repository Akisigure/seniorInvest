<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${itmsNm}</title>
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

body {
  background-image:#34495e;
}



</style>
<body>
    <div class="text-center mx-auto">
    <div id="stockname" class="text-primary">
        <h2 class="fw-bold">이름 : ${itmsNm}</h2>
    </div>
    <div id="stockMarketPrice" class="bg">
        <h2>가격 : ${detail.mkp}</h2>
    </div>
    <div id="stockRate" class="bg">
        <h2>변동률 : ${detail.fltRt}% </h2>
    </div>
    <div id="stockVariance" class="bg">
        <h2>변동가격 : ${detail.vs}</h2>
    </div>
    <div>
    <form method="post" action="/stockBuy">
    	<button type="button" onclick="location.href='stockBuy.jsp' ">매수하기</button>
    </form>
    </div>
    <div id="stockChart" class="dd"></div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>


$(function() {
	const APIKEY = "<c:out value = '${APIKEY}'/>";
	let stockName = "<c:out value = '${itmsNm}'/>";
	let url = "https://apis.data.go.kr/1160100/service/GetStockSecuritiesInfoService/getStockPriceInfo?serviceKey="+APIKEY;
	   let y = new Date();
	   let z = new Date();
	   
	    y.setDate(y.getDate()-1); // 어제 날짜 세팅
	    z.setDate(z.getDate()-10);
	    let yesterday = y.getFullYear()+"-"
	             +("0"+(y.getMonth()+1)).slice(-2)+"-"
	             +("0"+y.getDate()).slice(-2);
	
	    let twoWeek = z.getFullYear()+"-"
        +("0"+(z.getMonth()+1)).slice(-2)+"-"
        +("0"+z.getDate()).slice(-2);

	    console.log(yesterday);
	    console.log(twoWeek);
	

	$.getJSON(url+"&resultType=json&beginBasDt="+twoWeek+"&itmsNm="+stockName,function(data) {
		let chartInfo = data.body.items.item;
		
	
		
		chartInfo.forEach(function(item,index) {
			
		})
	});
	
	
	
	var trace = {
		    x: ['2023-01-01','2023-01-02','2023-01-03'],  // 날짜 데이터를 입력. 예: ['2023-01-01', '2023-01-02', '2023-01-03']
		    y: [100,200,150],  // 주식 가격 데이터를 입력. 예: [100, 200, 150]
		    mode: 'lines',
		    line: {shape: 'line'}
		};


		var data = [trace];

		var layout = {
		    title: stockName,
		    xaxis: {title: '날짜'},
		    yaxis: {title: '주식 가격'},
		};

		// 차트 작성
		Plotly.newPlot('stockChart', data, layout);
	
	
})




// 주식 차트 데이터와 설정


</script>
</body>
</html>