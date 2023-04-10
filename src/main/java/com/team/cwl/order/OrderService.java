package com.team.cwl.order;

import java.util.List;


public interface OrderService {
	
	// 주문 정보
	public List<OrderPageItemDTO> getProductDetail(List<OrderPageItemDTO> orders) throws Exception; 
	
	// 주문
	public void order(OrderDTO orw) throws Exception;
	
	// 주문취소
	public void orderCancel(OrderCancelDTO dto) throws Exception;
	
	// 주문결제
	public void orderPayment(OrderDTO orderDTO) throws Exception;
}
