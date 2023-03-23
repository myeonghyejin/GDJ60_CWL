//list
getList(1);

function getList(page){

    fetch("/product/qna/list?productNum="+productQnAAdd.getAttribute('data-product-num')+"&page="+page, {
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        
        $("#productQnAListResult").html(res.trim());
    })
    
}

//page
$("#productQnAListResult").on("click",".page-link", function(e){
    let page = $(this).attr("data-board-page");
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
            'productNum': $("#productQnAAdd").attr('data-product-num')
        },
        success:(res)=>{
            if(res.trim()==1){
                alert('댓글이 등록되었습니다')
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
               alert('댓글이 삭제되었습니다');
               getList(1);
           }else {
               alert('삭제 실패');
           }
         })
         e.preventDefault();
})

//update
let productQnAnum = '';
$("#productQnAListResult").on("click", ".update", function(e){
    productQnAnum = $(this).attr("data-productqna-num");
    $("#productQnAEdit").val($("#productQnAContents"+productQnAnum).text().trim());
    $("#contentsConfirm").attr("data-productqna-num", productQnAnum);
    e.preventDefault();
})

//confirm
$("#contentsConfirm").click(function(){
    $.ajax({
        url:'../product/qna/update',
        type:'POST',
        data:{
            'productQnANum': productQnAnum,
            'productQnAContents': $("#productQnAEdit").val()
        },
        success:(res)=>{
            if(res.trim()>0){
                alert('문의가 수정되었습니다');
                $("#closeModal").click();
                getList(1);            
            }else {
                alert('수정 실패!');
            }
        }
    })
})