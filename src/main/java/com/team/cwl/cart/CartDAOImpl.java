package com.team.cwl.cart;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public abstract class CartDAOImpl implements CartDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<CartDTO> cartA() {
		return null;
	}
	
	// 장바구니에 담기
	@Override
	public void insert(CartDTO cartDTO) {
		sqlSession.insert("cart.insert", cartDTO);
	}
	
	@Override
	public List<CartDTO> cartList(String memberId) {
		return sqlSession.selectList("cart.cartList", memberId);
	}
	
	@Override
	public void delete(Long cartNum) {
		sqlSession.delete("cart.delete", cartNum);
	}
	
	@Override
	public void deleteAll(String memberId) {
		sqlSession.delete("cart.deleteAll", memberId);
		
	}
	
	@Override
	public void update(Long cartNum) {
		
	}
	
	@Override
	public int sumMoney(String memberId) {
		return sqlSession.selectOne("cart.sumMoney", memberId);
	}
	
	@Override
	public int carCount(String memberId, Long productNum) {
		return 0;
	}
	
	@Override
	public void updateCart(CartDTO cartDTO) {
		
	}
	
	@Override
	public void modifyCart(CartDTO cartDTO) {
		sqlSession.update("cart.modify", cartDTO);
	}
}
