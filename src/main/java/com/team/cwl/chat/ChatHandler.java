package com.team.cwl.chat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.team.cwl.member.MemberDTO;

public class ChatHandler extends TextWebSocketHandler{
//	List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();
//	List <WebSocketSession> my = new ArrayList<WebSocketSession>();
//	Map<String, WebSocketSession> map = new HashMap<String, WebSocketSession>();
    private Map<String, WebSocketSession> maps = new HashMap<String, WebSocketSession>();
    //private Map<String, List<WebSocketSession>> personal = new HashMap<String, List<WebSocketSession>>();
	private Map<Set<String>, StringBuffer> personal = new HashMap<Set<String>, StringBuffer>();
	
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
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String strMessage=message.getPayload();
		System.out.println("핸들러 메세지 : "+ strMessage);
		MemberDTO memberDTO=(MemberDTO)session.getAttributes().get("member");
        String memberId = memberDTO.getMemberId();

        // 친구 목록 뜨게 list 전송
		if(strMessage.equals("list")) {
			Gson gson = new Gson();
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("type", "list");
			jsonObject.addProperty("users", maps.keySet().toString().replace(" ", ""));
			String jsonStr = gson.toJson(jsonObject);
			//session.sendMessage(new TextMessage("list:" +maps.keySet().toString().replace(" ", "")));
			session.sendMessage(new TextMessage(jsonStr));
			return;
		}
		
	    // 1:1 채팅 초대 invite 요청 
		if(strMessage.startsWith("invite")){
			System.out.println("invite 요청됨");
			invite(strMessage, memberId, session);
			
		}else {
			System.out.println("여기까지");
			String id = strMessage.substring(0, strMessage.indexOf(" "));
			System.out.println("id:"+id);
			String msg = strMessage.substring(strMessage.indexOf(" ")+1);
//			System.out.println("msg :"+msg);
			Set<String> ids = new HashSet<String>();
			ids.add(id);
			ids.add(memberId);
//			for(WebSocketSession ts : sessions) {
//				ts.sendMessage(new TextMessage(memberId+":"+ msg));
//			}
			
			StringBuffer sb= personal.get(ids);
			sb.append(memberId+":"+ msg);
			maps.get(id).sendMessage(new TextMessage(memberId+":"+ msg));


			
			
	       
			// memberId+":"+ msg => json
			//new new TextMessage(json=>String)
			Gson gson = new Gson();
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("memberId",memberId);
			jsonObject.addProperty("message", msg);
			jsonObject.addProperty("id", id);
			
			String jsonStr = gson.toJson(jsonObject);
			System.out.println(jsonStr);
	        
			session.sendMessage(new TextMessage(jsonStr));
			
			
		}
		
		
	
//전체 메세지 전송 
//		Iterator<String> keys = maps.keySet().iterator();
//		while(keys.hasNext()){
//			String key = keys.next();
//			System.out.println(String.format("키 : %s, 값 : %s", key, maps.get(key)));
//			WebSocketSession webSocketSession = maps.get(key);
//			webSocketSession.sendMessage(new TextMessage(memberDTO.getMemberId()+":"+strMessage));
//			}
	
	//1:1채팅 
	
	}//보내는 메서드 
	
	// 1:1 채팅 초대 요청 처리
	private void invite(String strMessage, String memberId, WebSocketSession session) throws Exception {
	    String[] tokens = strMessage.split(" ");
	    if(tokens.length > 1){
	        String invitedMemberId = tokens[1].trim();//초대된 id
	        System.out.println("invitememberId : "+invitedMemberId);
	        WebSocketSession invitedSession = maps.get(invitedMemberId);//초대된 session
	        System.out.println("초대된 사람 : "+invitedSession);
	        if(invitedSession != null){
	            List<WebSocketSession> personalSessions = new ArrayList<WebSocketSession>();
	            personalSessions.add(invitedSession);
	            personalSessions.add(session);//자기 session
	            
	            Set<String> ids = new HashSet<String>();
	            ids.add(invitedMemberId);
	            ids.add(memberId);
	            System.out.println("1:1 요청 : "+ids);
	            
	            
	            if(!personal.containsKey(ids)) {
	            	personal.put(ids, new StringBuffer());	            	
	            }

	     


//	                invitedSession.sendMessage(new TextMessage(memberId + "과의 대화방에 초대됐습니다 "));
//	                session.sendMessage(new TextMessage(invitedMemberId + "님을 초대했습니다"));
	          }
	            
	    }
	}

}

		

