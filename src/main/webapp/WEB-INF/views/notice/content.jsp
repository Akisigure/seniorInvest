<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>${dto.title}</title>
<style>
#container {width: 70%;}
table{width: 100%;}
</style>
</head>
<body>
<div id="container">
<table border="1">
	<tr><td>제목</td><td>${dto.title}</td></tr>
	<tr><td>작성자</td><td>${dto.userid}</td></tr>
	<tr><td>내용</td><td>${dto.content}</td></tr>
	<tr><td>등록일</td><td><fmt:formatDate value="${dto.regdate }" dateStyle="long"/></td></tr>
	<tr><td>조회수</td><td>${dto.readcount}</td></tr>
	<tr><td colspan="2" align="right">
	<sec:authorize access="hasRole('ROLE_ADMIN')" >
	<c:if test="${ userid == dto.userid }">
		<a href="/admin/notice/update/${dto.noticeNo}">글 수정 </a> 
		<a href="/admin/notice/delete/${dto.noticeNo}">글 삭제</a>
	</c:if>
	</sec:authorize>
	<a href="../list">목록 이동</a> 
	</td></tr>
</table>
<!--  cList : List<CommDto>-->
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$(function(){
		$("a[userid]").click(function(){
			let noticeNo = $(this).attr("id");// 글번호
			$.ajax({url:"admin/notice/delete", 
					data:"noticeNo="+noticeNo, 
					method:"delete"
					}
			).done(function(){
				location.href="/notice/list";
			})
			return false;//하이퍼링크 이동 X
		})//click
		
	})//ready

</script>
</body>
</html>