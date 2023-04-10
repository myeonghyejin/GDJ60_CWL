const imgList = document.getElementById("imgList");

let count = 0;
let max = 1;
let param = 'multipartFiles';
let idx = 1;

function setCount(c){
    count = c;
}

function setMax(m) {
    max = m;
};

function setParam(p) {
    param = p;
}

//추가
$('#imgAdd').click(()=>{
        if(count >= max) {
            alert("이미지는 최대 " + (max+1) + "개까지 업로드 가능합니다")
            return;
        } 
        
        count++;
        
        let child = '<div class="fw-bold fs-5 col-12 my-1 input-group" id="img'+idx+'">';
            child = child + '<input type="file" class="form-control" name="'+param+'">'
            child = child + '<button type="button" class="btn btn-outline-danger btn-image delete" data-delete-id="img'+idx+'">x</button>'
        $('#imgList').append(child);
        idx++;
})

//삭제
$('#imgList').on('click', '.delete', function(e){
    $(this).parent().remove();
    count--;
})

//삭제 확인
$('.deleteCheck').click(function(){
    let result = confirm('파일이 영구히 삭제됩니다.')
    let ch = $(this);
    if(result){
        let imgNum = $(this).val();
        $.ajax({
            type:'POST',
            url:'./imgDelete',
            data:{
                imgNum: imgNum
            },
            success:function(response){
                if(response.trim() > 0) {
                    alert('삭제되었습니다.')
                    ch.parent().parent().remove();
                    count--;
                } else {
                    alert('삭제 실패<br>관리자에게 문의하세요.')
                }
            },
            error:function(){}
        })
    } else {
        $(this).prop('checked', false)
    }
})