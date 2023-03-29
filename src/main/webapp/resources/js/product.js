//////////////////REVIEW///////////////////

//list
getReviewList(1);

function getReviewList(page){
    $.ajax({
        url:'../product/review/list?productNum='+productReviewAdd.getAttribute('data-product-num-review')+"&page="+page,
        type:'GET',
        success:(res)=>{
            $("#productReviewListResult").html(res.trim());
        }
    })
}

//page
$("#productReviewListResult").on("click",".page-link-review", function(e){
    let page = $(this).attr("data-review-page");
    getReviewList(page);
    e.preventDefault();
});

//delete
$("#productReviewListResult").on("click",".delete",function(e){
    fetch("../product/review/delete", {
        method:'POST',
        headers:{
           "Content-type":"application/x-www-form-urlencoded"
       },
       body:"productReviewNum="+$(this).attr("data-productreview-num")
       }).then((response)=>{return response.text()})
         .then((res)=>{
         	if(res.trim()>0){
         		let check = window.confirm("삭제하겠습니까?")
         		if(check) {
					alert('후기가 삭제되었습니다');
					getReviewList(1);
			}else {
				alert('삭제 실패!');
			}
		}
	})
	e.preventDefault();
})

//////////////////QNA///////////////////

//list
getQnAList(1);

function getQnAList(page){
	$.ajax({
        url:'../product/qna/list?productNum='+productQnAAdd.getAttribute('data-product-num-qna')+"&page="+page,
        type:'GET',
        success:(res)=>{
            $("#productQnAListResult").html(res.trim());
        }
    })
}

//page
$("#productQnAListResult").on("click",".page-link-qna", function(e){
    let page = $(this).attr("data-qna-page");
    getQnAList(page);
    e.preventDefault();
});

//detail
$("#productQnAListResult").on("click", ".detail", function(e){
    let num = $(this).attr("data-productqna-num");
    $("#productQnAContents"+num).toggle()
})

//delete
$("#productQnAListResult").on("click", ".delete", function(e){
    fetch("../product/qna/delete", {
        method:'POST',
        headers:{
           "Content-type":"application/x-www-form-urlencoded"
       },
       body:"productQnANum="+$(this).attr("data-productqna-num")
       }).then((response)=>{return response.text()})
         .then((res)=>{
           if(res.trim()>0){
         		let check = window.confirm("삭제하겠습니까?")
         		if(check) {
					alert('문의가 삭제되었습니다');
					getQnAList(1);
			}else {
				alert('삭제 실패!');
			}
		}
	})
	e.preventDefault();
})