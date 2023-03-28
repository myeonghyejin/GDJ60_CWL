package com.team.cwl.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public int cartAdd(CartDTO cart) {

		// 장바구니 데이터 체크
		CartDTO checkCart = cartMapper.checkCart(cart);
		
		if(checkCart != null) {
			return 2;
		}
		
		// 장바구니 등록 & 에러 시 0반환
		try {
			return cartMapper.cartAdd(cart);
		} catch (Exception e) {
			return 0;
		}		
		
	}

	@Override
	public List<CartDTO> cartList(String memberId) {
		
		List<CartDTO> cart = cartMapper.cartList(memberId);
		
		for(CartDTO dto : cart) {
			
			/* 종합 정보 초기화 */
			dto.initTotal();
			
		}
		
		return cart;
		
	}
	
	@Override
	public int modifyCount(CartDTO cart) {	
		return cartMapper.modifyCount(cart);
	}	
	
	@Override
	public int cartDelete(Long cartId) {
		return cartMapper.cartDelete(cartId);
	}	
	
}
