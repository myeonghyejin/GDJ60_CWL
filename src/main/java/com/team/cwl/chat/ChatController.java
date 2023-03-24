package com.team.cwl.chat;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.cwl.member.MemberDTO;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@RequestMapping("chatList")
	public void getChatList(HttpServletRequest request) throws Exception{
		List<MemberDTO> ar = new ArrayList<MemberDTO>();
		
		
		for(int i=1; i<=5; i++) {
		MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemberId("id"+i);
			ar.add(memberDTO);
		}
		request.setAttribute("list", ar);
		
		
	}
	
//	
//	@RequestMapping("/chat.json")
//	public List<ChatDTO> getChatList(ChatDTO chatDTO) throws Exception{
//		return chatService.getChatList(chatDTO);
//		
//	}
//	
//	@RequestMapping(value="/chat/add", method=RequestMethod.POST)
//	public void setChatAdd(ChatDTO chatDTO) throws Exception{
//		chatService.setChatAdd(chatDTO);
//	}
	


}
