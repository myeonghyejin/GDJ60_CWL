package com.team.cwl.cart;

import java.util.List;


public interface CartService {
	List<CartDTO> cartA();
	void insert (CartDTO cartDTO);
	List<CartDTO> cartList(String memberId);
	void delete (Long cartNum);
	void deleteAll(String memberId);
	void update (Long cartNum);
	int sumMoney(String memberId);
	int cartCount(String memberId, Long productNum);
	void updateCart(CartDTO cartDTO);
	void modifyCart(CartDTO cartDTO);	
}
