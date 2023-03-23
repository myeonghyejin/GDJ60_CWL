package com.team.cwl.product.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.cwl.member.MemberDTO;
import com.team.cwl.util.Pagination;

@Controller
@RequestMapping("/product/review/*")
public class ProductReviewController {

	@Autowired
	private ProductReviewService productReviewService;
	
//--------------------------------------------
	
	/** SELECT **/
	@GetMapping("list")
	public ModelAndView getProductReviewList(Pagination pagination, ModelAndView modelAndView) throws Exception {
		List<ProductReviewDTO> ar = productReviewService.getProductReviewList(pagination);
		
		modelAndView.addObject("list", ar);
		modelAndView.setViewName("product/review");
		
		return modelAndView;
	}
	
	/** INSERT **/
	@PostMapping("add")
	public ModelAndView setProductReviewAdd(ProductReviewDTO productReviewDTO, HttpSession session, ModelAndView modelAndView) throws Exception {		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		productReviewDTO.setMemberId(memberDTO.getMemberId());
		
		int result = productReviewService.setProductReviewAdd(productReviewDTO, null);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
	/** UPDATE **/
	@PostMapping("update")
	public ModelAndView setProductReviewUpdate(ProductReviewDTO productReviewDTO, ModelAndView modelAndView) throws Exception {
		int result = productReviewService.setProductReviewUpdate(productReviewDTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
	/** DELETE **/
	@PostMapping("delete")
	public ModelAndView setProductDelete(ProductReviewDTO productReviewDTO, ModelAndView modelAndView) throws Exception {
		int result = productReviewService.setProductReviewDelete(productReviewDTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
}
