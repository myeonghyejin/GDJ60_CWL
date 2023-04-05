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
//	Map<String, WebSocketSession> map = new HashMap<String, WebSocketSession>();
    private Map<String, WebSocketSession> maps = new HashMap<String, WebSocketSession>();
    //private Map<String, List<WebSocketSession>> personal = new HashMap<String, List<WebSocketSession>>();
	private Map<Set<String>, StringBuffer> personal = new HashMap<Set<String>, StringBuffer>();
	
	@Autowired
	private MemberService memberService;
	
	//소켓 연결 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("소켓 연결됨 : " + session);
		MemberDTO memberDTO=(MemberDTO)session.getAttributes().get("member");
		System.out.println("채팅 로그인 : "+memberDTO.getMemberId());
		maps.put(memberDTO.getMemberId(), session);
			


		
	}
	
	//소켓 종료 
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("소켓 종료 :" + session.getId());
		MemberDTO memberDTO = (MemberDTO) session.getAttributes().get("member");
        String memberId = memberDTO.getMemberId();
		
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
        System.out.println(memberDTO);
        
        // 친구 목록 뜨게 list 전송
		if(messageDTO.getType().equals("list")) {
			Gson gson = new Gson();
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("type", "list");
			jsonObject.add("value",gson.toJsonTree(maps.keySet().toArray()));
			System.out.println(memberDTO.getMemberSI());
			if(memberDTO.getMemberSI() == null ) {
				// 회원 정보가 세션에 없는 경우, DB에서 가져와서 세션에 설정
				memberDTO = memberService.getMemberInfo(memberId);
			    System.out.println("memberDTO : "+memberDTO);
			    if(memberDTO != null) {
			    jsonObject.addProperty("intro", memberDTO.getMemberSI()); // 세션에 회원 정보를 설정
			    }
			}else {
				jsonObject.addProperty("intro",memberDTO.getMemberSI());
			}
			String jsonStr = jsonObject.toString();
			session.sendMessage(new TextMessage(jsonStr));
			return;
		}

        // 채팅했던 친구 목록 뜨게 list 전송
		if(messageDTO.getType().equals("list-2nd")) {
			Gson gson = new Gson();
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("type", "list-2nd");
			jsonObject.add("value",gson.toJsonTree(maps.keySet().toArray()));
			String jsonStr = jsonObject.toString();
			session.sendMessage(new TextMessage(jsonStr));
			return;
		}
		
	    // 1:1 채팅 초대 invite 요청 
		if(messageDTO.getType().equals("invite")){
			System.out.println("invite 요청됨");
			invite(messageDTO, memberId, session);
			
		}
		
		if(messageDTO.getType().equals("msg")){
			System.out.println("msg");
//			
			Set<String> ids = new HashSet<String>();
			ids.add(messageDTO.getReceiveId());
			ids.add(memberId);
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("type", "msg");
			jsonObject.addProperty("value", messageDTO.getValue());
			jsonObject.addProperty("senderId",memberDTO.getMemberId());
			jsonObject.addProperty("sendTime", Calendar.getInstance().getTimeInMillis());
			
			
			String jsonStr = jsonObject.toString();
			System.out.println(jsonStr);
			
			maps.get(messageDTO.getReceiveId()).sendMessage(new TextMessage(jsonStr));
		}
		
		
//전체 메세지 전송 
//		Iterator<String> keys = maps.keySet().iterator();
//		while(keys.hasNext()){
//			String key = keys.next();
//			System.out.println(String.format("키 : %s, 값 : %s", key, maps.get(key)));
//			WebSocketSession webSocketSession = maps.get(key);
//			webSocketSession.sendMessage(new TextMessage(memberDTO.getMemberId()+":"+strMessage));
//			}
	
	}//보내는 메서드 끝 
	
	// 1:1 채팅 초대 요청 처리
	private void invite(MessageDTO messageDTO,String host, WebSocketSession session) throws Exception {
	      
	   WebSocketSession invitedSession = maps.get(messageDTO.getValue());//초대된 session
	        System.out.println("초대된 세션 : "+invitedSession);
	        if(invitedSession != null){
	            List<WebSocketSession> personalSessions = new ArrayList<WebSocketSession>();
	            personalSessions.add(invitedSession);
	            personalSessions.add(session);//자기 session
	            
	            Set<String> ids = new HashSet<String>();
	            ids.add(messageDTO.getValue());
	            ids.add(host);
	            System.out.println("1:1 요청 : "+ids);
	            
	            
	            if(!personal.containsKey(ids)) {
	            	personal.put(ids, new StringBuffer());	            	
	            }

	          }
	            
	    
	}

}

		
