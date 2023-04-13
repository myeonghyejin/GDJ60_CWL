package com.team.cwl.board;

import java.sql.Date;

import com.team.cwl.board.BoardDTO;
import com.team.cwl.board.comment.BoardCommentDTO;

public class BoardDTO{
	
	private Long boardNum;
	private String memberId;
	private String boardTitle;
	private String boardContents;
	private Date boardDate;
	private Long boardHit;
	
	private BoardCommentDTO boardCommentDTOs;
	
	public Long getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(Long boardNum) {
		this.boardNum = boardNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContents() {
		return boardContents;
	}
	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public Long getBoardHit() {
		return boardHit;
	}
	public void setBoardHit(Long boardHit) {
		this.boardHit = boardHit;
	}
	
	public BoardCommentDTO getBoardCommentDTOs() {
		return boardCommentDTOs;
	}
	public void setBoardCommentDTOs(BoardCommentDTO boardCommentDTOs) {
		this.boardCommentDTOs = boardCommentDTOs;
	}

}