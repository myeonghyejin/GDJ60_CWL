//list
getQnAList(1);

function getQnAList(page){
	$.ajax({
        url:'../product/qna/list?productNum='+productQnAListResult.getAttribute('data-product-num-qna')+"&page="+page,
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
	let check = window.confirm("삭제하시겠습니까?");
    if(check) {
	    fetch("../product/qna/delete", {
	        method:'POST',
	        headers:{
	           "Content-type":"application/x-www-form-urlencoded"
	       },
	       body:"productQnANum="+$(this).attr("data-productqna-num")
	       }).then((response)=>{return response.text()})
	         .then((res)=>{
	           if(res.trim()>0){
					alert('문의가 삭제되었습니다.');
					getQnAList(1);
				}else {
					alert('삭제 실패!');
				}
		})
		e.preventDefault();
	}
})