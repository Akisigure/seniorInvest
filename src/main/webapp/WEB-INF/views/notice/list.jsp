<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
<!--  bList begin end count pageNum totalPages -->
<title>글 목록</title>
<style>
#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {border: 1px solid black;
	background-color: orange;
	width: 150px;
}
td{border: 1px solid black;}
a {
	margin: 10px auto;
}

#page {
	text-align: center;
}
</style>
</head>
<body>
<jsp:include page="/header"></jsp:include>
	<div id="center">
		<h1>게시글 목록</h1>
		
		<div align="right">
			<a href="/">메인화면</a>
			<sec:authorize access="hasRole('ROLE_ADMIN')" > 
				<a href="/admin/notice/write">새글 등록</a>
			</sec:authorize>
		</div>
		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${nList}" var="notice">
					<tr>
						<td><a href ="content/${notice.noticeNo}">${notice.title}</a></td>
						<td>${notice.userid}</td>
						<td><fmt:formatDate value="${notice.regdate }" dateStyle="short"/> </td>
						<td>${notice.readcount }</td>
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="list?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin}" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
</c:if>
<div id = "search" align="center">
<form action="search">
	<select name="searchn">
		<option value="0">제목</option>
		<option value="1">내용</option>
		<option value="2">작성자</option>
	</select>
	<input type="text" name="search" size="15" maxlength="50" />
	<input type="submit" value="검색" />
</form>
</div>
	</div>
</body>
</html>