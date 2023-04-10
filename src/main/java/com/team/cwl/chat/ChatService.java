package com.team.cwl.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatService {
	@Autowired
	private ChatDAO chatDAO;
	
	public ChatDTO getChatContents(ChatDTO chatDTO) throws Exception{
		System.out.println("m1"+chatDTO.getM1());
		System.out.println("m2"+chatDTO.getM2());
		System.out.println("Dao ");
		ChatDTO chatDTO2 = null;
		try {	
				chatDTO2=chatDAO.getChatContents(chatDTO);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		System.out.println("Servicd : "+chatDTO2);
		return chatDTO2;
	}
	
	public int setChatContents(ChatDTO chatDTO) {
		return chatDAO.setChatContents(chatDTO);
	}
	
	public Long getChatRoomNum() {
		return chatDAO.getChatRoomNum();
	}
	
	public int setChatRoom(ChatDTO chatDTO) {
		
		return chatDAO.setChatRoom(chatDTO);
	}
}
