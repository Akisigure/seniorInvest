<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
<!--  bList begin end count pageNum totalPages -->
<title>공지사항</title>
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
	background-color: olive;
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
 <link rel="stylesheet" href="/css/list.css">
</head>
<body>
<jsp:include page="/header"></jsp:include>
	<div id="center" style="padding-top: 2.5%">
		<h1>게시글 목록</h1>
	<section class="notice">
  <div class="page-title">
        <div class="container">
            <h3><b>공지사항</b></h3>
        </div>
    </div>
       <!-- board seach area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="">
                    <div class="search-wrap">
                        <label for="search" class="blind">공지사항 내용 검색</label>
                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                        <button type="submit" class="btn btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
		
		<div align="right">
			<sec:authorize access="hasRole('ROLE_ADMIN')" > 
				<a href="/admin/notice/write">새글 등록</a>
			</sec:authorize>
		</div>
		<c:if test="${count != 0 }">
		 <!-- board list area -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
				<tr>
					<th scope="col" class="th-title">제목</th>
					<th scope="col" class="th-title">작성자</th>
					<th scope="col" class="th-date">작성일</th>
					<th scope="col" class="th-num">조회수</th>
				 </tr>
                </thead>
                <tbody>
				<c:forEach items="${nList}" var="notice">
					<tr>
						<td><a href ="content/${notice.noticeNo}">${notice.title}</a></td>
						<td>관리자</td>
						<td><fmt:formatDate value="${notice.regdate }" dateStyle="short"/> </td>
						<td>${notice.readcount }</td>
					</tr>
				</c:forEach>
			</table>
			</div>
			</div>
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="list?p=${begin-1 }"  class="new">[이전]</a>
				</c:if>
				<c:forEach begin="${begin}" end="${end}" var="i">
					<a href="list?p=${i}"  class="new">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}"  class="new">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
</c:if>
<div class="new">
			<sec:authorize access="hasRole('ROLE_ADMIN')" > 
			<button onclick="location.href='/admin/notice/write'">새글 등록</button>
			</sec:authorize>
		</div>
</section>
</body>
</html>