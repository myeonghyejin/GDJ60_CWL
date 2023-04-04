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
@RequestMapping("/order/**")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("{memberId}")
	public String orderPageGET(@PathVariable("memberId") String memberId, OrderPageDTO opd, Model model) {
				
		model.addAttribute("orderList", orderService.getProductDetail(opd.getOrders()));
		model.addAttribute("memberInfo", memberService.getMemberInfo(memberId));
		
		return "/order/order";
	}
	
	@PostMapping("order")
	public String orderPagePost(OrderDTO od, HttpServletRequest request) {
		
		System.out.println(od);
		
		orderService.order(od);
		
		MemberDTO member = new MemberDTO();
		member.setMemberId(od.getMemberId());
		
		HttpSession session = request.getSession();
		
		try {
			MemberDTO memberLogin = memberService.memberLogin(member);
			memberLogin.setMemberPw("");
			session.setAttribute("member", memberLogin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/home";
		
	}
	
}
