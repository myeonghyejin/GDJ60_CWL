package com.team.cwl.order;

import java.util.List;

import com.team.cwl.member.MemberDTO;

public interface OrderMapper {
	
	// 주문 상품 정보(주문 페이지)
	public OrderPageItemDTO getGoodsInfo(Long productNum);
	
	// 주문 상품 정보(주문 처리)
	public OrderItemDTO getOrderInfo(Long productNum);
	
	// 주문 테이블 등록
	public int enrollOrder(OrderDTO orderDTO);
	
	// 주문 아이템 테이블 등록
	public int enrollOrderItem(OrderItemDTO orderItemDTO);
	
	// 주문 금액 차감
	public int deductMoney(MemberDTO memberDTO);
	
	// 주문 재고 차감
	public int deductStock(ProductDTO productDTO);
	
	// 주문 취소
	public int orderCancel(String orderId);
	
	// 주문 상품 정보(주문취소)
	public List<OrderItemDTO> getOrderItemInfo(String orderId);
	
	// 주문 정보(주문취소)
	public OrderDTO getOrder(String orderId);
	
}
