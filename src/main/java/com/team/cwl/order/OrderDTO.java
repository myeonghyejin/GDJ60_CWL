package com.team.cwl.order;

import java.sql.Date;
import java.util.List;

public class OrderDTO {
	// 주문 번호
	private String orderNum;
	// 회원 아이디
	private String memberId;
	// 배송 받는이
	private String orderDonee;
	// 배송지
	private String orderAddress;
	// 주문요청사항
	private String orderComment;
	// 주문 날짜
	private Date orderDate;
	// 처리상태
	private String orderState;
	// 주문 상품
	private List<OrderItemDTO> orders;

	// 배송비
	private Long orderFee;
	// 판매가(모든 상품 비용)
	private Long orderSalePrice;
	// 최종 판매 비용(배송비 포함)
	private Long orderFinalSalePrice;
	
	
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getOrderDonee() {
		return orderDonee;
	}
	public void setOrderDonee(String orderDonee) {
		this.orderDonee = orderDonee;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getOrderComment() {
		return orderComment;
	}
	public void setOrderComment(String orderComment) {
		this.orderComment = orderComment;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public List<OrderItemDTO> getOrders() {
		return orders;
	}
	public void setOrders(List<OrderItemDTO> orders) {
		this.orders = orders;
	}
	public Long getOrderFee() {
		return orderFee;
	}
	public void setOrderFee(Long orderFee) {
		this.orderFee = orderFee;
	}
	public Long getOrderSalePrice() {
		return orderSalePrice;
	}
	public void setOrderSalePrice(Long orderSalePrice) {
		this.orderSalePrice = orderSalePrice;
	}
	public Long getOrderFinalSalePrice() {
		return orderFinalSalePrice;
	}
	public void setOrderFinalSalePrice(Long orderFinalSalePrice) {
		this.orderFinalSalePrice = orderFinalSalePrice;
	}
	
	@Override
	public String toString() {
		return "OrderDTO [orderNum=" + orderNum + ", memberId=" + memberId + ", orderDonne=" + orderDonee + ", orderAddress=" 
				+ orderAddress + ", orderComment=" + orderComment + ", orderDate=" + orderDate 
				+ ", orderState="+ orderState + ", orderFee=" + orderFee 
				+ ", orderSalePrice=" + orderSalePrice + ", orderFinalSalePrice=" + orderFinalSalePrice + "]";			
	}
	
	public void getOrderPriceInfo() {
		// 상품 비용
		for(OrderItemDTO order : orders) {
			orderSalePrice += order.getTotalPrice();
		}
		// 배송 비용
		if(orderSalePrice >= 30000) {
			orderFee = 0L;
		} else {
			orderFee = 3000L;
		}
		// 최종 판매 비용(상품 비용 + 배송비)
		orderFinalSalePrice = orderSalePrice + orderFee;
	}
	
	
	
	
}
