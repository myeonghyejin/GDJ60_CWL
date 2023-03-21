const frm = document.getElementById("frm");
const u = document.getElementById("update");
const d = document.getElementById("delete");

d.addEventListener("click", function(){
    let check = window.confirm("삭제하시겠습니까?");
    if(check) {
        frm.setAttribute("action", "./delete");
        frm.setAttribute("method", "post");
        frm.submit();
    }
})