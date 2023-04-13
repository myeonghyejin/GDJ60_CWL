//Board
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

//Lesson
$('#lessonConfirm').click(function(){
	if(!$('#lessonTitle').val()){
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

	//submit
	else{
		$('#frm').submit();
	}
})

//Product
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
	//submit
	else{
		$('#frm').submit();
	}
})

//Recipe
$('#recipeConfirm').click(function(){
	if(!$('#recipeTitle').val()){
		alert("제목을 입력하세요.")
		return;
	}
	else if(!$('#recipeIngredients').val()){
		alert("재료를 입력하세요.")
		return;
	}
	else if(!$('#recipeContents').val()){
		alert("내용을 입력하세요.")
		return;
	}
	//submit
	else{
		$('#frm').submit();
	}
})