package com.team.cwl.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.team.cwl.chat.ChatDAO.";
	
	
	//채팅 내용 가져오기 
	public ChatDTO getChatContents(ChatDTO chatDTO) throws Exception{
		System.out.println("DAO");
		return sqlSession.selectOne(NAMESPACE + "getChatContents", chatDTO);
	}

	//채팅 내용 업데이트  
	public int setChatContents(ChatDTO chatDTO) {
		return sqlSession.update(NAMESPACE + "setChatContents", chatDTO);
	}
	
	//방번호 시퀀스 생성  
	public Long getChatRoomNum() {
		return sqlSession.selectOne(NAMESPACE+"getChatRoomNum");
	}
	
	//채팅방 새로 생성 
	public int setChatRoom(ChatDTO chatDTO) {
		return sqlSession.insert(NAMESPACE+"setChatRoom", chatDTO);
	}


}
