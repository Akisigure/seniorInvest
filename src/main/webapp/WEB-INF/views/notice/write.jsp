<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon-removebg-preview.ico" />
<title>공지 작성</title>
<style>
	.orange{background-color: orange; width : 50px;}
	table{border-collapse : collapse; width : 800px;}
</style>
</head>
<body>
<form method="post" id="writeform" action="write">
	<table border="1">
		<tr>
			<td class="orange">제목</td>
			<td><input name="title"/></td>
		</tr>
		<tr>
			<td class="orange">작성자</td>
			<td><input name="userid" value="${userid}" readonly></td>
		</tr>
		<tr>
			<td class="orange">내용</td>
			<td><div id="smarteditor">
        	<textarea name="content" id="editorTxt" 
                  rows="20" cols="10" 
                  placeholder="내용을 입력해주세요"
                  style="width: 700px"></textarea>
      </div></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" id="save" value="새글 등록"> 
			</td>
		</tr>
	</table>

</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

  </script>
</body>
</html>	
