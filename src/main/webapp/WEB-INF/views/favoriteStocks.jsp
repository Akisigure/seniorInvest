<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Favorite Stocks</title>
</head>
<body>
    <h1>Favorite Stocks</h1>
    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>User ID</th>
                <th>Account ID</th>
                <th>Item Name</th>
                <th>VS</th>
                <th>Float Rate</th>
                <th>Market Price</th>
                <th>Favorited</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${favoriteStocks}" var="favoriteStock">
                <tr>
                    <td>${favoriteStock.no}</td>
                    <td>${favoriteStock.userId}</td>
                    <td>${favoriteStock.accountId}</td>
                    <td>${favoriteStock.itmsNm}</td>
                    <td>${favoriteStock.vs}</td>
                    <td>${favoriteStock.fltRt}</td>
                    <td>${favoriteStock.mkp}</td>
                    <td>${favoriteStock.favorited}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
