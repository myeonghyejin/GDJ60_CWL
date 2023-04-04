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
	private int orderFee;
	// 주문 날짜
	private Date orderDate;
	
	/* DB 테이블에 존재하지 않는 데이터 */
	// 판매가(모든 상품 비용)
	private Long orderPrice;
	// 최종 판매 비용(배송비 포함)
	private Long orderFinalPrice;
	
	
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

	public int getOrderFee() {
		return orderFee;
	}

	public void setOrderFee(int orderFee) {
		this.orderFee = orderFee;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Long getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(Long orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Long getOrderFinalPrice() {
		return orderFinalPrice;
	}

	public void setOrderFinalPrice(Long orderFinalPrice) {
		this.orderFinalPrice = orderFinalPrice;
	}

	
	
	@Override
	public String toString() {
		return "OrderDTO [orderNum=" + orderNum + ", addressee=" + addressee + ", memberId=" + memberId
				+ ", memberAddress1=" + memberAddress1 + ", memberAddress2=" + memberAddress2 + ", memberAddress3="
				+ memberAddress3 + ", orderState=" + orderState + ", orderComment=" + orderComment + ", orders="
				+ orders + ", orderFee=" + orderFee + ", orderDate=" + orderDate + ", orderPrice=" + orderPrice
				+ ", orderFinalPrice=" + orderFinalPrice + "]";
	}

	public void getOrderPriceInfo() {
		/* 상품 비용 & 적립포인트 */
			for(OrderItemDTO order : orders) {
				orderPrice += order.getTotalPrice();
			}
		/* 배송비용 */
			if(orderPrice >= 30000) {
				orderFee = 0;
			} else {
				orderFee = 3000;
			}
		/* 최종 비용(상품 비용 + 배송비) */
			orderFinalPrice = orderPrice + orderFee;
	}	
	
	
	
	
}