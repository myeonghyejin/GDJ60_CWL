//list
getList(1);

function getList(page){
    fetch("/bankbookComment/list?boardNum="+boardCommentAdd.getAttribute('data-board-comment')+"&page="+page, {
        method: 'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        $('#boardCommentListResult').html(res.trim());
    })
}

//page
$('#boardCommentListResult').on('click', '.page-link', function(e){
    let page = $(this).attr("data-board-page");
    getList(page);
})

//add
$('#boardCommentAdd').click(function(){
    const form = new FormData();
    form.append('contents', $('#boardCommentContents').val());
    form.append('boardNum', $('#boardCommentAdd').attr('data-board-comment'));
    fetch('../bankbookComment/add', {
        method: 'POST',
        body: form,
    }).then((response) => response.text())
    .then((res)=>{
        if (res.trim()==1) {
            alert('댓글이 등록되었습니다.')
                $('#boardCommentContents').val("");
                getList(1);
        } else {
                alert('댓글 등록에 실패했습니다.')
            }
    });
});

//delete
$('#boardCommentListResult').on('click', '.del', function(e){
    fetch('../bankbookComment/delete', {
        method:'POST',
        headers:{
            'content-type': 'application/x-www-form-urlencoded'
        },
        body:"num="+$(this).attr("data-comment-num")
    }).then((response)=>response.text())
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
$('#boardCommentListResult').on('click', '.upd', function(e){
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