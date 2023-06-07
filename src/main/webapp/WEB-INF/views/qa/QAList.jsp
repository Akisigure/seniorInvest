<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>안심증권</title>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
</head>
<body>
<!-- header -->
<jsp:include page="/header"></jsp:include>

<div id="wrap">
	<!-- container -->
	<div id="container" >
		<h1>질문 및 답변</h1>
		<p class="all_txt">글목록 <span>(전체글 : ${count})</span></p>
		
		<div class="table_grp">
			<div class="table_type_04">
				<table>
					<colgroup>
						<col style="width:10%;" />
						<col style="width:12%;" />
						<col />
						<col style="width:12%;" />
						<col style="width:12%;" />
						<col style="width:12%;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${count == 0}">
							<tr>
								<td colspan="5" class="tac">게시판에 저장된 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${count > 0}">
							<c:forEach var="article" items="${bList}">
							<tr>
								<td>
									<c:out value="${start}"/>
									<c:set var="start" value="${start+1}" />
									
								</td>
								<td>
									${article.category}
								</td>
								<td class="subject">
									<a href="qaDetail/${article.no}">
										<c:if test="${article.re_level > 0 }">
										<!-- 답변글이있으면 -->
										<span class="icon">
										<img src="/img/level.gif" width="${article.re_level * 10}">	
										<img src="/img/re.gif" alt="답변" /></span>
										</c:if>
										${article.subject}

									</a>
								</td>
								<td>
									${article.id}
								</td>
								<td><fmt:formatDate value="${article.regdate }" dateStyle="short"/></td>
								<td>${article.readcount}</td>
								
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			
		</div>
		
		<!-- 페이징 -->
		<div class="paging">
		<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="qaList?p=${begin-1 }" class="page prv">&lt;</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="qaList?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="qaList?p=${end+1}" class="page next">&gt;</a>
				</c:if>
			</div>
		</div>	
		<br>
	</div><!-- // container -->
</div><!-- // wrap -->

	<div class="btn_align_02">
			<a href="qaRegister" class="btn btnF_03 btnC_02" style="text-align: center;">
				<span>등록하기</span>
			</a>
	</div><br>
</body>
</html>