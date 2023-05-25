<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>안심증권</title>
<link rel="stylesheet" href="/css/base.css" />
<script src="/js/script.js"></script>
<script>
function getselect() {
	//카테고리 value 값 가져오기
	var getCategory  = document.getElementById("category");
	var category = (getCategory.options[category.selectedIndex].value);
}
</script>
</head>
<body>
<div id="wrap">
	<!-- header -->
	
	
	<!-- // header -->
	
	<!-- container -->
	<div id="container">
		<form method="post" name="qaform" action="/qa/qaRegister">
			<fieldset>
				<legend>게시판 글쓰기 입력폼</legend>
				<input type="hidden" name="no" value="${dto.no}" />
				<input type="hidden" name="ref" value="${dto.ref}" />
				<input type="hidden" name="re_step" value="${dto.re_step}" />
				<input type="hidden" name="re_level" value="${dto.re_level}" />
				<div class="table_grp">
					<div class="table_type_01">
						<table>
							<colgroup>
								<col style="width:120px;" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">제목</th>
									<td>
										<c:if test="${dto.no == 0 }">
										<input type="text" class="txt" name="subject" maxlength="50" />	
										</c:if>
										<c:if test="${dto.no != 0 }">
										<input type="text" class="txt" name="subject" maxlength="50" value="[답변]" />	
										</c:if>
									</td>
								</tr>
								
								<tr>
									<th scope="row">카테고리</th>
									<td>
										<select name="category" id ="category" onChange="getselect()" required>
										    <option value="">카테고리를 선택해주세요</option>
										    <option value="단순문의">단순문의</option>
											<option value="결제문의">결제문의</option>
											<option value="보안문의">보안문의</option>
											<option value="기술문의">기술문의</option>
										</select>
									</td>
								</tr>
							</tbody>
							</table>
							<div class="textarea_grp">
											<pre><textarea name="content"></textarea></pre>
							</div>
					</div>
					<div class="btn_align_02" style="float: right;">
						<span class="btn btnF_03 btnC_02 mr5">
							<input type="submit" value="작성" />
						</span>
					</div>
				</div>
			</fieldset>
		</form>
	</div><!-- // container -->
</div><!-- // wrap -->
</body>
</html>