//list
getList(1);

function getList(page){

    fetch("/lesson/review/list?lessonNum="+lessonReviewAdd.getAttribute('data-lesson-review')+"&page="+page, {
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        
        $("#lessonReviewListResult").html(res.trim());
    })

}

//page
$("#lessonReviewListResult").on("click",".page-link", function(e){
    
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
        	'lessonRating': $("#lessonRating").val(),
            'lessonReviewContents': $("#lessonReviewContents").val(),
            'lessonNum': $("#lessonReviewAdd").attr('data-lesson-review')
        },
        success:(res)=>{
            if(res.trim()==1){
                alert('후기가 등록되었습니다')
                $("#lessonRating").val("");
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
    fetch("../lesson/review/delete", {
        method:'POST',
        headers:{
           "Content-type":"application/x-www-form-urlencoded"
       },
       body:"num="+$(this).attr("data-lessonReview-num")
           //응답객체에서 Data 추출
       }).then((response)=>{return response.text()}) //then(function(response){return response.text()})   
           //추출한 Data 사용
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
let lessonReviewNum = '';
$("#lessonReviewListResult").on("click", ".update", function(e){
    lessonReviewNum = $(this).attr("data-lessonReview-num");
    console.log(lessonReviewNum)
    $("#lessonReviewContent").val($("#lessonReviewContents"+lessonReviewNum).text());
    $("#contentsConfirm").attr("data-lessonReview-num", lessonReviewNum);
    e.preventDefault();
})

//confirm (Modal)
$("#contentsConfirm").click(function(){
    $.ajax({
        url:'../lesson/review/update',
        type:'POST',
        data:{
            'lessonReviewNum': lessonReviewNum,
            'lessonReviewContents': $("#lessonReviewContent").val(),
            'lessonRating': $("#lessonRating").val()
        },
        success:(res)=>{
            if(res.trim()>0){
                alert('수정 성공');
                $("#closeModal").click();
                getList(1);            
            }else {
                alert('수정 실패');
            }
        }
    })
})