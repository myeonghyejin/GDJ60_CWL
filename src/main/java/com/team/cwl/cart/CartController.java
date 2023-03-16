package com.team.cwl.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired(required=false)
	private CartService cartService;
	
	@RequestMapping(value = "insert")
	public String insert(@ModelAttribute CartDTO cartDTO, HttpSession session) {
		
		String memberId = (String)session.getAttribute("memberId");
		if(memberId == null) {
			return "redirect:/member/memberLogin";
		}
		cartDTO.setMemberId(memberId);
		cartService.insert(cartDTO);
		return "redirect:/cwl/cart/list";
	}
	
	@RequestMapping(value = "list")
	public ModelAndView list(HttpSession session, ModelAndView modelAndView) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String memeberId = (String)session.getAttribute("memberId");
		
		if(memeberId != null) {
			List<CartDTO> list = cartService.cartList(memeberId); // 장바구니 목록
			int sumMoney = cartService.sumMoney(memeberId); // 금액 합계
			int fee = sumMoney >= 30000 ? 0 : 2500; // 3만원 이상이면 배송료 0원, 미만이면 2500원
			
			// HashMap에 장바구니에 넣을 각종 값들을 저장
			map.put("sumMoney", sumMoney);
			map.put("fee", fee); // 배송료
			map.put("sum", sumMoney+fee); // 전체 금액
			map.put("list", list); // 장바구니 목록
			map.put("count", list.size()); // 레코드 갯수
			
			modelAndView.setViewName("/cart/cartList"); // 이동할 페이지의 이름
			modelAndView.addObject("map", map); // 데이터 저장
			
			return modelAndView;
		} else {
			// 로그인을 하지 않았으면 로그인 페이지로 이동
			return new ModelAndView("/member/memberLogin", "", null);
		}
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam Long cartNum) {
		cartService.delete(cartNum);
		return "redirect:/cwl/cart/list";
	}
	
	@RequestMapping(value = "deleteAll")
	public String deleteAll(HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");
		if(memberId != null) {
			cartService.deleteAll(memberId);
		}
		return "redirect:/cwl/cart/list";
	}
	
}
