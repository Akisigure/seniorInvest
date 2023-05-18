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

    .bg {
        background-color: #fff;
        margin: 10px;
        padding: 10px;
        border-radius: 5px;
    }

    .fw-bold {
        font-weight: bold;
    }

    .text-primary {
        color: #007bff;
    }

    .text-center {
        text-align: center;
    }

    .mx-auto {
        margin: 0 auto;
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
        <canvas id="myChart" width="500" height="150"></canvas>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
    $(function() {
        const APIKEY = "<c:out value='${APIKEY}'/>";
        let stockName = "<c:out value='${itmsNm}'/>";
        let url = "https://apis.data.go.kr/1160100/service/GetStockSecuritiesInfoService/getStockPriceInfo?serviceKey=" + APIKEY;
        let y = new Date();
        let z = new Date();

        y.setDate(y.getDate() - 1); // 어제 날짜 세팅
        z.setDate(z.getDate() - 10);
        let yesterday = y.getFullYear() + "-" + ("0" + (y.getMonth() + 1)).slice(-2) + "-" + ("0" + y.getDate()).slice(-2);

        let twoWeek = z.getFullYear() + "-" + ("0" + (z.getMonth() + 1)).slice(-2) + "-" + ("0" + z.getDate()).slice(-2);

        console.log(yesterday);
        console.log(twoWeek);

        $.getJSON(url + "&resultType=json&beginBasDt=" + twoWeek + "&itmsNm=" + stockName, function(data) {
        	console.log(data);
        	
            let chartInfo = data.response.body.items.item;
            let monthList = [];
            let monthData = [];

            chartInfo.forEach(function(item, index) {
                let date = item.basDt;
                let price = item.mkp;

                monthList.push(date);
                monthData.push(price);
            });

            updateChart(monthList, monthData);
        });

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
                    responsive: true,
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            });
        }
    });
    </script>
</body>
</html>