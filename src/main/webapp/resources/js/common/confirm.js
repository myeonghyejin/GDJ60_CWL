$('#boardConfirm').click(function(){
	//board
	if(!$('#boardTitle').val()) {
		alert("제목을 입력하세요.")
		return;
	}
	else if(!$('#boardContents').val()){
		alert("내용을 입력하세요.")
		return;
	} 
	//submit
	else{
		$('#frm').submit();
	}
})

//lesson
$('#lessonConfirm').click(function(){
	if(!$('#lessonTitle').val()){
		alert("제목을 입력하세요.")
		return;
	}
	else if(!$('#lessonTitle').val()){
		alert("제목을 입력하세요.")
		return;
	}
	else if(!$('#lessonTeacher').val()){
		alert("크리에이터를 입력하세요.")
		return;
	}
	else if(!$('#lessonUrl').val()){
		alert("URL을 입력하세요.")
		return;
	}
	else if(!$('#lessonContents').val()){
		alert("내용을 입력하세요.")
		return;
	}
	// else if(!$('#img').val()){
	// 	alert("최소 1장 이상의 썸네일을 첨부하세요.")
	// 	return;
	// }

	//submit
	else{
		$('#frm').submit();
	}
})

$('#productConfirm').click(function(){
	if(!$('#productName').val()){
		alert("제목을 입력하세요.")
		return;
	}
	else if(!$('#productPrice').val()){
		alert("가격을 입력하세요.")
		return;
	}
	else if(!$('#productDetail').val()){
		alert("내용을 입력하세요.")
		return;
	}
	else if(!$('#productStock').val()){
		alert("재고를 입력하세요.")
		return;
	}
	else if(!$('#imgs').val()){
		alert("최소 1장 이상의 제품 사진을 첨부하세요.")
		return;
	}
	//submit
	else{
		$('#frm').submit();
	}
})