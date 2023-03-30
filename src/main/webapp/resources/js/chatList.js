
//현재 위치(위도 경도) 권한 요청 및 받아오기 
function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
        console.log(position.coords.latitude + ' ' + position.coords.longitude);
          let container = document.getElementById('map');
          let options = {
            center: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude),
            level: 3
            
          };
        

          let map = new kakao.maps.Map(container, options);

          let imageSrc = 'https://cdn-icons-png.flaticon.com/512/8830/8830938.png', // 마커이미지의 주소입니다    
          imageSize = new kakao.maps.Size(100, 100), // 마커이미지의 크기입니다
          imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
            
          // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
          var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
              markerPosition = new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude); // 마커가 표시될 위치입니다

          // 마커를 생성합니다
          var marker = new kakao.maps.Marker({
              position: markerPosition, 
              image: markerImage // 마커이미지 설정 
          });

          // 마커가 지도 위에 표시되도록 설정합니다
          marker.setMap(map);  


	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } else {
	    alert('GPS를 지원하지 않습니다');
	  }
	}
	getLocation();


const COORDS = "coords"; 

function saveCoords(coordsObj) {
    localStorage.setItem(COORDS, JSON.stringify(coordsObj)); 
    //localstorage의 key, value 값은 모두 string 타입으로 저장되기때문에 변환시켜준다. 
    }

function handleSuccess(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;
    const coordsObj = { // 객체의 key,  value 값이 동일할 때에는 한번만 써줘도 된다.
        latitude,       // localStorage에 객체로 value에 저장하기위해서 객체에 넣어준다.    
        longitude
    };
    saveCoords(coordsObj); // localStorage에 위치 저장 
}

function handleError() {
    console.log('cant not access to location');
}

function askForCoords() {
    navigator.geolocation.getCurrentPosition(handleSuccess, handleError);
}


function loadCoords() {
    const loadedCoords = localStorage.getItem(COORDS);
    if(loadedCoords === null) { 
        // localStorage에 좌표값이 저장되어있지않다면
        askForCoords(); // 좌표값을 물어본다
    } 
}

function init() {
    loadCoords();
}

init();

	


$(".contact-link").click(function(){
    // console.log("클릭");
    $(".main").css("display", "block")
    $("#map").css("display", "none")

})

$(".dropdown-item").click(function(){
  // console.log("클릭");
  $(".main").css("display", "block")
  $("#map").css("display", "none")

})



//-------------------------------------

let id = '';

function setId(memberId){
  id=memberId;
}


//웹소켓 생성
let ipAddress = "localhost";
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







function makeRecv(msg, recvId, direct){
    let recv='<div class="message'+direct+'">'
    recv= recv+'<div class="message-wrap">'
    recv = recv+'<div class="message-item">'
    recv = recv +'<div class="message-content">'
    recv = recv+'<span>'+msg+'</span>'
    recv = recv+'</div> </div> </div>'
    recv = recv+'<div class="message-info"> <div>'
    recv = recv+'<h6 class="mb-0">'+recvId+'</h6>'
    recv = recv+'<small class="text-muted">9:15 PM</small>'
    recv = recv+'</div> </div> </div>'

    return recv;
}


sock.onmessage = function (m){

    console.log(m)

    console.log("받는 메세지 : "+m.data)
    let splitData = m.data.split(":")
    console.log(splitData[0])
    console.log(splitData[1])

    if(splitData[0]=='list'){
      splitData[1]=splitData[1].replace('[', '');
      splitData[1]=splitData[1].replace(']', '');
      splitData[1]=splitData[1].replace(' ', '');
      splitData[1]=splitData[1].split(",");
      console.log("users : ", splitData[1])
      return;
    }

    if(splitData[0]!=id){
      $(".chatMsg").append(makeRecv(splitData[1],splitData[0],''));
    }

  

}



$("#txtMessage").on('keypress', function(e) {
  if (e.which === 13) { // 엔터키 누를 때 전송
      e.preventDefault(); // 폼 전송 방지
      console.log("엔터키 입력함");
      sock.send($("#txtMessage").val());
      $(".chatMsg").append(makeRecv($("#txtMessage").val(),id,' self'));
      $("#txtMessage").val(''); // 메시지 전송 후 텍스트 필드 초기화
  }
});

$("#sendButton").on('click', function() {
  console.log("버튼 클릭함");
  sock.send($("#txtMessage").val());
  $(".chatMsg").append(makeRecv($("#txtMessage").val(),id,' self'));
  $("#txtMessage").val(''); // 메시지 전송 후 텍스트 필드 초기화
});

