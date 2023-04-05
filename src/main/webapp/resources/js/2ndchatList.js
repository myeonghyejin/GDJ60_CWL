
// //현재 위치(위도 경도) 권한 요청 및 받아오기 
// function getLocation() {
// 	  if (navigator.geolocation) { // GPS를 지원하면
// 	    navigator.geolocation.getCurrentPosition(function(position) {
//         console.log(position.coords.latitude + ' ' + position.coords.longitude);
//           let container = document.getElementById('map');
//           let options = {
//             center: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude),
//             level: 3

//           };


//           let map = new kakao.maps.Map(container, options);

//           let imageSrc = 'https://cdn-icons-png.flaticon.com/512/8830/8830938.png', // 마커이미지의 주소입니다    
//           imageSize = new kakao.maps.Size(100, 100), // 마커이미지의 크기입니다
//           imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

//           // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
//           var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
//               markerPosition = new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude); // 마커가 표시될 위치입니다

//           // 마커를 생성합니다
//           var marker = new kakao.maps.Marker({
//               position: markerPosition, 
//               image: markerImage // 마커이미지 설정 
//           });

//           // 마커가 지도 위에 표시되도록 설정합니다
//           marker.setMap(map);  


// 	    }, function(error) {
// 	      console.error(error);
// 	    }, {
// 	      enableHighAccuracy: false,
// 	      maximumAge: 0,
// 	      timeout: Infinity
// 	    });
// 	  } else {
// 	    alert('GPS를 지원하지 않습니다');
// 	  }
// 	}
// 	getLocation();


// const COORDS = "coords"; 

// function saveCoords(coordsObj) {
//     localStorage.setItem(COORDS, JSON.stringify(coordsObj)); 
//     //localstorage의 key, value 값은 모두 string 타입으로 저장되기때문에 변환시켜준다. 
//     }

// function handleSuccess(position) {
//     const latitude = position.coords.latitude;
//     const longitude = position.coords.longitude;
//     const coordsObj = { // 객체의 key,  value 값이 동일할 때에는 한번만 써줘도 된다.
//         latitude,       // localStorage에 객체로 value에 저장하기위해서 객체에 넣어준다.    
//         longitude
//     };
//     saveCoords(coordsObj); // localStorage에 위치 저장 
// }

// function handleError() {
//     console.log('cant not access to location');
// }

// function askForCoords() {
//     navigator.geolocation.getCurrentPosition(handleSuccess, handleError);
// }


// function loadCoords() {
//     const loadedCoords = localStorage.getItem(COORDS);
//     if(loadedCoords === null) { 
//         // localStorage에 좌표값이 저장되어있지않다면
//         askForCoords(); // 좌표값을 물어본다
//     } 
// }

// function init() {
//     loadCoords();
// }

// init();



//-------------------------------------


$(".contact-link").click(function () {
  // console.log("클릭");
  $(".main").css("display", "block")
  $("#map").css("display", "none")

})



//-------------------------------------

let id = '';

function setId(memberId) {
  id = memberId;
}


//웹소켓 생성
let ipAddress = "192.168.1.199";
let sock = new SockJS("http://" + ipAddress + "/echo");

sock.onopen = function () {
  console.log("연결 성공");
  send0('list');

};

function send0(m) {
  sock.send(m);
}

sock.onerror = function (error) {
  console.log("연결 실패" + error);

  // ipAddress = "192.168.1.199";
  // sock = new SockJS("http://" + ipAddress + "/echo");

  // sock.onopen = function () {
  //   console.log("ip로 연결성공");
  // };

  // sock.onerror = function (error) {
  //   console.log("ip도 연결실패" + error);
  // };
};






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
    $(".chatMsg").append(makeRecv(splitData[1], splitData[0], '')); // makeRecv 함수 호출하여 채팅 메세지 출력
  }

}




function makeUser(users, splitData) {

    let u = ''
    u = u + '<li class="card contact-item">'
    u = u + '<div class="card-body">'
    u = u + '<div class="d-flex align-items-center">'
    u = u + '<div class="flex-grow-1 overflow-hidden">'
    u = u + '<div class="d-flex align-items-center mb-1">'
    u = u + '<h5 class="text-truncate mb-0 me-auto">' + users + '</h5>'
    u = u + '</div>'
    u = u + '<div class="d-flex align-items-center">'
    u = u + '<div class="text-truncate me-auto">10Km</div>'
    u = u + '</div></div>'
    u = u + '<button class="btn btn-icon btn-primary btn-lg rounded-circle startChatButton" data-user="' + users + '">'
    u = u + '<i class="ri-send-plane-fill" data-user="' + users + '"></i>'
    u = u + '</button>'
    // u=u+'<div class="dropdown">'
    // u=u+'<button class="btn btn-icon btn-base btn-sm" type="button" data-bs-toggle="dropdown" aria-expanded="false">'
    // u=u+'<i class="ri-more-fill"></i>'
    // u=u+'</button>'
    // u=u+'<ul class="dropdown-menu dropdown-menu-right">'
    // u=u+'<li><a class="dropdown-item d-flex align-items-center justify-content-between startChatButton" href="#">Start chat<i class="ri-message-2-line"></i></a>'
    // u=u+'</li></ul></div>'
    u = u + '</div></div></li>'


    $("#userList").append(u)

  
}

$("#userList").on('click', '.startChatButton', function (e) {
    e.stopPropagation();
    console.log(e.target)
    let userId = $(e.target).attr("data-user");
    console.log("start chat with " + userId);
    $(".main").empty();

    let chattingroom = `
      <div class="chat d-flex flex-row h-100">
        <div class="chat-body h-100 w-100 d-flex flex-column">
          <div class="chat-header d-flex align-items-center border-bottom px-2">
            <div class="container-fluid">
                <div class="row align-items-center g-0">
                    <div class="col-8 col-sm-5">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1 overflow-hidden">
                                <h6 class="d-block text-truncate mb-1">${userId}</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           </div>

        <div class="chat-content hide-scrollbar h-100">
            <div class="container-fluid g-0 p-4">
                <div class="chatMsg">
       
                </div>

            </div>

            <div class="js-scroll-to-bottom"></div>
        </div>
        <div class="chat-footer d-flex align-items-center border-top px-2">
            <div class="container-fluid">
                <div class="row align-items-center g-4">
                    <div class="col">
                        <div class="input-group">
                            <input type="text" class="form-control form-control-lg" placeholder="Type message" aria-label="type message" id="txtMessage">
                        </div>
                    </div>
                    <div class="col-auto">
                        <ul class="list-inline d-flex align-items-center mb-0">
                            <li class="list-inline-item">
                                <button type="submit" class="btn btn-icon btn-primary btn-lg rounded-circle" id="sendButton">
                                    <i class="ri-send-plane-fill"></i>
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    `;
    $(".main").append(chattingroom);



    $(".main").css("display", "block")
    $("#map").css("display", "none")



})


//입력된 메세지 쌓기
function makeRecv(msg, recvId, direct) {
  let recv = '<div class="message' + direct + '">'
  recv = recv + '<div class="message-wrap">'
  recv = recv + '<div class="message-item">'
  recv = recv + '<div class="message-content">'
  recv = recv + '<span>' + msg + '</span>'
  recv = recv + '</div> </div> </div>'
  recv = recv + '<div class="message-info"> <div>'
  recv = recv + '<h6 class="mb-0">' + recvId + '</h6>'
  recv = recv + '<small class="text-muted">9:15 PM</small>'
  recv = recv + '</div> </div> </div>'

  return recv;
}


$(".main").on('keyup','#txtMessage', function (e) {
  if (e.which === 13) { // 엔터키 누를 때 전송
    e.preventDefault(); // 폼 전송 방지
    console.log("엔터키 입력함");
    sock.send($("#txtMessage").val());
    $(".chatMsg").append(makeRecv($("#txtMessage").val(), id, ' self'));
    $("#txtMessage").val(''); // 메시지 전송 후 텍스트 필드 초기화
  }
});

$(".main").on('click', '#sendButton', function () {
  console.log("버튼 클릭함");
  console.log("메세지 내용 : "+$("#txtMessage").val());
  console.log("sock : "+ sock);
  //sock.send($("#txtMessage").val());
  send0($("#txtMessage").val());
  $(".chatMsg").append(makeRecv($("#txtMessage").val(), id, ' self'));
  $("#txtMessage").val(''); // 메시지 전송 후 텍스트 필드 초기화
});

