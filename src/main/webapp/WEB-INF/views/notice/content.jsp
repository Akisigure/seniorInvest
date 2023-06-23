<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
<title>${dto.title}</title>
<style>

* {
	font-size: 20px;


}

#notice_container {
  padding-top:10%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
table{width: 100%;}
table td {
  padding: 10px; /* 셀 내부 여백을 추가합니다. */
  /* 원하는 너비와 높이 값으로 설정하세요. */
  width: 200px;
  height: 50px;
  font-weight: bold;
}

.link {
	padding-top: 5%;
}

a {
text-decoration:none;
justify-content:center;
margin-right: 30px;
}

</style>
</head>
<body>
<jsp:include page="/header"></jsp:include>
<div id="notice_container">
<div class="tbl">
<table border="0"> 
	<tr><td style="text-align:center;">제목</td><td>${dto.title}</td></tr>
	<tr><td style="text-align:center;">작성자</td><td>${dto.userid}</td></tr>
	<tr><td style="text-align:center;">내용</td><td>${dto.content}</td></tr>
	<tr><td style="text-align:center;">등록일</td><td><fmt:formatDate value="${dto.regdate }" dateStyle="long"/></td></tr>
	<tr><td style="text-align:center;">조회수</td><td>${dto.readcount}</td></tr>
</table>
</div>
<div class = "link"> 
	<sec:authorize access="hasRole('ROLE_ADMIN')" >
	<c:if test="${ userid == dto.userid }">
		<a href="/admin/notice/update/${dto.noticeNo}">글 수정 </a> 
		<a href="/admin/notice/delete/${dto.noticeNo}">글 삭제</a>
	</c:if>
	</sec:authorize>
	<a href="../list">목록 이동</a> 
</div>
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