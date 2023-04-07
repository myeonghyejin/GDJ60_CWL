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
	
	@Autowired
	private  HttpSession session;
	
	@GetMapping("/order/{memberId}")
	public String orderPageGET(@PathVariable("memberId") String memberId, OrderPageDTO opd, Model model) throws Exception {
		
		
		System.out.println("memberId : " + memberId);
		System.out.println("orders : " + opd.getOrders());
		model.addAttribute("orderList", orderService.getProductDetail(opd.getOrders()));
		model.addAttribute("memberInfo", memberService.getMemberInfo(memberId));
		
		return "/order/order";
	}
	
	@PostMapping("/order")
	public String orderPagePost(OrderDTO od, Long[] productNum, Integer[] productStock, HttpServletRequest request) throws Exception {
		
//	for(Long num : productNum)System.out.println(num);
//	for(Integer num : productStock)System.out.println(num);
		
		System.out.println(od);
		orderService.order(od);
		
		MemberDTO member = (MemberDTO) session.getAttribute("member");  //new MemberDTO();
		member.setMemberId(member.getMemberId());
		
		HttpSession session = request.getSession();
		
		
			MemberDTO memberLogin = memberService.memberLogin(member);
			memberLogin.setMemberPw("");
			session.setAttribute("member", memberLogin);
		
		
		return "redirect:/";
		
	}
	
}
