package com.team.cwl.product.qna;

import java.sql.Date;

public class ProductQnADTO {
	
	private Long productQnANum;
	private Long productNum;
	private String memberId;
	private String productQnATitle;
	private String productQnAContents;
	private Date productQnADate;
	private Long productQnARef;
	private Long productQnAStep;
	private Long productQnADepth;
	private Integer productQnASecret;
	
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
	public String getProductQnATitle() {
		return productQnATitle;
	}
	public void setProductQnATitle(String productQnATitle) {
		this.productQnATitle = productQnATitle;
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
	public Long getProductQnARef() {
		return productQnARef;
	}
	public void setProductQnARef(Long productQnARef) {
		this.productQnARef = productQnARef;
	}
	public Long getProductQnAStep() {
		return productQnAStep;
	}
	public void setProductQnAStep(Long productQnAStep) {
		this.productQnAStep = productQnAStep;
	}
	public Long getProductQnADepth() {
		return productQnADepth;
	}
	public void setProductQnADepth(Long productQnADepth) {
		this.productQnADepth = productQnADepth;
	}
	public Integer getProductQnASecret() {
		return productQnASecret;
	}
	public void setProductQnASecret(Integer productQnASecret) {
		this.productQnASecret = productQnASecret;
	}

}
