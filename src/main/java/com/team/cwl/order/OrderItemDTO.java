package com.team.cwl.order;

public class OrderItemDTO {
	// 기본키
	private Long orderItemNum;
	// 주문 번호
	private String orderNum;
	// 제품 번호
	private Long productNum;
	// 주문 수량
	private int orderStock;
	// 상품 한 개 가격
	private int productPrice;
	// 총 가격(가격 * 주문 수량)
	private int totalPrice;
	
	
	
	public Long getOrderItemNum() {
		return orderItemNum;
	}

	public void setOrderItemNum(Long orderItemNum) {
		this.orderItemNum = orderItemNum;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
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

	
	@Override
	public String toString() {
		return "OrderItemDTO [orderItemNum=" + orderItemNum + ", orderNum=" + orderNum + ", productNum=" + productNum
				+ ", orderStock=" + orderStock + ", productPrice=" + productPrice + ", totalPrice=" + totalPrice
				+ "]";
	}

	public void initTotal() {
		this.totalPrice = this.productPrice * this.orderStock;
	}
	
	
}
