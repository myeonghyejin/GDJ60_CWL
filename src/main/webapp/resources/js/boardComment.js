//add
$('#replyAdd').click(function(){
    //JS에서 사용할 가상의 Form 태그 생성
    const form = new FormData();    //<form></form>
    form.append('contents', $('#replyContents').val());   //<form><input type="text" name="contents" value=""></form>
    form.append('bookNum', $('#replyAdd').attr('data-book-num'));     //<form><input type="text" name="contents" value=""><input type="text" name="bookNum" value=""></form>
    fetch('../bankbookComment/add', {
        method: 'POST',
        // headers: {'Content-type':"application/x-www-form-urlencoded"},
        body: form,
    }).then((response) => response.text())
    .then((res)=>{
        if (res.trim()==1) {
            alert('댓글이 등록되었습니다.')
                $('#replyContents').val("");
                getList(1);
        } else {
                alert('댓글 등록에 실패했습니다.')
            }
    });
});

//list
getList(1);

function getList(page){
    fetch("/bankbookComment/list?bookNum="+replyAdd.getAttribute('data-book-num')+"&page="+page, {
        method: 'GET'
        //GET과 HEAD 메서드 형식은 body 속성을 가질 수 없음
    })
    .then((response)=>response.text())
    .then((res)=>{
        // commentListResult.innerHTML=res.trim();
        $('#commentListResult').html(res.trim());
    })
}

//page
$('#commentListResult').on('click', '.page-link', function(e){
    let page = $(this).attr("data-board-page");
    getList(page);
})

//delete
$('#commentListResult').on('click', '.del', function(e){
    fetch('../bankbookComment/delete', {
        method:'POST',
        headers:{
            'content-type': 'application/x-www-form-urlencoded'
        },
        body:"num="+$(this).attr("data-comment-num")
        //응답 객체에서 Data 추출
    }).then((response)=>response.text())
        //추출한 Data 사용
        .then((res)=>{
            if(res.trim()>0){
                alert('댓글이 삭제되었습니다.');
                getList(1);
            } else {
                alert('삭제 실패');
            }
        })
})

//update
$('#commentListResult').on('click', '.upd', function(e){
    let num = $(this).attr('data-comment-num')
    $('#contents').val($('#contents'+num).text().trim());
    $('#contentsConfirm').attr('data-comment-num', num);
    e.preventDefault();
})

$('#contentsConfirm').click(function(){
    fetch('../bankbookComment/update', {
        method: 'POST',
        headers: {"Content-type": "application/x-www-form-urlencoded"},
        body: "num="+$(this).attr('data-comment-num')+"&contents="+$('#contents').val()
    }).then((response)=>response.text())
    .then((res)=>{
        if(res.trim()>0) {
            alert('수정되었습니다.');
                $('#closeModal').click();
                getList(1);
            } else {
               alert('수정 실패');
            }
        })
    .catch(()=>{
        alert('관리자에게 문의하세요.')
    });
})