//list
getReviewList(1);

function getReviewList(page){
    $.ajax({
        url:'../product/review/list?productNum='+productReviewListResult.getAttribute('data-product-num-review')+"&page="+page,
        type:'GET',
        success:(res)=>{
            $("#productReviewListResult").html(res.trim());
        }
    })
}

//page
$("#productReviewListResult").on("click",".page-button-review", function(e){
    let page = $(this).attr("data-review-page");
    getReviewList(page);
    e.preventDefault();
});

//detail
$("#productReviewListResult").on("click", ".detail", function(e){
    let num = $(this).attr("data-productreview-num");
    $("#productReviewContents"+num).toggle()
})

//delete
$("#productReviewListResult").on("click",".delete",function(e){
	let check = window.confirm("삭제하시겠습니까?");
    if(check) {
	    fetch("../product/review/delete", {
	        method:'POST',
	        headers:{
	           "Content-type":"application/x-www-form-urlencoded"
	       },
	       body:"productReviewNum="+$(this).attr("data-productreview-num")
	       }).then((response)=>{return response.text();})
	         .then((res)=>{
				console.log(res.trim().length);
	         	if(res.trim()!=0){
					alert('후기가 삭제되었습니다.');
					getReviewList(1);
				}else {
					alert('삭제 실패!');
				}
		})
		e.preventDefault();
	}
})