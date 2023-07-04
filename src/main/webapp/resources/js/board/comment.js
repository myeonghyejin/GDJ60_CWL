//list
getList(1);

function getList(page){
    fetch("/board/comment/list?boardNum="+boardCommentListResult.getAttribute('data-board-num')+"&page="+page, {
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        $("#boardCommentListResult").html(res.trim());
    })
}

//page
$("#boardCommentListResult").on("click",".page-button", function(e){
    let page = $(this).attr("data-board-page");
    getList(page);
    e.preventDefault();
});

//add
$("#boardCommentAdd").click(function(){
    $.ajax({
        url:'../board/comment/add',
        type:'POST',
        data:{
            'boardNum': $("#boardCommentAdd").attr('data-board-num'),
            'boardCommentContents': $("#boardCommentContents").val().replace(/(?:\r\n|\r|\n)/g, '<br>')
        },
        success:(res)=>{
            if(res.trim()==1){
                alert('댓글이 등록되었습니다.')
                $("#boardCommentContents").val("");
                getList(1);            
            }else {
                alert('등록 실패!')
            }
        }
    })
})

//delete
$("#boardCommentListResult").on("click",".delete",function(e){
	let check = window.confirm("삭제하시겠습니까?");
    if(check) {
    	$.ajax({
    		url:'../board/comment/delete',
    		type:'POST',
    		data:{
    			'boardNum': $(this).attr('data-board-num'),
    			'boardCommentNum': $(this).attr('data-boardcomment-num')
    		},
    		success:(res)=>{
    			if(res.trim()==1){
    				alert('댓글이 삭제되었습니다.');
    				getList(1);
    			} else {
    				alert('삭제 실패!')
    			}
    		}
    	})
	}
})

//update
$("#boardCommentListResult").on("click", ".update", function(e){
    let boardCommentNum = $(this).attr("data-boardcomment-num");
    $("#boardCommentEdit").val($("#boardCommentContents"+boardCommentNum).text().trim());
    $("#updateConfirm").attr("data-boardcomment-num", boardCommentNum);
    e.preventDefault();
})

//update confirm
$("#updateConfirm").click(function(){
    $.ajax({
        url:'../board/comment/update',
        type:'POST',
        data:{
            'boardCommentNum': $(this).attr("data-boardcomment-num"),
            'boardCommentContents': $("#boardCommentEdit").val().replace(/(?:\r\n|\r|\n)/g, '<br>')
        },
        success:(res)=>{
            if(res.trim()!=0){
                alert('댓글이 수정되었습니다.');
                $("#closeUpdateModal").click();
                getList(1);            
            }else {
                alert('수정 실패!');
            }
        }
    })
})

//reply
$("#boardCommentListResult").on("click", ".reply", function(e){
    let boardCommentNum = $(this).attr("data-boardcomment-num");
    $("#replyConfirm").attr("data-boardcomment-num", boardCommentNum);
    e.preventDefault();
})

//reply confirm
$("#replyConfirm").click(function(){
    $.ajax({
        url:'../board/comment/reply',
        type:'POST',
        data:{
            'boardNum': $("#boardCommentAdd").attr('data-board-num'),
            'boardCommentNum': $(this).attr("data-boardcomment-num"),
            'boardCommentContents': $("#boardCommentReply").val().replace(/(?:\r\n|\r|\n)/g, '<br>')
        },
        success:(res)=>{
            if(res.trim()!=0){
                alert('답글이 등록되었습니다.');
                $("#closeReplyModal").click();
                $("#boardCommentReply").val("");
                getList(1);
            }else {
                alert('등록 실패!');
            }
        }
    })
})