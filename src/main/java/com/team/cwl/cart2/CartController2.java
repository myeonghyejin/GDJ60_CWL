package com.team.cwl.cart2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cwl.member.MemberDTO;


@Controller
public class CartController2 {
	
	@Autowired
	private CartServiceImpl2 cartServiceImpl2;
	
	/* 장바구니 추가 */
	/**
	 * 0: 등록 실패
	 * 1: 등록 성공
	 * 2: 등록된 데이터 존재
	 * 5: 로그인 필요
	 * 
	 */
	@PostMapping("/cart/add2")
	@ResponseBody
	public String addCartPOST(CartDTO2 cart, HttpServletRequest request) {
		// 로그인 체크
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		if(memberDTO == null) {
			return "5";
		}
		
		// 카트 등록
		
		int result = cartServiceImpl2.addCart(cart);
		
		return result + "";
	}	
	
	/* 장바구니 페이지 이동 */	
	@GetMapping("/cart/{memberId}")
	public String getCartList(@PathVariable("memberId") String memberId, Model model) {
		
		model.addAttribute("cartInfo", cartServiceImpl2.getCartList(memberId));
		
		return "/cart";
	}	
	
	/* 장바구니 수량 수정 */
	@PostMapping("/cart/update2")
	public String updateCartPOST(CartDTO2 cart) {
		
		cartServiceImpl2.modifyCount(cart);
		
		return "redirect:/cart/" + cart.getMemberId();
		
	}	
	
	/* 장바구니 수량 수정 */
	@PostMapping("/cart/delete")
	public String deleteCartPOST(CartDTO2 cart) {
		
		cartServiceImpl2.deleteCart(cart.getCartNum());
		
		return "redirect:/cart/" + cart.getMemberId();
		
	}		
}
