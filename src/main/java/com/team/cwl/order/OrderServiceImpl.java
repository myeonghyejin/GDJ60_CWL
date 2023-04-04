package com.team.cwl.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.cwl.cart.CartDTO;
import com.team.cwl.cart.CartMapper;
import com.team.cwl.member.MemberDTO;
import com.team.cwl.member.MemberMapper;
import com.team.cwl.product.ProductDAO;
import com.team.cwl.product.ProductDTO;
import com.team.cwl.product.ProductImgDTO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private CartMapper cartMapper;

	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List<OrderPageItemDTO> getProductDetail(List<OrderPageItemDTO> orders) {
		
		List<OrderPageItemDTO> result = new ArrayList<OrderPageItemDTO>();
		
		for(OrderPageItemDTO ord : orders) {
			
			OrderPageItemDTO productDetail = orderMapper.getProductDetail(ord.getProductNum());
			
			productDetail.setProductStock(ord.getProductStock());
			
			productDetail.initTotal();
			
			List<ProductImgDTO> imageList = productDAO.getProductImgList(productDetail.getProductNum());
			
			productDetail.setImageList(imageList);
			
			result.add(productDetail);
		}
		return result;
	}
	
	@Override
	@Transactional
	public void order(OrderDTO ord) {
		/* 사용할 데이터 가져오기 */
		// 회원정보
		MemberDTO member = memberMapper.getMemberInfo(ord.getMemberId());
		// 주문정보
		List<OrderItemDTO> ords = new ArrayList<>();
		for(OrderItemDTO oit : ord.getOrders()) {
			OrderItemDTO orderItem = orderMapper.getOrderInfo(oit.getProductNum());
			// 수량 세팅
			orderItem.setProductStock(oit.getProductStock());
			// 기본정보 세팅
			orderItem.initTotal();
			// List 객체 추가
			ords.add(orderItem);
		}
		// OrderDTO 세팅
		ord.setOrders(ords);
		ord.getOrderPriceInfo();
		
		/* DB 주문, 주문상품(배송정보) 넣기 */
		// orderNum 만들기 및 OrderDTO객체 orderNum에 저장
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderNum = member.getMemberId() + format.format(date);
		ord.setOrderNum(orderNum);
		
		// DB넣기
		orderMapper.enrollOrder(ord); // order 등록
		for(OrderItemDTO oit : ord.getOrders()) { // orderItem 등록
			oit.setOrderNum(orderNum);
			orderMapper.enrollOrderItem(oit);
		}
		
		/* 비용 변동 적용 */
		Long calMoney = member.getMoney();
		calMoney -= ord.getOrderFinalPrice();
		member.setMoney(calMoney);
		
		// 변동된 money DB 적용
		orderMapper.deductMoney(member);
		
		/* 재고 변동 적용 */
		for(OrderItemDTO oit : ord.getOrders()) {
			// 변동 재고 값 구하기
			ProductDTO productDTO = productDAO.getProductDetail(oit.getProductNum());
			productDTO.setProductStock(productDTO.getProductStock() - oit.getProductStock());
			// 변동 값 DB 적용
			orderMapper.deductStock(productDTO);
		}
		
		// 장바구니 제거
		for(OrderItemDTO oit : ord.getOrders()) {
			CartDTO dto = new CartDTO();
			dto.setMemberId(ord.getMemberId());
			dto.setProductNum(oit.getProductNum());
			
			cartMapper.deleteOrderCart(dto);			
		}
		
	}
	
	/* 주문취소 */
	@Override
	@Transactional
	public void orderCancel(OrderCancelDTO dto) {
		/* 주문, 주문상품 객체 */
		// 회원
		MemberDTO member = memberMapper.getMemberInfo(dto.getMemberId());
		// 주문상품
		List<OrderItemDTO> ords = orderMapper.getOrderItemInfo(dto.getOrderNum());
		for(OrderItemDTO ord : ords) {
			ord.initTotal();
		}
		// 주문
		OrderDTO orw = orderMapper.getOrder(dto.getOrderNum());
		orw.setOrders(ords);
		
		orw.getOrderPriceInfo();
		
		/* 주문상품 취소 DB */
		orderMapper.orderCancel(dto.getOrderNum());
		/* 돈, 재고 변환 */
		// 돈
		Long calMoney = member.getMoney();
		calMoney += orw.getOrderFinalPrice();
		member.setMoney(calMoney);
		// DB 적용
		orderMapper.deductMoney(member);
		// 재고
		for(OrderItemDTO ord : orw.getOrders()) {
			ProductDTO productDTO = productDAO.getProductDetail(ord.getProductNum());
			productDTO.setProductStock(productDTO.getProductStock() + ord.getProductStock());
			orderMapper.deductStock(productDTO);
		}
		
	}
	
}
