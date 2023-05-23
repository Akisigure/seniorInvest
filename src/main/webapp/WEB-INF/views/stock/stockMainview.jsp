<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>실시간 거래량 top10</title>
</head>
<body>
    <h1>실시간 거래량 top10</h1>
    <table>
        <thead>
            <tr>
                <th>종목명</th>
                <th>전일 대비</th>
                <th>등락률</th>
                <th>가격</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="stock" items="${stockMainview}">
                <tr>
                    <td><c:out value="${stock.itmsNm}"/></td>
                    <td><c:out value="${stock.vs}"/></td>
                    <td><c:out value="${stock.fltRt}"/></td>
                    <td><c:out value="${stock.mkp}"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>