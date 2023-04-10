//list
getList(1);

function getList(page){
    fetch("/lesson/review/list?lessonNum="+lessonReviewListResult.getAttribute('data-lesson-review')+"&page="+page, {
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        $("#lessonReviewListResult").html(res.trim());
    })
}

//page
$("#lessonReviewListResult").on("click",".page-button", function(e){
    let page = $(this).attr("data-board-page");
    getList(page);
    e.preventDefault();
});

//add
$("#lessonReviewAdd").click(function(){
    $.ajax({
        url:'../lesson/review/add',
        type:'POST',
        data:{
        	'lessonRating': $("input[name='lessonRating']:checked").val(),
            'lessonReviewContents': $("#lessonReviewContents").val().replace(/(?:\r\n|\r|\n)/g, '<br>'),
            'lessonNum': $("#lessonReviewAdd").attr('data-lesson-review')
        },
        success:(res)=>{
            if(res.trim()==1){
                alert('후기가 등록되었습니다.')
                $("#lessonReviewContents").val("");
                getList(1);            
            }else {
                alert('등록 실패!')
            }
        }
    })
})

//delete
$("#lessonReviewListResult").on("click",".delete",function(e){
	let check = window.confirm("삭제하시겠습니까?");
    if(check) {
	    fetch("../lesson/review/delete", {
	        method:'POST',
	        headers:{
	           "Content-type":"application/x-www-form-urlencoded"
	       },
	       body:"lessonReviewNum="+$(this).attr("data-lessonReview-num")
	       }).then((response)=>{return response.text()})
	         .then((res)=>{
	           if(res.trim()!=0){
					alert('후기가 삭제되었습니다.');
					getList(1);
	           }else {
	               alert('삭제 실패!');
	           }
	         })
	         e.preventDefault();
	}
})
  
//update
let lessonReviewNum = '';
$("#lessonReviewListResult").on("click", ".update", function(e){
    lessonReviewNum = $(this).attr("data-lessonReview-num");
    $("#lessonReviewEdit").val($("#lessonReviewContents"+lessonReviewNum).text().trim().replace(/(?:\r\n|\r|\n)/g, '<br>'));
    $("#updateConfirm").attr("data-lessonReview-num", lessonReviewNum);
    e.preventDefault();
})

//confirm (Modal)
$("#updateConfirm").click(function(){
    $.ajax({
        url:'../lesson/review/update',
        type:'POST',
        data:{
            'lessonReviewNum': lessonReviewNum,
            'lessonReviewContents': $("#lessonReviewEdit").val(),
            'lessonRating': $(".lessonRating").val()
        },
        success:(res)=>{
            if(res.trim()!=0){
                alert('후기가 수정되었습니다.');
                $("#closeUpdateModal").click();
                getList(1);            
            }else {
                alert('수정 실패!');
            }
        }
    })
})