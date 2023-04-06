package com.team.cwl.chat;

import java.util.Date;

import com.team.cwl.member.MemberDTO;

public class ChatDTO{
	
	private Long roomNum;

	private String m1;
	
	private String m2;
	
	private String messageContents;


	
	


	public String getM1() {
		return m1;
	}

	public void setM1(String m1) {
		this.m1 = m1;
	}

	public String getM2() {
		return m2;
	}

	public void setM2(String m2) {
		this.m2 = m2;
	}

	public String getMessageContents() {
		return messageContents;
	}

	public void setMessageContents(String messageContents) {
		this.messageContents = messageContents;
	}

	public Long getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(Long roomNum) {
		this.roomNum = roomNum;
	}

	
	

}
