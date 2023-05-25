<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>안심증권</title>
<link rel="stylesheet" type="text/css" href="/css/base.css" />
</head>
<body>
<input type="hidden" id="no" th:value="${dto.no}">
<div id="wrap">
	<!-- header -->
	<div id="header">
	</div><!-- // header -->
	
	<!-- container -->
	<div id="container">
			
			<div class="table_grp">
				<div class="table_type_01">
					<table>
						<colgroup>
							<col style="width:120px;" />
							<col />
							<col style="width:120px;" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">글번호</th>
								<td id="no">${dto.no}</td>
								<th scope="row">조회수</th>
								<td>${dto.readcount}</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>${dto.id}</td>
								<th scope="row">작성일</th>
								<td>${dto.regdate}</td>
							</tr>
							<tr>
								<th scope="row">글제목</th>
								<td colspan="3">${dto.subject}</td>
							</tr>
							<tr>
								<th scope="row">글내용</th>
								<td colspan="3"><pre>${dto.content}</pre></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
				<div class="btn_align_02" style="float: left;">
					<span class="btn btnF_03 btnC_02">
						<input type="button" value="목록" onclick="location.href='../qaList'" />
					</span>	
				</div>
				<c:if test="${comm.id ==user.users.userid }"> 
				<div class="btn_align_02" style="float: right;">
					<span class="btn btnF_03 btnC_02">
						<input type="button" value="삭제" onclick="location.href='../qaDelete?no=${dto.no}'" />
					</span>&nbsp;		
					<span class="btn btnF_03 btnC_02">
						<input type="button" value="수정" onclick="location.href='../qaForm/${dto.no}'" />
					</span>	
				</div>
				</c:if>
				</div><br><br><br><br><hr><br>
				<!-- //comment -->
				<footer>
				<div>
					<div id="comm">
					<p style="font-size: 15px; font-weight:bolder">댓글</p><br>
					<c:forEach items="${cList}" var="comm">
						<div title="${comm.no}"></div>	
						<div>${comm.id} / <fmt:formatDate value="${comm.regdate }" dateStyle="short"/></div>
						<c:if test="${comm.id ==user.users.userid }"> 
							<span style="float: right;">
								<button class="dbtn" id="${comm.cno}">삭제</button>
								<button type="button" class="ubtn" onclick="location.href='/qa/commentUpdate/${comm.cno}'">수정</button>
								<%-- <button class="ubtn" id="${comm.cno}">수정</button> --%>
							</span>
						</c:if>
						<div>${comm.content }
						</div>	
						<hr>			
					</c:forEach>
					</div>
					<br><br><br><br><br><hr><br>
					<p style="font-size: 15px; font-weight:bolder">댓글 작성</p><br>
					<div class="textarea_grp">
						<pre><textarea id="content" name="content"></textarea></pre><br>
					</div>
					<span class="btn btnF_03 btnC_02" style="float: right;">
						<input type="button" value="등록" id="add" />
					</span>	
				</div>
				</footer>
			
		</div>
	</div><!-- // container -->
</div><!-- // wrap -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#add").click(function(){
			
			let id = "${user.users.userid}";
			let content = $("#content").val();
			let no = ${dto.no};
			
			
			$.ajax({url:"/qa/commentRegister",
				data:"no="+no+"&id="+id+"&content="+content,
				method:"get",
				dataType:"json"
			}).done(function(resp){
				let clist="";
				resp.forEach(function(comm,index){
					clist += "<br><div>"+comm.id+" / "+new Date(comm.regdate).toLocaleDateString() 
					+ "</div><div>"+comm.content;
					if(id == comm.id){
						clist +='<button class="dbtn" id="'+comm.cno+'" style="float: right;">삭제</button>';
					} 
					clist+="</div><hr>"
					
				});
				
				$("#comm").html(clist);
				$("#content").val("");
			});
			
		})//click
		$("#comm").on("click",".dbtn",function(){
			let cno = $(this).attr("id");
			$.ajax({url:"/qa/commentDelete/"+cno,
				method:"POST"
		}).done(function(cno){		
				$("[cno="+cno+"]").remove();	
		});
		

		})//click
	})//ready

</script>

</body>
</html>