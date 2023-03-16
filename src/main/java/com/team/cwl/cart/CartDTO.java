package com.team.cwl.cart;

public class CartDTO {
	private Long cartNum;
	private Long productNum;
	private String memberId;
	private Long cartAmount;
	
	
	public Long getCartNum() {
		return cartNum;
	}

	public void setCartNum(Long cartNum) {
		this.cartNum = cartNum;
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

	public Long getCartAmount() {
		return cartAmount;
	}

	public void setCartAmount(Long cartAmount) {
		this.cartAmount = cartAmount;
	}

	@Override
	public String toString() {
		return "CartDTO [cartNum=" + cartNum + "productNum=" + productNum + "memberId=" + memberId + "cartAmount" + cartAmount + "]";
	}
	
	
}
