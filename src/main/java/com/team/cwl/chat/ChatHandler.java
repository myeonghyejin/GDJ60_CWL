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
		maps.put(memberDTO.getMemberSI(), session);

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
        	
//        	System.out.println(m2.get(it.next())); //roomNum이 나옴 
        	
        	chatService.setChatRoom(chatDTO);
        }
        
        
		maps.remove(memberId);
	    //personal.remove(memberId);

		//super.afterConnectionClosed(session, status);
	}
	
	//메세지 발송 
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception  {
		
		String strMessage=message.getPayload();
		System.out.println("핸들러 메세지 : "+ strMessage);
		Gson g = new Gson();
		MessageDTO messageDTO = g.fromJson(strMessage, MessageDTO.class);
		System.out.println(messageDTO.getType());
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
			System.out.println("invite 요청됨");
			invite(messageDTO, memberDTO.getMemberId(), session);
		}
		
		
	}
	
	// 1:1 채팅 초대 요청 처리
	private Long invite(MessageDTO messageDTO, String host, WebSocketSession session) throws Exception {
	   ChatDTO chatDTO = new ChatDTO();
	   WebSocketSession invitedSession = maps.get(messageDTO.getReceiveId());//초대된 session
	        System.out.println("초대된 세션 : "+invitedSession);
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
	            		System.out.println("Service ");
	            		ChatDTO chatMsg = chatService.getChatContents(chatDTO);
	            		System.out.println("chatMSG:"+chatMsg);
	            		if(chatMsg==null) {
	            			roomNum = chatService.getChatRoomNum();
	            			System.out.println("DB생성 방 번호 : "+roomNum);
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
	            			System.out.println("element : " +element.getAsJsonArray());
	            		}
	            		
	            		
	            	}else {
						roomNum = idChatInfo.get(messageDTO.getReceiveId()).get(host);
					}
	            }
	            
	          }
	        System.out.println("invite : "+ host + " / receive :"+ messageDTO.getReceiveId()+" / roomNum : " +roomNum);
	        JsonArray msgs = messages.get(roomNum);
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("type", "invite");
			jsonObject.add("value", new Gson().toJsonTree(msgs));
			
	        session.sendMessage(new TextMessage(jsonObject.toString()));
	        //invitedSession.sendMessage(new TextMessage(jsonObject.toString()));
	        
	        
	        return roomNum;
	}
	
	private void makeList(WebSocketSession session, MemberDTO memberDTO) throws Exception {
		// 친구 목록 뜨게 list 전송
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("type", "list");
		jsonObject.add("value", gson.toJsonTree(maps.keySet().toArray()));
//		jsonObject.add("intro", gson.toJsonTree(maps.keySet().);

		memberDTO = (MemberDTO) session.getAttributes().get("member");
		
		System.out.println( "member DTO : "+memberDTO);

		String jsonStr = jsonObject.toString();
		session.sendMessage(new TextMessage(jsonStr));

	}
	
	private String makeMessage(MessageDTO messageDTO, MemberDTO memberDTO) throws Exception {
		System.out.println("msg");
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("type", "msg");
		jsonObject.addProperty("value", messageDTO.getValue());
		jsonObject.addProperty("senderId",memberDTO.getMemberId());
		jsonObject.addProperty("receiveId",messageDTO.getReceiveId());
		jsonObject.addProperty("sendTime", Calendar.getInstance().getTimeInMillis());
		
		System.out.println("json object: "+ jsonObject.toString());
		Long roomNum = idChatInfo.get(memberDTO.getMemberId()).get(messageDTO.getReceiveId());
		messages.get(roomNum).add(jsonObject);
		System.out.println("messageList : " + messages.get(roomNum).toString());
		
		
		String jsonStr = jsonObject.toString();
		System.out.println(jsonStr);
		
		maps.get(messageDTO.getReceiveId()).sendMessage(new TextMessage(jsonStr));
		maps.get(memberDTO.getMemberId()).sendMessage(new TextMessage(jsonStr));
		
		return jsonStr;
	}
	
	
	
}

		
