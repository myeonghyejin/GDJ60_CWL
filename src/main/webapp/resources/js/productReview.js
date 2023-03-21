//list
getList(1);

function getList(page){

    fetch("/product/review/list?productNum="+productReviewAdd.getAttribute('data-product-review')+"&page="+page, {
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        
        $("#productReviewListResult").html(res.trim());
    })

}

//page
$("#productReviewListResult").on("click",".page-link", function(e){
    
    let page = $(this).attr("data-board-page");
    getList(page);
    
    e.preventDefault();
    
});

//add
$("#productReviewAdd").click(function(){
    const form1 = new FormData();
    form1.append("productReviewContents", $("#productReviewContents").val());
    form1.append("productNum", $("#productReviewAdd").attr('data-product-review'))


    fetch('../product/review/add', {
        method:'POST',
        //headers:{},
        body:form1,
    }).then((response)=> response.text())
    .then((res)=>{
        if(res.trim()==1){
            alert('댓글이 등록되었습니다')
            $("#productReviewContents").val("");
            getList(1);            
        }else {
            alert('댓글 등록에 실패했습니다')
        }
    })
})

//delete
$("#productReviewListResult").on("click",".del",function(e){
    fetch("../product/review/delete", {
        method:'POST',
        headers:{
           "Content-type":"application/x-www-form-urlencoded"
       },
       body:"num="+$(this).attr("data-comment-num")
       }).then((response)=>{return response.text()})
         .then((res)=>{
           if(res.trim()>0){
               alert('댓글이 삭제 되었습니다');
               getList(1);
           }else {
               alert('삭제 실패');
           }
         })

         e.preventDefault();
})

//update
$("#productReviewListResult").on("click", ".update", function(e){
    let num = $(this).attr("data-comment-num");
    $("#contents").val($("#contents"+num).text());
    $("#contentsConfirm").attr("data-comment-num", num);
    e.preventDefault();
})

//confirm
$("#contentsConfirm").click(function(){
    
    fetch('../product/review/update', {
        method:'POST',
        headers:{
            "Content-type":"application/x-www-form-urlencoded"
        },
        body: "num="+$(this).attr("data-comment-num")+"&contents="+$("#contents").val()
    }).then( (response) => response.text())
      .then( (res) => {
        if(res.trim()>0){
            alert('수정 성공');
            $("#closeModal").click();
            getList(1);            
        }else {
            alert('수정 실패');
        }
      })
      .catch(()=>{
        alert('관리자에게 문의하세요');
      })
})