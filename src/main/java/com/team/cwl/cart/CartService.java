package com.team.cwl.cart;

import java.util.List;


public interface CartService {
	/* 장바구니 추가 */
	public int cartAdd(CartDTO cart);	
	
	/* 장바구니 정보 리스트 */
	public List<CartDTO> cartList(String memberId);	
	
	/* 카트 수량 수정 */
	public int modifyCount(CartDTO cart);		
	
	/* 카트 삭제 */
	public int cartDelete(Long cartNum);
}