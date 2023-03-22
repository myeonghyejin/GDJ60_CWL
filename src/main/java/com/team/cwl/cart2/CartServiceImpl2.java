package com.team.cwl.cart2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cwl.cart2.CartMapper2;

@Service
public class CartServiceImpl2 implements CartService2 {
	
	@Autowired
	private CartMapper2 cartMapper2;
	
	@Override
	public int addCart(CartDTO2 cart) {

		// 장바구니 데이터 체크
		CartDTO2 checkCart = cartMapper2.checkCart(cart);
		
		if(checkCart != null) {
			return 2;
		}
		
		// 장바구니 등록 & 에러 시 0반환
		try {
			return cartMapper2.addCart(cart);
		} catch (Exception e) {
			return 0;
		}		
		
	}

	@Override
	public List<CartDTO2> getCartList(String memberId) {
		
		List<CartDTO2> cart = cartMapper2.getCartList(memberId);
		
		for(CartDTO2 dto : cart) {
			
			/* 종합 정보 초기화 */
			dto.initTotal();
			
		}
		
		return cart;
		
	}
	
	@Override
	public int modifyCount(CartDTO2 cart) {
		
		return cartMapper2.modifyCount(cart);
	}	
	
	@Override
	public int deleteCart(Long cartId) {

		return cartMapper2.deleteCart(cartId);
	}	
	
}
