//list
getList(1);

function getList(page){
    $.ajax({
        url:'../product/review/list?productNum='+productReviewAdd.getAttribute('data-product-num-review')+"&page="+page,
        type:'GET',
        success:(res)=>{
            $("#productReviewListResult").html(res.trim());
        }
    })
}

//page
$("#productReviewListResult").on("click",".page-link", function(e){
    let page = $(this).attr("data-review-page");
    getList(page);
    e.preventDefault();
});

//add
// $("#productReviewAdd").click(function(){
//     $.ajax({
//         url:'../product/review/add',
//         type:'POST',
//         data:{
//         	'productRating': $("#productRating").val(),
//             'productReviewContents': $("#productReviewContents").val(),
//             'productNum': $("#productReviewAdd").attr('data-product-num-review')
//         },
//         success:(res)=>{
//             if(res.trim()==1){
//                 alert('후기가 등록되었습니다')
//                 $("#productRating").val("");
//                 $("#productReviewContents").val("");
//                 getList(1);            
//             }else {
//                 alert('등록 실패!')
//             }
//         }
//     })
// })

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
               alert('후기가 삭제되었습니다');
               getList(1);
           }else {
               alert('삭제 실패!');
           }
         })
         e.preventDefault();
})

//update
// let productReviewNum = '';
// $("#productReviewListResult").on("click", ".update", function(e){
//     productReviewNum = $(this).attr("data-productreview-num");
//     $("#productRatingEdit").val($("#productRating"+productReviewNum).text().trim());
//     $("#productReviewEdit").val($("#productReviewContents"+productReviewNum).text().trim());
//     $("#reviewConfirm").attr("data-productreview-num", productReviewNum);
//     e.preventDefault();
// })

//confirm
// $("#reviewConfirm").click(function(){
//     $.ajax({
//         url:'../product/review/update',
//         type:'POST',
//         data:{
//         	'productRating': $("#productRatingEdit").val(),
//             'productReviewNum': productReviewNum,
//             'productReviewContents': $("#productReviewEdit").val()
//         },
//         success:(res)=>{
//             if(res.trim()>0){
//                 alert('후기가 수정되었습니다');
//                 $("#closeReviewModal").click();
//                 getList(1);            
//             }else {
//                 alert('수정 실패!');
//             }
//         }
//     })
// })