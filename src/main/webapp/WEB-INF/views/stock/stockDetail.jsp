<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${itmsNm}</title>
    
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
    	<input type="hidden" name="itmsNm" value="${itmsNm}">
    	<input type="hidden" name="srtnCd" value="${detail.srtnCd}">
    	<input type="submit" value="매수하기">
    </form>
    </div>
    <!--  <div id="stockChart" class="dd"></div> -->
    <canvas id="myChart" width="500" height="150"></canvas>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
	}); //getJSON
	
	
	

		
	    function addZero(i) {
			var rtn = i + 100;
			return rtn.toString().substr(1, 3);
		}

		var monthList = [];
		var monthData = [50,60,70,45,50,66];

		var dt = new Date();
		var year = dt.getFullYear();
		var mon = addZero(eval(dt.getMonth()+1));		
		var now = year+mon;

		for(var i = (now - 5); i <= now; i++){
			var format =  i;
			monthList.push(format);
		}

		const ctx = document.getElementById('myChart').getContext('2d');
		const myChart = new Chart(ctx, {
			type: 'line',
			data: {
				labels: monthList,
				datasets: [{
					data: monthData,
					borderColor:'rgba(255, 99, 132, 1)',
					borderWidth: 1
				}]
			},

			options: {
			  responsive: true,
			  plugins: {
				legend: {
				  display: false
				}
			  }
			}
		}); //chart
	
})



</script>
</body>
</html>