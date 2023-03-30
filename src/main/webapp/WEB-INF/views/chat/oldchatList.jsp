<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<title>Chat List</title>
<link rel="stylesheet" href="/resources/css/chatTemplate.css" />
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7cfe0a988351b935c1deefc425b4cc46"></script>
   
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="../../../resources/css/chatTemplate.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<body>
   <div class="container bootstrap snippets bootdey">
      <div class="row">
         <!-- 회원 목록 -->
         <div class="col-md-4 bg-white ">
            <div class=" row border-bottom padding-sm" style="height: 40px;">
              Member
            </div>
         <ul class="friend-list">
        	 <c:forEach var="dto" items="${list}">
	            <li class="active bounceInDown">
	              <a href="#" class="clearfix">
	                <img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">
	                <div class="friend-name">
	                  <strong>${dto.memberId}</strong>
	                </div>
	                <div class="last-message text-muted">Hello, Are you there?</div>
	                <small class="time text-muted">Just now</small>
	                <small class="chat-alert label label-danger">1</small>
	              </a>
	            </li>
			</c:forEach>
         </ul>    
      </div>
      <div id="map" style="width:500px;height:400px;"></div>


      <div id="chatting">
      <!-- 채팅창 -->
   <div class="col-md-8 bg-white ">
      <div class="chat-message">
         <ul class="chat">
 
         </ul>
      </div>
       <div class="chat-box bg-white">
         <div class="input-group">
           <input class="form-control border no-shadow no-rounded" placeholder="Type your message here" id="txtMessage">
           <span class="input-group-btn">
             <button class="btn btn-success no-rounded" id="sendButton" type="button">Send</button>
           </span>
         </div>
       </div>
       </div> 
      </div>
   </div>
   </div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="/resources/js/chatList.js"></script>

</body>



</html>



