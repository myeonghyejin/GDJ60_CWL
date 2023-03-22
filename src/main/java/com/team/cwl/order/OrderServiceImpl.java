package com.team.cwl.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.cwl.cart.CartDTO;
import com.team.cwl.member.MemberDTO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired(required=false)
	private OrderMapper orderMapper;
	
//	@Autowired
//	private MemberMapper memberMapper;
//	
//	@Autowired
//	private CartMapper cartMapper;
//	
//	@Autowired
//	private ProductMapper productMapper;
	
	@Override
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders) {
		
		List<OrderPageItemDTO> result = new ArrayList<OrderPageItemDTO>();
		
		for(OrderPageItemDTO ord : orders) {
			OrderPageItemDTO goodsInfo = orderMapper.getGoodsInfo(ord.getProductNum());
			goodsInfo.setOrderCount(ord.getOrderCount());
			
			goodsInfo.initTotal();
			
			result.add(goodsInfo);
		}
		return result;
	}
	
	@Override
	@Transactional
	public void order(OrderDTO ord) {
		// 사용할 데이터 가져오기
		// 회원정보
		MemberDTO member = memberMapper.getMemberInfo(ord.getMemberId());
		// 주문정보
//		List<OrderItemDTO> ords = new ArrayList<>();
		for(OrderItemDTO oit : ord.getOrders()) {
			OrderItemDTO orderItem = orderMapper.getOrderInfo(oit.getProductNum());
			// 수량 세팅
			orderItem.setOrderCount(oit.getOrderCount());
			// 기본정보 세팅
			orderItem.initTotal();
			// List 객체 추가
			ords.add(orderItem);
		}
		// OrderDTO 세팅
		ord.setOrders(ords);
		ord.getOrderPriceInfo();
		
		// DB 주문, 주문상품(배송정보) 넣기
		// orderNum 만들기 및 OrderDTO객체 orderNum에 저장
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = member.getMemberId() + format.format(date);
		ord.setOrderNum(orderId);
		
		// DB넣기
		orderMapper.enrollOrder(ord);
		for(OrderItemDTO oit : ord.getOrders()) {
			oit.setOrderNum(orderId);
			orderMapper.enrollOrderItem(oit);
		}
		
		// 비용 변동 적용
		Long calMoney = member.getMemberMoney();
		calMoney -= ord.getOrderFinalSalePrice();
		member.setMemberMoney(calMoney);
		
		orderMapper.deductMoney(member);
		
		// 재고 변동 적용
//		for(OrderItemDTO oit : ord.getOrders()) {
//			// 변동 재고 값 구하기
//			ProductDTO productDTO = ProductMapper.getGoodsInfo(oit.getProductNum());
//			productDTO.setProductStock(productDTO.getProductStock() - oit.getOrderCount());
//			// 변동 값 DB 적용
//			orderMapper.deductStock(productDTO);
//		}
		
		// 장바구니 제거
		for(OrderItemDTO oit : ord.getOrders()) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setMemberId(ord.getMemberId());
			cartDTO.setProductNum(oit.getProductNum());
			
			cartMapper.deleteOrderCart(cartDTO);			
		}
		
	}
	
	// 주문취소
	@Override
	@Transactional
	public void orderCancel(OrderCancelDTO orderCancelDTO) {
		// 주문, 주문상품 객체
		// 회원
		MemberDTO member = memberMapper.getMemberInfo(orderCancelDTO.getOrderNum());
		// 주문상품
		List<OrderItemDTO> ords = orderMapper.getOrderItemInfo(orderCancelDTO.getOrderNum());
		for(OrderItemDTO ord : ords) {
			ord.initTotal();
		}
		// 주문
		OrderDTO orw = orderMapper.getOrder(orderCancelDTO.getOrderNum());
		orw.setOrders(ords);
		
		orw.getOrderPriceInfo();
		
		// 주문상품 취소 DB
		orderMapper.orderCancel(orderCancelDTO.getOrderNum());
		// 돈, 재고 변환
		// 돈
		Long calMoney = member.getMemberMoney();
		calMoney += orw.getOrderFinalSalePrice();
		member.setMemberMoney(calMoney);
		// DB 적용
		orderMapper.deductMoney(member);
		// 재고
		for(OrderItemDTO ord : orw.getOrders()) {
//			ProductDTO productDTO = productMapper.getGoodsInfo(ord.getProductNum());
//			productDTO.setProductStock(productDTO.getProductStock() + ord.getOrderCount());
//			orderMapper.deductStock(productDTO);
		}
		
	}
	
}
