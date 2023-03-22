package com.team.cwl.cart2;

public class CartDTO2 {
	
	private Long cartNum;
	
	private String memberId;
	
	private Long productNum;
	
	private Long ProductAmount;
	
	// product	
	private String productName;
	
	private Long productPrice;
	
	// Ãß°¡
	private Long totalPrice;

	
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

	public Long getProductAmount() {
		return ProductAmount;
	}

	public void setProductAmount(Long productAmount) {
		ProductAmount = productAmount;
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
		this.totalPrice = this.productPrice * this.ProductAmount;
	}
	
	@Override
	public String toString() {
		return "CartDTO2 [cartNum=" + cartNum + ", memberId=" + memberId + ", productNum=" + productNum + ", productAmount="
				+ ProductAmount + ", productName=" + productName + ", productPrice=" + productPrice+ ", totalPrice=" + totalPrice
				+ "]";
	}
	
	
}
