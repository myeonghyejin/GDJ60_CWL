package com.team.cwl.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.cwl.member.MemberDTO;
import com.team.cwl.member.MemberService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	
	
	@GetMapping("/order/{memberId}")
	public String orderPageGET(@PathVariable("memberId") String memberId, OrderPageDTO orderPageDTO, Model model) {
		
		model.addAttribute("orderList", orderService.getGoodsInfo(orderPageDTO.getOrders()));
		model.addAttribute("memberPage", memberService.getMemberPage(memberId));
		
		return "/order";
	}
	
	@PostMapping("/order/")
	public String orderPagePost(OrderDTO orderDTO, HttpServletRequest request) {
		System.out.println(orderDTO);
		
		orderService.order(orderDTO);
		
		MemberDTO member = new MemberDTO();
		member.setMemberId(orderDTO.getMemberId());
		
		HttpSession session = request.getSession();
		
		try {
			MemberDTO memberLogin = memberService.getMemberLogin(member);
			memberLogin.setMemberPw("");
			session.setAttribute("member", memberLogin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
		
	}
	
}
