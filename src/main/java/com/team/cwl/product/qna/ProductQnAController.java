package com.team.cwl.product.qna;

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
@RequestMapping("/product/qna/*")
public class ProductQnAController {

	@Autowired
	private ProductQnAService productQnAService;
	
//--------------------------------------------
	
	/** SELECT **/
	@GetMapping("list")
	public ModelAndView getProductQnAList(Pagination pagination, ModelAndView modelAndView) throws Exception {
		List<ProductQnADTO> ar = productQnAService.getProductQnAList(pagination);
		
		modelAndView.addObject("list", ar);
		modelAndView.setViewName("product/qna");
		
		return modelAndView;
	}
	
	/** INSERT **/
	@PostMapping("add")
	public ModelAndView setProductQnAAdd(ProductQnADTO productQnADTO, HttpSession session, ModelAndView modelAndView) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		productQnADTO.setMemberId(memberDTO.getMemberId());
		
		int result = productQnAService.setProductQnAAdd(productQnADTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
	/** UPDATE **/
	@PostMapping("update")
	public ModelAndView setProductQnAUpdate(ProductQnADTO productQnADTO, ModelAndView modelAndView) throws Exception {
		int result = productQnAService.setProductQnAUpdate(productQnADTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
	/** DELETE **/
	@PostMapping("delete")
	public ModelAndView setProductQnADelete(ProductQnADTO productQnADTO, ModelAndView modelAndView) throws Exception {
		int result = productQnAService.setProductQnADelete(productQnADTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
}