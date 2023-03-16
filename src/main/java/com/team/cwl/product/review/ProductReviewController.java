package com.team.cwl.product.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.cwl.util.Pagination;

@Controller
@RequestMapping("/ProductReview/*")
public class ProductReviewController {

	@Autowired
	private ProductReviewService productReviewService;
	
//--------------------------------------------
	
	/** SELECT **/
	@GetMapping("list")
	public ModelAndView getProductReviewList(Pagination pagination, ModelAndView modelAndView) throws Exception {
		List<ProductReviewDTO> ar = productReviewService.getProductReviewList(pagination);
		
		modelAndView.addObject("list", ar);
		modelAndView.setViewName("product/qnaList");
		
		return modelAndView;
	}
	
	/** INSERT **/
	@PostMapping("add")
	public ModelAndView setProductReviewAdd(ProductReviewDTO productReviewDTO, ModelAndView modelAndView) throws Exception {
		//MemberDTO 필요
		productReviewDTO.setMemberId("mhj");
		
		int result = productReviewService.setProductReviewAdd(productReviewDTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
	/** UPDATE **/
	public ModelAndView setProductReviewUpdate(ProductReviewDTO productReviewDTO, ModelAndView modelAndView) throws Exception {
		int result = productReviewService.setProductReviewUpdate(productReviewDTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
	/** DELETE **/
	public ModelAndView setProductDelete(ProductReviewDTO productReviewDTO, ModelAndView modelAndView) throws Exception {
		int result = productReviewService.setProductReviewDelete(productReviewDTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
}
