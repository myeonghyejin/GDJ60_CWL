package com.team.cwl.product;

import java.sql.Date;

public class ProductDTO {
	
	private Long productNum;
	private String memberId;
	private String productName;
	private String productDetail;
	private Long productStock;
	private Long productPrice;
	private Date productDate;
	private Double productState;

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
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}
	public Long getProductStock() {
		return productStock;
	}
	public void setProductStock(Long productStock) {
		this.productStock = productStock;
	}
	public Long getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Long productPrice) {
		this.productPrice = productPrice;
	}
	public Date getProductDate() {
		return productDate;
	}
	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}
	public Double getProductState() {
		return productState;
	}
	public void setProductState(Double productState) {
		this.productState = productState;
	}

}
