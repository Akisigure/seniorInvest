<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>안심증권</title>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
</head>
<body>
<!-- header -->
<jsp:include page="adminheader"></jsp:include>
<!-- // header -->
	<div id="wrap">		
	<div id="header">
			<h1> 아직 답변하지 않은 QA 게시글 리스트 </h1>
		</div><!-- // header -->
			
		<div id="qaListSearch" align="left">
			<form>
			<select name="search">
				<option value="">전체</option>
				<option value="단순문의">단순문의</option>
				<option value="결제문의">결제문의</option>
				<option value="보안문의">보안문의</option>
				<option value="기술문의">기술문의</option>
			</select>
			<span class="btn btnF_05 btnC_02">
				<input type="submit" value="검색" />
			</span>

			</form>	
		</div>
		<div id="container" >
		<c:if test="${count != 0 }">
			<div class="table_grp">
			<div class="table_type_04">
			<table>
			<colgroup>
						<col style="width:20%;" />
						<col style="width:20%;" />
						<col style="width:20%;" />
						<col style="width:20%;" />
						<col style="width:20%;" />
					</colgroup>
					<thead>
				<tbody>
				<tr>
					<th>아이디</th>
					<th>제목</th>
					<th>작성일</th>
					<th>유형</th>
					<th></th>
				</tr>
				<c:forEach items="${qList}" var="qlist">
					<tr>
						<td>${qlist.id}</td>
						<td>${qlist.subject}</td>
						<td><fmt:formatDate value="${qlist.regdate}" dateStyle="short"/> </td>
						<td>${qlist.category}</td>
						<td><div class="btn_align_02" style="float: right;">

							<a href="/qa/qaReRegister/${qlist.no}" class="btn btnP_05 btnC_02">
								<span>등록</span>
							</a>
						
					</div>
					</td>
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
			답변을 달지않은 글이 존재하지 않습니다.
	</c:if>
	</div>
	</div>
</body>
</html>