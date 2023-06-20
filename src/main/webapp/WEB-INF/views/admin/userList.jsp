<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
<title>안심증권</title>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
</head>
<body>
<!-- header -->
<jsp:include page="/adminheader"></jsp:include>
<!-- // header -->
	<div id="wrap">		
		<!-- header -->
		<div id="header">
			<h1> 이용자 리스트 </h1>
		</div><!-- // header -->
		
		<div id="getUserList" align="right">
			<form>
			<select name="searchn">
			<option value="userName">이름</option>
			<option value="email">이메일</option>
			<option value="address">주소</option>
			</select>
			<input type="text" name="search" size="20" maxlength="50" /> &nbsp;
			<%-- <a href="/admin/userList?search=${search}&searchn=${searchn}" class="btn btnP_05 btnC_02" style="float: right;">
				<span>검색</span>
			</a> --%>
			<input type="submit" value="검색" class="btn btnP_03 btnC_02" style="float: right;">
			</form>	
		</div>
	
		<div id="container" >
		<p class="all_txt"> <span>(전체 이용자 : ${count})</span></p>
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
					<thead></thead>
				<tbody>
				<tr>
					<th>가입일자</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>주소</th>
				</tr>
				<c:forEach items="${uList}" var="user">
					<tr>
						<td><fmt:formatDate value="${user.joinedDate }" dateStyle="short"/> </td>
						<td>${user.userName}</td>
						<td>${user.phoneNumber }</td>
						<td>${user.email }</td>
						<td>${user.address }</td>
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
			사용자가 존재하지 않습니다.
</c:if>
	</div>
	</div>
</body>
</html>