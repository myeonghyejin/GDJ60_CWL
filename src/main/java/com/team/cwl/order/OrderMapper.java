package com.team.cwl.order;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.team.cwl.member.MemberDTO;
import com.team.cwl.product.ProductDTO;

@MapperScan(basePackages = "OrderMapper")
public interface OrderMapper {
	
	// 주문 상품 정보(주문 페이지)
	public OrderPageItemDTO getProductDetail(Long productNum);
	
	// 주문 상품 정보(주문 처리)
	public OrderItemDTO getOrderInfo(Long productNum);
	
	// 주문 테이블 등록
	public int enrollOrder(OrderDTO ord);
	
	// 주문 아이템 테이블 등록
	public int enrollOrderItem(OrderItemDTO orid);
	
	// 주문 금액 차감
	public int deductMoney(MemberDTO member);
	
	// 주문 재고 차감
	public int deductStock(ProductDTO product);
	
	// 주문 취소
	public int orderCancel(String orderNum);
	
	// 주문 상품 정보(주문취소)
	public List<OrderItemDTO> getOrderItemInfo(String orderNum);
	
	// 주문 정보(주문취소)
	public OrderDTO getOrder(String orderNum);
	
	// 주문 결제
	public int orderPayment(OrderDTO orderDTO) throws Exception;
	
}
