
$(".chat-list a").click(function () {
  $(".chatbox").addClass('showbox');
  return false;
});

$(".chat-icon").click(function () {
  $(".chatbox").removeClass('showbox');
});



let id = '';

function setId(memberId) {
  id = memberId;
}


//웹소켓 생성
let ipAddress = "localhost";
let sock = new SockJS("http://" + ipAddress + "/echo");

sock.onopen = function () {
  console.log("연결 성공");
  send0('list');

};

function send0(m) {
  sock.send(m);
}


let splitData = []; // splitData 배열을 선언

//친구 list or 채팅 메세지 출력
sock.onmessage = function (m) {

  console.log(m) // 받은 메세지 출력

  console.log("받는 메세지 : " + m.data) // 받은 메세지 출력
  splitData = m.data.split(":") // 받은 메세지를 ':' 기준으로 분리하여 배열에 저장
  console.log(splitData[0]) // 분리된 메세지 중 첫 번째 요소 출력
  console.log(splitData[1]) // 분리된 메세지 중 두 번째 요소 출력

  if (splitData[0] == 'list') { // 첫 번째 요소가 'list'인 경우
    splitData[1] = splitData[1].replace('[', ''); // 두 번째 요소에서 '[' 문자열 제거
    splitData[1] = splitData[1].replace(']', ''); // 두 번째 요소에서 ']' 문자열 제거
    splitData[1] = splitData[1].replace(' ', ''); // 두 번째 요소에서 공백 제거
    splitData[1] = splitData[1].split(","); // 두 번째 요소를 ',' 기준으로 분리하여 배열에 저장
    console.log("users : ", splitData[1]) // 분리된 유저 리스트 출력

    for (let i = 0; i < splitData[1].length; i++) {
      if (splitData[1][i] != id) {
        console.log("내가 아닌사람만 출력 :" + splitData[1][i])
        makeUser(splitData[1][i]); // makeUser 함수 호출하여 유저 리스트 생성
      }
    }
    return; // 함수 종료
  }
  if (splitData[0] != id) { // 첫 번째 요소가 id와 다른 경우
    $(".chatMsg").append(makeRecv(splitData[1], splitData[0], 'sender')); // makeRecv 함수 호출하여 채팅 메세지 출력
  }

}

//친구목록 나타내기
function makeUser(users, splitData) {
  let u = `
  <div class="d-flex align-items-center friend" data-user="${user}">
    <div class="flex-shrink-0">
        <img class="img-fluid"
            src="https://mehedihtml.com/chatbox/assets/img/user.png"
            alt="user img">
    </div>
    <div class="flex-grow-1 ms-3" >
        <h7 class="pull-right">5km</h7>
        <h3>${users}</h3>
        <p>안녕하세요 같이만나서 놀아요 자기소개입니다</p>
    </div>
  </div>
  `;
  $("#userList").append(u);
}

//개인 채팅방 나타내기
$(".friend").on('click', function (e) {
  e.stopPropagation();
  console.log(e.target)
  let userId = $(e.target).attr("data-user");
  console.log("start chat with " + userId);
  $(".chatbox").empty();

  let chattingroom = `
  <div class="modal-dialog-scrollable">
  <div class="modal-content">
      <div class="msg-head">
          <div class="row">
              <div class="col-8">
                  <div class="d-flex align-items-center">
                      <span class="chat-icon"><img class="img-fluid"
                              src="https://mehedihtml.com/chatbox/assets/img/arroleftt.svg"
                              alt="image title"></span>
                      <div class="flex-grow-1 ms-3">
                          <h3>${userId}</h3>
                          <p>자기소개</p>
                      </div>
                  </div>
              </div>
              <div class="col-4">
                  <ul class="moreoption">
                      <li class="navbar nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="#" role="button"
                              data-bs-toggle="dropdown" aria-expanded="false"><i
                                  class="fa fa-ellipsis-v" aria-hidden="true"></i></a>
                          <ul class="dropdown-menu">
                              <li><a class="dropdown-item" href="#">Leave Chat</a></li>
                          </ul>
                      </li>
                  </ul>
              </div>
          </div>
      </div>

      <div class="modal-body">
          <div class="msg-body">
              // <ul>
              //     <li class="sender">
              //         <p> Hey, Are you there? </p>
              //         <span class="time">10:06 am</span>
              //     </li>

              //     <li class="repaly">
              //         <p>yes!</p>
              //         <span class="time">10:20 am</span>
              //     </li>

              // </ul>
          </div>
      </div>

      <div class="send-box">
          <form action="">
              <input type="text" class="form-control" aria-label="message…"
                  placeholder="Write message…" id="txtMessage">

              <button type="button" id="sendButton"><i class="fa fa-paper-plane"
                      aria-hidden="true"></i>
                  Send</button>
          </form>
      </div>
  </div>
</div>

  `;
  $(".chatbox").append(chattingroom);



  $(".chatbox").css("display", "block")
  // $("#map").css("display", "none")



})


  
//메세지 창 메세지 내용 보이기
function makeRecv(msg, recvId, direct) {
  
  let recv = ' <li class="' + direct + '">'
  recv = recv + '<p> ' + msg + ' </p>'
  recv = recv + '<span class="time">10:06 am</span>'
  recv = recv + '</li>'
  
  // let recv = '<div class="message' + direct + '">'
  // recv = recv + '<div class="message-wrap">'
  // recv = recv + '<div class="message-item">'
  // recv = recv + '<div class="message-content">'
  // recv = recv + '<span>' + msg + '</span>'
  // recv = recv + '</div> </div> </div>'
  // recv = recv + '<div class="message-info"> <div>'
  // recv = recv + '<h6 class="mb-0">' + recvId + '</h6>'
  // recv = recv + '<small class="text-muted">9:15 PM</small>'
  // recv = recv + '</div> </div> </div>'

  return recv;
}



//친구 목록중 친구 누르면 채팅방 보이기 
$(".friend").click(function () {
    console.log("클릭");
    // $("#map").css("display", "none")
    $(".chatbox").css("display", "block")
  
  })


//엔터키 눌렀을때 채팅 메세지 전송
$(".chatbox").on('keyup', '#txtMessage', function (e) {
    if (e.which === 13) { // 엔터키 누를 때 전송
        e.preventDefault(); // 폼 전송 방지
        console.log("엔터키 입력함");
        sock.send($("#txtMessage").val());
        $(".msg-body").append(makeRecv($("#txtMessage").val(), id, 'repaly'));
        $("#txtMessage").val(''); // 메시지 전송 후 텍스트 필드 초기화
    }
});
  
//send버튼 눌렀을때 채팅 메세지 전송
$(".chatbox").on('click', '#sendButton', function () {
    console.log("버튼 클릭함");
    console.log("메세지 내용 : " + $("#txtMessage").val());
    console.log("sock : " + sock);
    //sock.send($("#txtMessage").val());
    send0($("#txtMessage").val());
    $(".msg-body").append(makeRecv($("#txtMessage").val(), id, 'repaly'));
    $("#txtMessage").val(''); // 메시지 전송 후 텍스트 필드 초기화
});
  
