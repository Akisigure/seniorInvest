<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
<title>안심증권</title>
<script type="text/javascript">
	window.setTimeout('window.location.reload()',60000); //1분마다 새로 고침
</script>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
</head>
<body>
<!-- header -->
<jsp:include page="/adminheader"></jsp:include>
<!-- // header -->
	<div id="wrap">		
		<!-- header -->
		<div id="header">
			<h1> 거래내역 리스트 </h1>
		</div><!-- // header -->
			<div align="left">
				<a href="/admin/tradeList" class="btn btnP_05 btnC_02">
						<span>매수</span>
				</a>
				<a href="/admin/tradeSellList" class="btn btnP_05 btnC_02">
					<span>매도</span>
				</a>
			</div>
		
	
		<div id="container" >
		<c:if test="${count != 0 }">
					
		<div class="table_grp">
			<div class="table_type_04">
			
			<table>
					<colgroup>
						<col style="width:14%;" />
						<col style="width:14%;" />
						<col style="width:14%;" />
						<col style="width:14%;" />
						<col style="width:14%;" />
						<col style="width:14%;" />
						<col style="width:14%;" />

					</colgroup>
					<thead>
				<tbody>
				<tr>
					<th>주문날짜</th>
					<th>주문자id</th>
					<th>종목명</th>
					<th>주문수</th>
					<th>지정가</th>
					<th>금액</th>
					<th>시장가</th>
				</tr>
				<c:forEach items="${tList}" var="trade">
					<tr>
						<td><fmt:formatDate value="${trade.orderDate }" dateStyle="short"/> </td>
						<td>${trade.userid}</td>
						<td>${trade.itmsNm }</td>
						<td>${trade.tradeQuantity }</td>
						<td>${trade.orderPrice } 원</td>
						<td>${ trade.orderPrice * trade.tradeQuantity } 원</td>
						<td>${trade.mkp } 원</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			</div>
			
			
			<!--페이징-->
			<div class="paging">
				<div id="page">
					<c:if test="${begin > pageNum }">
						<a href="search?p=${begin-1}&search=${search}&searchn=${searchn}">[이전]</a>
					</c:if>
					<c:forEach begin="${begin }" end="${end}" var="i">
						<a href="search?p=${i}&search=${search}&searchn=${searchn}">${i}</a>
					</c:forEach>
					<c:if test="${end < totalPages }">
						<a href="search?p=${end+1}&search=${search}&searchn=${searchn}">[다음]</a>
					</c:if>
				</div>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
			거래 내역이 존재하지 않습니다.
</c:if>
	</div>
	</div>
	

</body>
</html>