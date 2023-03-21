package com.team.cwl.order;

public class OrderPageItemDTO {
	
	// 뷰로부터 전달받을 값
	private Long productNum;
	
	private Long orderCount;
	
	// DB로부터 꺼내올 값
	private String productName;
	
	private Long productPrice;
	
	// 만들어 낼 값
	private Long totalPrice;

	
	public Long getProductNum() {
		return productNum;
	}

	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}

	public Long getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(Long orderCount) {
		this.orderCount = orderCount;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Long getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Long productPrice) {
		this.productPrice = productPrice;
	}

	public Long getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Long totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
	public void initTotal() {
		this.totalPrice = this.productPrice*this.orderCount;
	}
	
	@Override
	public String toString() {
		return "OrderPageItemDTO [productNum=" + productNum + ", orderCount=" + orderCount + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", totalPrice=" + totalPrice + "]";
	}
	
	
	
	
	
	
	
}
