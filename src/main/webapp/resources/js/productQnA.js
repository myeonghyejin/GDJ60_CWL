//list
getList(1);

function getList(page){
	$.ajax({
        url:'../product/qna/list?productNum='+productQnAAdd.getAttribute('data-product-num-qna')+"&page="+page,
        type:'GET',
        success:(res)=>{
            $("#productQnAListResult").html(res.trim());
        }
    })
}

//page
$("#productQnAListResult").on("click",".page-link", function(e){
    let page = $(this).attr("data-qna-page");
    getList(page);
    e.preventDefault();
});

//add
$("#productQnAAdd").click(function(){
    $.ajax({
        url:'../product/qna/add',
        type:'POST',
        data:{
            'productQnAContents': $("#productQnAContents").val(),
            'productNum': $("#productQnAAdd").attr('data-product-num-qna')
        },
        success:(res)=>{
            if(res.trim()==1){
                alert('문의가 등록되었습니다')
                $("#productQnAContents").val("");
                getList(1);            
            }else {
                alert('등록 실패!')
            }
        }
    })
})

//delete
$("#productQnAListResult").on("click",".delete",function(e){
    fetch("../product/qna/delete", {
        method:'POST',
        headers:{
           "Content-type":"application/x-www-form-urlencoded"
       },
       body:"productQnANum="+$(this).attr("data-productqna-num")
       }).then((response)=>{return response.text()})
         .then((res)=>{
           if(res.trim()>0){
               alert('문의가 삭제되었습니다');
               getList(1);
           }else {
               alert('삭제 실패!');
           }
         })
         e.preventDefault();
})

//update
let productQnANum = '';
$("#productQnAListResult").on("click", ".update", function(e){
    productQnANum = $(this).attr("data-productqna-num");
    $("#productQnAEdit").val($("#productQnAContents"+productQnANum).text().trim());
    $("#qnaConfirm").attr("data-productqna-num", productQnANum);
    e.preventDefault();
})

//confirm
$("#qnaConfirm").click(function(){
    $.ajax({
        url:'../product/qna/update',
        type:'POST',
        data:{
            'productQnANum': productQnANum,
            'productQnAContents': $("#productQnAEdit").val()
        },
        success:(res)=>{
            if(res.trim()>0){
                alert('문의가 수정되었습니다');
                $("#closeQnAModal").click();
                getList(1);            
            }else {
                alert('수정 실패!');
            }
        }
    })
})