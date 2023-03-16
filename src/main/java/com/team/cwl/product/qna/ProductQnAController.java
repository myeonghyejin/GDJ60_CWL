package com.team.cwl.product.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.cwl.util.Pagination;

@Controller
@RequestMapping("/ProductQnA/*")
public class ProductQnAController {

	@Autowired
	private ProductQnAService productQnAService;
	
//--------------------------------------------
	
	/** SELECT **/
	@GetMapping("list")
	public ModelAndView getProductQnAList(Pagination pagination, ModelAndView modelAndView) throws Exception {
		List<ProductQnADTO> ar = productQnAService.getProductQnAList(pagination);
		
		modelAndView.addObject("list", ar);
		modelAndView.setViewName("product/qnaList");
		
		return modelAndView;
	}
	
	/** INSERT **/
	@PostMapping("add")
	public ModelAndView setProductQnAAdd(ProductQnADTO productQnADTO, ModelAndView modelAndView) throws Exception {
		//MemberDTO 필요
		productQnADTO.setMemberId("mhj");
		
		int result = productQnAService.setProductQnAAdd(productQnADTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
	/** UPDATE **/
	public ModelAndView setProductUpdate(ProductQnADTO productQnADTO, ModelAndView modelAndView) throws Exception {
		int result = productQnAService.setProductQnAUpdate(productQnADTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
	/** DELETE **/
	public ModelAndView setProductDelete(ProductQnADTO productQnADTO, ModelAndView modelAndView) throws Exception {
		int result = productQnAService.setProductQnADelete(productQnADTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
}