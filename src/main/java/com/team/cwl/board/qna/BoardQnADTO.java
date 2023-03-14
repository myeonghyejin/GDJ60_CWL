package com.team.cwl.board.qna;

import java.sql.Date;

public class BoardQnADTO {
	
	private Long productQnANum;
	private Long productNum;
	private String memberId;
	private String productQnAContents;
	private Date productQnADate;
	
	public Long getProductQnANum() {
		return productQnANum;
	}
	public void setProductQnANum(Long productQnANum) {
		this.productQnANum = productQnANum;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getProductQnAContents() {
		return productQnAContents;
	}
	public void setProductQnAContents(String productQnAContents) {
		this.productQnAContents = productQnAContents;
	}
	public Date getProductQnADate() {
		return productQnADate;
	}
	public void setProductQnADate(Date productQnADate) {
		this.productQnADate = productQnADate;
	}

}
