$(".bounceInDown").click(function(){
    // console.log("클릭");
    $("#chatting").css("display", "block")
    

})



//웹소켓 생성
let sock = new SockJS("http://192.168.1.199/echo/");

function makeRecv(msg, recvId, direct){
    let recv='<li class="'+direct+'clearfix">'
    recv= recv+'<span class="chat-img pull-'+direct+'">'
    recv = recv+' <img src="https://bootdey.com/img/Content/user_3.jpg" alt="User Avatar">'
    recv = recv +'</span>'
    recv = recv+'<div class="chat-body clearfix">'
    recv = recv+'<div class="header">'
    recv = recv+'<strong class="primary-font">'+recvId+'</strong>'
    recv = recv+'<small class="pull-right text-muted"><i class="fa fa-clock-o"></i> 12 mins ago</small>'
    recv = recv+'</div>'
    recv = recv+'<p>'+msg+'</p>'
    recv = recv+'</div> </li>'

    return recv;
}

//받는 사람 html

sock.onmessage = function (m){
    console.log(m)

    console.log("받는 메세지 : "+m.data)
  

    $(".chat").append(makeRecv(m.data,'id1','left'));
}





//메세지 전송
$("#sendButton").click(function(){

    console.log("버튼 클릭함")
    console.log("보내는 메세지 : "+$("#txtMessage").val());

    sock.send($("#txtMessage").val());
    $(".chat").append(makeRecv($("#txtMessage").val(),'id2','right'));

});


