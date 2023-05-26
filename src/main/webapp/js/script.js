function writeSave(){
	if(document.writeform.id.value == ""){
		alert("작성자를 입력하십시요.");
		document.writeform.id.focus();
		return false;
	}
	if(document.writeform.subject.value == ""){
		alert("제목을 입력하십시요.");
		document.writeform.subject.focus();
		return false;
	}

	if(document.writeform.content.value == ""){
		alert("내용을 입력하십시요.");
		document.writeform.content.focus();
		return false;
	}	       
}

function deleteSave(){
	if(document.delForm.passwd.value == ""){
		alert("비밀번호를 입력하세요.");
		document.delForm.passwd.focus();
		return false;
	}
}

//로그인 form에 커서 위치 시키기
function focusIt(){
	document.inform.id.focus();
}
// 빈 입력값 유무
function checkIt(){
	inputForm = eval("document.inform");
	if(!inputForm.id.value){
		alert("아이디를 입력하세요");
		inputForm.id.focus();
		return false;
	}
	if(!inputForm.passwd.value){
		alert("비밀번호를 입력하세요");
		inputForm.passwd.focus();
		return false;
	}
}
