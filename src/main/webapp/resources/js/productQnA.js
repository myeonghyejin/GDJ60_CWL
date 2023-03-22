//list
getList(1);

function getList(page){

    fetch("/product/qna/list?productNum="+productQnAAdd.getAttribute('data-product-qna')+"&page="+page, {
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
    const form1 = new FormData();
    form1.append("productQnAContents", $("#productQnAContents").val());
    form1.append("productNum", $("#productQnAAdd").attr('data-product-qna'))


    fetch('../product/qna/add', {
        method:'POST',
        body:form1,
    }).then((response)=> response.text())
    .then((res)=>{
        if(res.trim()==1){
            alert('댓글이 등록되었습니다')
            $("#productQnAContents").val("");
            getList(1);            
        }else {
            alert('댓글 등록에 실패했습니다')
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
       body:"num="+$(this).attr("data-qna-num")
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
$("#productQnAListResult").on("click", ".update", function(e){
    let num = $(this).attr("data-qna-num");
    $("#productQnAContents").val($("#productQnAContents"+num).text());
    $("#contentsConfirm").attr("data-qna-num", num);
    e.preventDefault();
})

//confirm
$("#contentsConfirm").click(function(){
    
    fetch('../product/qna/update', {
        method:'POST',
        headers:{
            "Content-type":"application/x-www-form-urlencoded"
        },
        body: "num="+$(this).attr("data-qna-num")+"&productQnAContents="+$("#productQnAContents").val()
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