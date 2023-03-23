package com.team.cwl.cart2;

import java.util.List;


import org.mybatis.spring.annotation.MapperScan;


@MapperScan(basePackages = "CartMapper")
public interface CartMapper {
	/* 카트 추가 */
	public int cartAdd(CartDTO2 cart) throws Exception;
	
	/* 카트 삭제 */
	public int cartDelete(Long cartId);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartDTO2 cart);
	
	/* 카트 목록 */
	public List<CartDTO2> cartList(String memberId);	
	
	/* 카트 확인 */
	public CartDTO2 checkCart(CartDTO2 cart);		
	
	/* 카트 제거(주문) */
	public int deleteOrderCart(CartDTO2 dto);	
}