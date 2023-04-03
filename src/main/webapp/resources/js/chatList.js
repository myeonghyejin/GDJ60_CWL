
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
//let ipAddress = "192.168.1.199";
let ipAddress = "localhost";

let sock = new SockJS("http://" + ipAddress + "/echo");

sock.onopen = function () {
  console.log("연결 성공");
  //sock.send('list');
  s('list');
};

function s (m){
  sock.send(m);
}

sock.onclose=function() {	
	console.log("연결을 끊었습니다");
}


let splitData = []; // splitData 배열을 선언

//친구 list or 채팅 메세지 출력
sock.onmessage = function (m) {

  console.log(m) // 받은 메세지 출력

  let json = JSON.parse(m.data); // 받은 메세지를 JSON 형식으로 파싱
  console.log("DATA : " + json) // 받은 메세지 출력
  console.log(json.type); // 전송 타입 출력
  console.log(json.users); // 유저 목록 출력

  if (json.type === 'list') {
    console.log("users : ", json.users);
    let users = json.users.replace("[", "").replace("]", "").split(",");
    for (let i = 0; i < users.length; i++) {
      if (users[i].trim() !== id) {
        makeUser(users[i].trim());
      }
    }
    return;
  }
  
  
  // console.log("받는 메세지 : " + m.data) // 받은 메세지 출력
  // splitData = m.data.split(":") // 받은 메세지를 ':' 기준으로 분리하여 배열에 저장
  // console.log(splitData[0]) // 분리된 메세지 중 첫 번째 요소 출력
  // console.log(splitData[1]) // 분리된 메세지 중 두 번째 요소 출력

  // if (splitData[0] == 'list') { // 첫 번째 요소가 'list'인 경우
  //   splitData[1] = splitData[1].replace('[', ''); // 두 번째 요소에서 '[' 문자열 제거
  //   splitData[1] = splitData[1].replace(']', ''); // 두 번째 요소에서 ']' 문자열 제거
  //   splitData[1] = splitData[1].replace(' ', ''); // 두 번째 요소에서 공백 제거
  //   splitData[1] = splitData[1].split(","); // 두 번째 요소를 ',' 기준으로 분리하여 배열에 저장
  //   console.log("users : ", splitData[1]) // 분리된 유저 리스트 출력

  //   for (let i = 0; i < splitData[1].length; i++) {
  //     if (splitData[1][i].trim() != id) {
  //       console.log("내가 아닌사람만 출력 :" + splitData[1][i])
  //       makeUser(splitData[1][i]); // makeUser 함수 호출하여 유저 리스트 생성
  //     }
  //   }
  //   return; // 함수 종료
  // }

  //m => json 변경후 출력
  
  
  if (json.type!="list" && json.id != id) { // 첫 번째 요소가 id와 다른 경우
    console.log(json.memberId);
    console.log(json.message);
    console.log(json.id);
    $(".msg").append(makeRecv(json.message, json.memberId, 'sender')); // makeRecv 함수 호출하여 채팅 메세지 출력
    console.log(makeRecv(json.message, json.memberId, 'sender'));
  }

}

//친구목록 나타내기
function makeUser(users, splitData) {
  let u = ''
  u = u + '<div class="d-flex align-items-center friend" data-user="'+users+'">'
  u = u + '<div class="flex-shrink-0">'
  u = u + '<img class="img-fluid"'
  u = u + 'src="https://mehedihtml.com/chatbox/assets/img/user.png"'
  u = u + 'alt="user img">'
  u = u + '</div>'
  u = u + '<div class="flex-grow-1 ms-3" >'
  u = u + '<h7 class="pull-right">5km</h7>'
  u = u + '<h3>' + users + '</h3>'
  u = u + '<p>안녕하세요 같이만나서 놀아요 자기소개입니다</p>'
  u = u + '</div>'
  u = u + '</div>'
  $("#chat-list").append(u);
}

//개인 채팅방 나타내기
$("#chat-list").on('click','.friend' ,function (e) {
  // e.stopPropagation();
  $(".chatbox").empty();
  let userId = $(this).attr("data-user");
  console.log("start chat with " + userId);
  sock.send("invite " + userId)


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
              <ul class='msg'>
 
              </ul>
          </div>
      </div>

      <div class="send-box">
          <form action="">
              <input type="text" class="form-control" aria-label="message…"
                  placeholder="Write message…" id="txtMessage" data-id="${userId}">

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
  

  return recv;
}



//엔터키 눌렀을때 채팅 메세지 전송
$(".chatbox").on('keyup', '#txtMessage', function (e) {
    if (e.which === 13) { // 엔터키 누를 때 전송
      e.preventDefault();
      console.log("엔터키 입력함");
      sock.send($("#txtMessage").val());
      $(".msg").append(makeRecv($("#txtMessage").val(), id, 'repaly'));
      $("#txtMessage").val(''); // 메시지 전송 후 텍스트 필드 초기화
    }
});
  
//send버튼 눌렀을때 채팅 메세지 전송
$(".chatbox").on('click', '#sendButton', function () {
    console.log("버튼 클릭함");
    console.log("메세지 내용 : " + $("#txtMessage").val());
    console.log("sock : " + sock);
    sock.send($("#txtMessage").attr("data-id")+' '+$("#txtMessage").val());
    $(".msg").append(makeRecv($("#txtMessage").val(), id, 'repaly'));
    $("#txtMessage").val(''); // 메시지 전송 후 텍스트 필드 초기화
});
  
