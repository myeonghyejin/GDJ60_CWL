package com.team.cwl.cart2;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public interface CartService2 {
	/* 장바구니 추가 */
	public int cartAdd(CartDTO2 cart);	
	
	/* 장바구니 정보 리스트 */
	public List<CartDTO2> cartList(String memberId);	
	
	/* 카트 수량 수정 */
	public int modifyCount(CartDTO2 cart);		
	
	/* 카트 삭제 */
	public int cartDelete(Long cartId);
}