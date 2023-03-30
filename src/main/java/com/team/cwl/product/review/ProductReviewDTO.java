package com.team.cwl.product.review;

import java.sql.Date;
import java.util.List;

public class ProductReviewDTO {
	
	private Long productReviewNum;
	private Long productNum;
	private String memberId;
	private String productReviewTitle;
	private String productReviewContents;
	private Date productReviewDate;
	private Integer productRating;
	
	private List<ProductReviewImgDTO> productReviewImgDTOs;

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
	public String getProductReviewTitle() {
		return productReviewTitle;
	}
	
	public void setProductReviewTitle(String productReviewTitle) {
		this.productReviewTitle = productReviewTitle;
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

	public Integer getProductRating() {
		return productRating;
	}

	public void setProductRating(Integer productRating) {
		this.productRating = productRating;
	}
	public List<ProductReviewImgDTO> getProductReviewImgDTOs() {
		return productReviewImgDTOs;
	}

	public void setProductReviewImgDTOs(List<ProductReviewImgDTO> productReviewImgDTOs) {
		this.productReviewImgDTOs = productReviewImgDTOs;
	}

}