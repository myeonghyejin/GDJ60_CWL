package com.team.cwl.chat;

import java.util.Date;

import com.team.cwl.member.MemberDTO;

public class ChatDTO extends MemberDTO{
	
	private Long chatNum;

	private Long roomNum;
	


	
	


	public Long getChatNum() {
		return chatNum;
	}

	public void setChatNum(Long chatNum) {
		this.chatNum = chatNum;
	}

	public Long getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(Long roomNum) {
		this.roomNum = roomNum;
	}

}
