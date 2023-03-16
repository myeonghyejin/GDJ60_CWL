package com.team.cwl.cart;

import java.util.List;


public interface CartDAO {
	List<CartDTO> cartA();
	void insert(CartDTO cartDTO); // 장바구니 추가
	List<CartDTO> cartList(String memberId); // 장바구니 목록
	void delete(Long cartNum); // 장바구니 개별 삭제
	void deleteAll(String memberId); // 장바구니 비우기
	void update (Long cartNum);
	int sumMoney(String memberId); // 장바구니 금액 합계
	int carCount(String memberId, Long productNum); // 장바구니 상품 갯수
	void updateCart(CartDTO cartDTO); // 장바구니 수정
	void modifyCart(CartDTO cartDTO);
	
}
