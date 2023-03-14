package com.team.cwl.board.comment;

import java.sql.Date;

public class BoardCommentDTO {
	
	private Long boardCommentNum;
	private Long boardNum;
	private String memberId;
	private String boardCommentContents;
	private Date boardCommentDate;
	
	public Long getBoardCommentNum() {
		return boardCommentNum;
	}
	public void setBoardCommentNum(Long boardCommentNum) {
		this.boardCommentNum = boardCommentNum;
	}
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
	public String getBoardCommentContents() {
		return boardCommentContents;
	}
	public void setBoardCommentContents(String boardCommentContents) {
		this.boardCommentContents = boardCommentContents;
	}
	public Date getBoardCommentDate() {
		return boardCommentDate;
	}
	public void setBoardCommentDate(Date boardCommentDate) {
		this.boardCommentDate = boardCommentDate;
	}

}
