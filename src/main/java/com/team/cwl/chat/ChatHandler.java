package com.team.cwl.chat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.team.cwl.member.MemberDTO;
import com.team.cwl.member.MemberMapper;
import com.team.cwl.member.MemberService;
import com.team.cwl.member.MemberServiceImpl;

public class ChatHandler extends TextWebSocketHandler{
//	List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();
//	List <WebSocketSession> my = new ArrayList<WebSocketSession>();
    private Map<String, WebSocketSession> maps = new HashMap<String, WebSocketSession>();
    private Map<MemberDTO, WebSocketSession> mw = new HashMap<MemberDTO, WebSocketSession>();

//	private Map<Set<String>, StringBuffer> personal = new HashMap<Set<String>, StringBuffer>();
    private Map<String, Map<String, Long>> idChatInfo = new HashMap<String, Map<String,Long>>();
    private Map<Long, JsonArray> messages = new HashMap<Long, JsonArray>();
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private ChatDAO chatDAO;
	@Autowired
	private ChatService chatService;
	
	//소켓 연결 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		System.out.println("소켓 연결됨 : " + session);
		MemberDTO memberDTO=(MemberDTO)session.getAttributes().get("member");
		System.out.println("채팅 로그인 : "+memberDTO.getMemberId());
		maps.put(memberDTO.getMemberId(), session);
		mw.put(memberDTO, session);

		idChatInfo.put(memberDTO.getMemberId(), new HashMap<String, Long>());
		
	}
	
	//소켓 종료 
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("소켓 종료 :" + session.getId());
		MemberDTO memberDTO = (MemberDTO) session.getAttributes().get("member");
        String memberId = memberDTO.getMemberId();
        
        
        //내 아이디로 value(map) 가져오기 
        Map<String, Long> m2 = idChatInfo.get(memberId);
        
        //꺼낸 value로 key(String)가져오기 
        Iterator<String> it =m2.keySet().iterator();
        
        
        
        while(it.hasNext()) {
        	
        	// b c 
        	// b : 1
        	// c : 2
        	//m2의키 가져오기 =it
        	// 값이 m2.get(it.next())인
        	ChatDTO chatDTO = new ChatDTO();
        	
        	chatDTO.setM1(memberId);
        	chatDTO.setM2(it.next());
        	chatDTO.setRoomNum(m2.get(chatDTO.getM2()));
        	chatDTO.setMessageContents(messages.get(chatDTO.getRoomNum()).toString());
        	
//        	System.out.println("내 아디 : "+chatDTO.getM1() + "/ 상대방  : "+ chatDTO.getM2() + "/ 방번호 : "+ chatDTO.getRoomNum() + "/ 메세지 내용 : " + chatDTO.getMessageContents());
        	
            if(chatService.getChatContents(chatDTO)==null) {
            	//채팅 내용 인서트 
            	System.out.println("채팅 내용 인서트 ");
            	chatService.setChatRoom(chatDTO);

            }else {
            	System.out.println("채팅 내용 업데이트");
            	//업데이트 
            	chatService.setChatContents(chatDTO);
				
			}
				
            

        }
        
        
		maps.remove(memberId);
		mw.remove(memberDTO);
	    //personal.remove(memberId);

		//super.afterConnectionClosed(session, status);
	}
	
	//메세지 발송 
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception  {
		
		String strMessage=message.getPayload();
//		System.out.println("핸들러 메세지 : "+ strMessage);
		Gson g = new Gson();
		MessageDTO messageDTO = g.fromJson(strMessage, MessageDTO.class);
//		System.out.println(messageDTO.getType());
		MemberDTO memberDTO=(MemberDTO)session.getAttributes().get("member");
        String memberId = memberDTO.getMemberId();
//        String memberSI = memberDTO.getMemberSI();

        
        //type이 list일때 친구목록 띄우는 메서드 출력 
        if(messageDTO.getType().equals("list")) {
        	makeList(session, memberDTO);
        }
        
        //type이 msg일때 메세지 보내는 메서드 출력  
        if(messageDTO.getType().equals("msg")) {
        	makeMessage(messageDTO, memberDTO);
        }
        
	
	    //type이 invite일때 세션에 추가하는 메서드 출력   
		if(messageDTO.getType().equals("invite")){
//			System.out.println("invite 요청됨");
			invite(messageDTO, memberDTO.getMemberId(), session);
		}
		
		
	}
	
	// 1:1 채팅 초대 요청 처리
	private Long invite(MessageDTO messageDTO, String host, WebSocketSession session) throws Exception {
	   ChatDTO chatDTO = new ChatDTO();
	   WebSocketSession invitedSession = maps.get(messageDTO.getReceiveId());//초대된 session
//	        System.out.println("초대된 세션 : "+invitedSession);
	        long roomNum = 0;
	        
	        if(invitedSession != null){
	        	
	        	//Map<String, Map<String, Long>> idChatInfo 
	        	
	            //host(memberId)가 키인 벨류(맵)을 꺼내와서 myInfo 라고 지정하고 
	            Map<String, Long> myInfo = idChatInfo.get(host);

	            //messageDTO.getReceivedId가 키인 벨류(맵)을 꺼내와서 receive라고 지정하고 
	            Map<String, Long> receive = idChatInfo.get(messageDTO.getReceiveId());
	            
	            if(receive != null) {
	            	
	            	//receive의 키가 host(memberId)로 된 map이 있는지 확인 
	            	boolean check = receive.containsKey(host);
	            	
	            	//없으면 
	            	if(!check) {
	            		//넣어주기 
	            		chatDTO.setM1(host);
	            		chatDTO.setM2(messageDTO.getReceiveId());
	            		ChatDTO chatMsg = chatService.getChatContents(chatDTO);
	            		if(chatMsg==null) {
	            			roomNum = chatService.getChatRoomNum();
	            			receive.put(host, roomNum);
	            			myInfo.put(messageDTO.getReceiveId(), roomNum);
	            			messages.put(roomNum, new JsonArray());
	            			
	            		}else{
	            			roomNum= chatMsg.getRoomNum();
	            			receive.put(host,chatMsg.getRoomNum());
	            			myInfo.put(messageDTO.getReceiveId(), chatMsg.getRoomNum());
	            			Gson g = new Gson();
	            			JsonParser jp = new JsonParser();
	            			JsonElement element = jp.parse(chatMsg.getMessageContents());
	            			messages.put(chatMsg.getRoomNum(), element.getAsJsonArray());
	            			chatDTO.setRoomNum(roomNum);
	                    	chatDTO.setMessageContents(messages.get(chatDTO.getRoomNum()).toString());
	                    	
	            		}
	            		
	            	}else {
						roomNum = idChatInfo.get(messageDTO.getReceiveId()).get(host);
					}
	            }
	            
	          }
	        JsonObject jsonObject = new JsonObject();
	        
	        if(roomNum==0) {
	        	jsonObject.addProperty("type", "msg");
	        	jsonObject.addProperty("value", "상대를 찾을수 없습니다. 새로고침을 해보세요 ");
	    		jsonObject.addProperty("sendTime", Calendar.getInstance().getTimeInMillis());

	        	session.sendMessage(new TextMessage(jsonObject.toString()));
	        	
	        	
	        	return roomNum;
	        }else {
	        	
//	        	System.out.println("invite : "+ host + " / receive :"+ messageDTO.getReceiveId()+" / roomNum : " +roomNum );
	        	JsonArray msgs = messages.get(roomNum);
	        	jsonObject.addProperty("type", "invite");
	        	jsonObject.add("value", new Gson().toJsonTree(msgs));
	        	
	        	session.sendMessage(new TextMessage(jsonObject.toString()));
	        	
	        	return roomNum;
	        	
	        }
	       
	}
	
	private void makeList(WebSocketSession session, MemberDTO memberDTO) throws Exception {
	    //private Map<MemberDTO, WebSocketSession> mw = new HashMap<MemberDTO, WebSocketSession>();
	
		// 친구 목록 뜨게 list 전송
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();		
		
		
		jsonObject.addProperty("type", "list");
//		jsonObject.add("value", gson.toJsonTree(mw.keySet().toArray()));
		List<String> members = new ArrayList<String>();
		for(MemberDTO member : mw.keySet()) {
		    members.add(member.getMemberId());
		    members.add(member.getMemberSI());
		}
		jsonObject.add("value", gson.toJsonTree(members.toArray()));
//		System.out.println(gson.toJsonTree(members.toArray()));
//	    
//	    // "intro" 속성을 만드는 부분 수정
//	    JsonArray introArray = new JsonArray();
//	    introArray.add(memberDTO.getMemberId());
//	    introArray.add(memberDTO.getMemberSI());
//	    jsonObject.add("intro", introArray);
//

		
		String jsonStr = jsonObject.toString();
		session.sendMessage(new TextMessage(jsonStr));

	}
	
	
	private String makeMessage(MessageDTO messageDTO, MemberDTO memberDTO) throws Exception {
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("type", "msg");
		jsonObject.addProperty("senderId",memberDTO.getMemberId());
		jsonObject.addProperty("receiveId",messageDTO.getReceiveId());
		jsonObject.addProperty("sendTime", Calendar.getInstance().getTimeInMillis());
		
		
		if(maps.get(messageDTO.getReceiveId())==null){
			System.out.println("채팅상대가 나갔습니다.");
			
			jsonObject.addProperty("value", "**채팅상대가 온라인중이 아닙니다**");
			String jsonStr = jsonObject.toString();

			maps.get(memberDTO.getMemberId()).sendMessage(new TextMessage(jsonStr));

			return jsonStr;

		}else {
			jsonObject.addProperty("value", messageDTO.getValue());
//			System.out.println("json object: "+ jsonObject.toString());
			Long roomNum = idChatInfo.get(memberDTO.getMemberId()).get(messageDTO.getReceiveId());

			if(roomNum==null) {
				roomNum = idChatInfo.get(messageDTO.getReceiveId()).get(memberDTO.getMemberId());


			}
//			System.out.println(roomNum);
			messages.get(roomNum).add(jsonObject);
//			System.out.println("messageList : " + messages.get(roomNum).toString());
			
			String jsonStr = jsonObject.toString();
			
			maps.get(messageDTO.getReceiveId()).sendMessage(new TextMessage(jsonStr));
			maps.get(memberDTO.getMemberId()).sendMessage(new TextMessage(jsonStr));
			
			return jsonStr;
		}
		
		
	}
	
	
	
}