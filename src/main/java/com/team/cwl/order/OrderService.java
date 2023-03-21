package com.team.cwl.order;

import java.util.List;

public interface OrderService {
	
	// 주문 정보
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders); 
	
	// 주문
	public void order(OrderDTO orderDTO);
	
	// 주문취소
	public void orderCancel(OrderCancelDTO orderCancelDTO );
}
