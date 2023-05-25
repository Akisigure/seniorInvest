<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>안심증권</title>
<link rel="stylesheet" href="/css/base.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div id="wrap">
	<!-- header -->
	
	
	<!-- // header -->
	
	<!-- container -->
	<div id="container">
		<form method="post" name="qaform">
			<fieldset>
				<input type="hidden" name="no" value="${dto.no}" />
				<input type="hidden" name="_method" value="put" />
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
										<input type="text" class="txt" name="subject" maxlength="50" value="${dto.subject}" />
									</td>
								</tr>
								
								<tr>
									<th scope="row">카테고리</th>
								
									<td>
										<select name="category" required>
										    <option value="">카테고리를 선택해주세요</option>
										    <option value="단순문의">단순문의</option>
										    <option value="결제관련">결제관련</option>
										    <option value="기술관련">기술관련</option>
										    <option value="보안관련">보안관련</option>
										</select>
									</td>
								</tr>
							</tbody>
							</table>
							<div class="textarea_grp">
											<pre><textarea name="content">${dto.content}</textarea></pre>
							</div>
					</div>
					<div class="btn_align_02" style="float: right;">
						<span class="btn btnF_03 btnC_02">
							<input type="submit" value="수정" onclick="location.href='../qaForm/${dto.no}'"/>
						</span> 
					</div>
					<div class="btn_align_02" style="float: right;">
						<span class="btn btnF_03 btnC_02">
						<input type="button" value="취소" onclick="location.href='../qaDetail/${dto.no}'" />
						</span>		
					</div>
				</div>
			</fieldset>
		</form>
	</div><!-- // container -->
</div><!-- // wrap -->
</body>
</html>