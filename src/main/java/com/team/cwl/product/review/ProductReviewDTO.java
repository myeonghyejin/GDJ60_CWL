package com.team.cwl.product.review;

import java.sql.Date;

import com.team.cwl.board.comment.BoardCommentDTO;

public class ProductReviewDTO extends BoardCommentDTO {
	
	private Long productReviewNum;
	private Long productNum;
	private String memberId;
	private String productReviewContents;
	private Date productReviewDate;
	private Integer lessonRating;
	
	public Long getProductReviewNum() {
		return productReviewNum;
	}
	
	public void setProductReviewNum(Long productReviewNum) {
		this.productReviewNum = productReviewNum;
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
	
	public String getProductReviewContents() {
		return productReviewContents;
	}
	
	public void setProductReviewContents(String productReviewContents) {
		this.productReviewContents = productReviewContents;
	}
	
	public Date getProductReviewDate() {
		return productReviewDate;
	}
	
	public void setProductReviewDate(Date productReviewDate) {
		this.productReviewDate = productReviewDate;
	}
	public Integer getLessonRating() {
		return lessonRating;
	}

	public void setLessonRating(Integer lessonRating) {
		this.lessonRating = lessonRating;
	}

}