
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

let id = '';

function setId(memberId){
  id=memberId;
}


//웹소켓 생성
let ipAddress = "192.168.1.199";
let sock = new SockJS("http://" + ipAddress + "/echo");

sock.onopen = function(){
  console.log("연결 성공");
  send();

};

function send(){
  sock.send('list');
}

sock.onerror = function(error){
  console.log("연결 실패"+error);

  ipAddress = "192.168.1.199";
  sock = new SockJS("http://" + ipAddress + "/echo");

  sock.onopen = function(){
    console.log("ip로 연결성공");
  };

  sock.onerror = function(error){
    console.log("ip도 연결실패"+error);
  };
};



let splitData = [];

sock.onmessage = function (m) {
  splitData = m.data.split(":");
  if (splitData[0] == 'list') {
    splitData[1] = splitData[1].replace(/[\[\] ]/g, '').split(",");
    makeUser(splitData[1]);
    return;
  }
  if (splitData[0] != id) {
    $(".chatMsg").append(makeRecv(splitData[1], splitData[0], ''));
  }
}


$("#txtMessage").on('keypress', function (e) {
  if (e.which === 13) {
    e.preventDefault();
    sock.send($("#txtMessage").val());
    $(".chatMsg").append(makeRecv($("#txtMessage").val(), id, ' self'));
    $("#txtMessage").val('');
  }
});

$("#sendButton").on('click', function () {
  sock.send($("#txtMessage").val());
  $(".chatMsg").append(makeRecv($("#txtMessage").val(), id, ' self'));
  $("#txtMessage").val('');
});




function makeUser(users) {
  for (let i of users) {
    let u = `
      <li class="card contact-item">
        <div class="card-body">
          <div class="d-flex align-items-center">
            <div class="flex-grow-1 overflow-hidden">
              <div class="d-flex align-items-center mb-1">
                <h5 class="text-truncate mb-0 me-auto">${i}</h5>
              </div>
              <div class="d-flex align-items-center">
                <div class="text-truncate me-auto">10Km</div>
              </div>
            </div>
            <button class="btn btn-icon btn-primary btn-lg rounded-circle startChatButton" data-user="${i}">
              <i class="ri-send-plane-fill"></i>
            </button>
          </div>
        </div>
      </li>
    `;
    $("#userList").append(u);
  }


//각자 채팅방 생성
  $(".startChatButton").click(function() {
    let userId = $(this).data("user");
    console.log(`start chat with ${userId}`);
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

  });
}


function makeRecv(msg, recvId, direct){
  return `<div class="message${direct}">
            <div class="message-wrap">
              <div class="message-item">
                <div class="message-content">
                  <span>${msg}</span>
                </div>
              </div>
            </div>
            <div class="message-info">
              <div>
                <h6 class="mb-0">${recvId}</h6>
                <small class="text-muted">9:15 PM</small>
              </div>
            </div>
          </div>`;
}

//-----------------------------


$(".contact-link").click(function(){
  // console.log("클릭");
  $(".main").css("display", "block")
  $("#map").css("display", "none")

})
