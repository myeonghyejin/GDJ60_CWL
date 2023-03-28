package com.team.cwl.order;

import java.sql.Date;
import java.util.List;

public class OrderDTO {
	// 주문 번호
	private String orderNum;
	// 배송 받는 사람
	private String addressee;
	// 회원 아이디
	private String memberId;
	// 우편번호
	private String memberAddress1;
	// 회원 주소
	private String memberAddress2;
	// 회원 상세주소
	private String memberAddress3;
	// 처리상태
	private String orderState;
	// 주문요청사항
	private String orderComment;
	// 주문 상품
	private List<OrderItemDTO> orders;
	// 배송비
	private Long orderFee;
	// 주문 날짜
	private Date orderDate;
	
	/* DB 테이블에 존재하지 않는 데이터 */
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

	public String getAddressee() {
		return addressee;
	}

	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberAddress1() {
		return memberAddress1;
	}

	public void setMemberAddress1(String memberAddress1) {
		this.memberAddress1 = memberAddress1;
	}

	public String getMemberAddress2() {
		return memberAddress2;
	}

	public void setMemberAddress2(String memberAddress2) {
		this.memberAddress2 = memberAddress2;
	}

	public String getMemberAddress3() {
		return memberAddress3;
	}

	public void setMemberAddress3(String memberAddress3) {
		this.memberAddress3 = memberAddress3;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public String getOrderComment() {
		return orderComment;
	}

	public void setOrderComment(String orderComment) {
		this.orderComment = orderComment;
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

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
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
		return "OrderDTO [orderNum=" + orderNum + ", memberId=" + memberId + ",addressee=" + addressee + ", memberAddress1=" + memberAddress1 + ", memberAddress2=" 
				+ memberAddress2 + ", memberAddress3=" + memberAddress3 + ", orderState="+ orderState + ", orderComment=" + orderComment + ", orders=" + orders 
				+ ", orderFee=" + orderFee + ", orderDate=" + orderDate + ", orderSalePrice=" + orderSalePrice + ", orderFinalSalePrice=" + orderFinalSalePrice + "]";			
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
