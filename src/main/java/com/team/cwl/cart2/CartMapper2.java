package com.team.cwl.cart2;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
public interface CartMapper2 {
	/* 카트 추가 */
	public int addCart(CartDTO2 cart) throws Exception;
	
	/* 카트 삭제 */
	public int deleteCart(Long cartId);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartDTO2 cart);
	
	/* 카트 목록 */
	public List<CartDTO2> getCartList(String memberId);	
	
	/* 카트 확인 */
	public CartDTO2 checkCart(CartDTO2 cart);		
	
	/* 카트 제거(주문) */
	public int deleteOrderCart(CartDTO2 dto);	
}
