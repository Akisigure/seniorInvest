<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Favorite Stocks</title>
    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
</head>
<body>
<h1>Favorite Stocks</h1>

<!-- Display session information -->
<p>Session ID: ${pageContext.session.id}</p>
<p>Username: ${sessionScope.username}</p>
<p>Userid: ${sessionScope.userid}</p>

<table>
    <tr>
        <th>Item Name</th>
        <th>VS</th>
        <th>Float Rate</th>
        <th>MKP</th>
        <th>Favorited</th>
    </tr>
    <c:forEach items="${favoriteStocks}" var="stock">
        <tr>
            <td>${stock.itmsNm}</td>
            <td>${stock.vs}</td>
            <td>${stock.fltRt}</td>
            <td>${stock.mkp}</td>
            <td>${stock.favorited}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
