package com.team.cwl.cart;

import java.util.List;

import com.team.cwl.product.ProductImgDTO;

public class CartDTO {
	
	private Long cartNum;
	
	private String memberId;
	
	private Long productNum;
	
	private int orderStock;
	
	// product	
	private String productName;
	
	private int productPrice;
	
	// 추가
	private int totalPrice;
	
	/* 상품 이미지 */
	private List<ProductImgDTO> imageList;

	public Long getCartNum() {
		return cartNum;
	}

	public void setCartNum(Long cartNum) {
		this.cartNum = cartNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Long getProductNum() {
		return productNum;
	}

	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}

	public int getOrderStock() {
		return orderStock;
	}

	public void setOrderStock(int orderStock) {
		this.orderStock = orderStock;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public List<ProductImgDTO> getImageList() {
		return imageList;
	}

	public void setImageList(List<ProductImgDTO> imageList) {
		this.imageList = imageList;
	}

	
	public void initTotal() {
		this.totalPrice = this.productPrice*this.orderStock;
	}
	
	
	@Override
	public String toString() {
		return "CartDTO [cartNum=" + cartNum + ", memberId=" + memberId + ", productNum=" + productNum
				+ ", orderStock=" + orderStock + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", totalPrice=" + totalPrice + ", imageList=" + imageList + "]";
	}
	
	
	
	
	
}
