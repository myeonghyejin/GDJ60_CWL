
//현재 위치(위도 경도) 권한 요청 및 받아오기 
function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
        console.log(position.coords.latitude + ' ' + position.coords.longitude);
          let container = document.getElementById('map');
          let options = {
            center: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude),
            level: 4
          };
        
          let map = new kakao.maps.Map(container, options);
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

	


$(".bounceInDown").click(function(){
    // console.log("클릭");
    $("#chatting").css("display", "block")
    $("#map").css("display", "none")

})



//웹소켓 생성
let ipAddress = "localhost";
let sock = new SockJS("http://" + ipAddress + "/echo");

sock.onopen = function(){
  console.log("연결 성공");
};

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


