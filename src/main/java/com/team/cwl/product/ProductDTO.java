package com.team.cwl.product;

import java.sql.Date;
import java.util.List;

public class ProductDTO {
	
	private Long productNum;
	private String memberId;
	private String productName;
	private String productDetail;
	private int productStock;
	private int productPrice;
	private Date productDate;
	private Integer productState;
	
	private List<ProductImgDTO> productImgDTOs;

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
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public Date getProductDate() {
		return productDate;
	}
	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}
	public Integer getProductState() {
		return productState;
	}
	public void setProductState(Integer productState) {
		this.productState = productState;
	}
	public List<ProductImgDTO> getProductImgDTOs() {
		return productImgDTOs;
	}
	public void setProductImgDTOs(List<ProductImgDTO> productImgDTOs) {
		this.productImgDTOs = productImgDTOs;
	}
	@Override
	public String toString() {
		return "ProductDTO [productNum=" + productNum + ", memberId=" + memberId + ", productName=" + productName
				+ ", productDetail=" + productDetail + ", productStock=" + productStock + ", productPrice="
				+ productPrice + ", productDate=" + productDate + ", productState=" + productState + ", productImgDTOs="
				+ productImgDTOs + "]";
	}
	
	
	
	
	
}
