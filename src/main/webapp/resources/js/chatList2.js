

//웹소켓 생성
let ipAddress = "192.168.1.199";
let sock = new SockJS("http://" + ipAddress + "/echo");

sock.onopen = function () {
  console.log("연결 성공");
  //sock.send('list');

};


