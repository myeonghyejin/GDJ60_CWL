package com.team.cwl.chat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.xml.crypto.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.team.cwl.member.MemberDTO;

public class ChatHandler extends TextWebSocketHandler{
//	List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();
//	List <WebSocketSession> my = new ArrayList<WebSocketSession>();
//	Map<String, WebSocketSession> map = new HashMap<String, WebSocketSession>();
	Map<String, WebSocketSession> maps = new HashMap<String, WebSocketSession>();
	Map<String, List<WebSocketSession>> personal = new HashMap<String, List<WebSocketSession>>();
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("연결됨 : " + session);
		MemberDTO memberDTO=(MemberDTO)session.getAttributes().get("member");
		System.out.println("로그인"+memberDTO.getMemberId());
		maps.put(memberDTO.getMemberId(), session);
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId());
		maps.remove(session);
		super.afterConnectionClosed(session, status);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String strMessage=message.getPayload();
		System.out.println(strMessage);
		
		
		
//		//map 반복문
//		for(WebSocketSession webSocketSession:maps){
//			webSocketSession.sendMessage(new TextMessage(strMessage));
//		}
//		super.handleTextMessage(session, message);
//	}
	
	//map 반복문 
	Iterator<String> keys = maps.keySet().iterator();
	while(keys.hasNext()){
		String key = keys.next();
		System.out.println(String.format("키 : %s, 값 : %s", key, maps.get(key)));
		WebSocketSession webSocketSession = maps.get(key);
		webSocketSession.sendMessage(new TextMessage(strMessage));
	}
	super.handleTextMessage(session, message);
	}
	
	public void myMethod() {
		
	}
}
