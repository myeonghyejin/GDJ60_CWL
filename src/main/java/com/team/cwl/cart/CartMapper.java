package com.team.cwl.cart;

import java.util.List;


import org.mybatis.spring.annotation.MapperScan;


@MapperScan(basePackages = "CartMapper")
public interface CartMapper {
	/* 카트 추가 */
	public int cartAdd(CartDTO cart) throws Exception;
	
	/* 카트 삭제 */
	public int cartDelete(Long cartNum);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartDTO cart);
	
	/* 카트 목록 */
	public List<CartDTO> cartList(String memberId);	
	
	/* 카트 확인 */
	public CartDTO checkCart(CartDTO cart);		
	
	/* 카트 제거(주문) */
	public int deleteOrderCart(CartDTO dto);	
}