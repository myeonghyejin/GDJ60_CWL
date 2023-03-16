package com.team.cwl.cart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public abstract class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public List<CartDTO> cartA() {
		return null;
	}
	
	@Override
	public void insert(CartDTO cartDTO) {
		cartDAO.insert(cartDTO);
	}
	
	@Override
	public List<CartDTO> cartList(String memberId) {
		return cartDAO.cartList(memberId);
	}
	
	@Override
	public void delete(Long cartNum) {
		cartDAO.delete(cartNum);
	}
	
	@Override
	public void deleteAll(String memberId) {
		cartDAO.deleteAll(memberId);
	}
	
	@Override
	public void update(Long cartNum) {
		
	}
	
	@Override
	public int sumMoney(String memberId) {
		return cartDAO.sumMoney(memberId);
	}
	
	@Override
	public int cartCount(String memberId, Long productNum) {
		return 0;
	}
	
	@Override
	public void updateCart(CartDTO cartDTO) {
		
	}
	
	@Override
	public void modifyCart(CartDTO cartDTO) {
		cartDAO.modifyCart(cartDTO);
	}
}
