package com.team.cwl.product.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.cwl.member.MemberDTO;
import com.team.cwl.product.review.ProductReviewDTO;
import com.team.cwl.util.Pagination;

@Controller
@RequestMapping("/product/*")
public class ProductQnAController {

	@Autowired
	private ProductQnAService productQnAService;
	
//--------------------------------------------
	
	/** SELECT **/
	@GetMapping("qna/list")
	public ModelAndView getProductQnAList(Pagination pagination, ModelAndView modelAndView) throws Exception {
		List<ProductQnADTO> ar = productQnAService.getProductQnAList(pagination);
		
		modelAndView.addObject("list", ar);
		modelAndView.setViewName("product/qna/qna");
		
		return modelAndView;
	}
	
	/** INSERT **/
	@GetMapping("qna/add")
	public ModelAndView setProductQnAAdd(ModelAndView modelAndView) throws Exception {		
		modelAndView.setViewName("product/qna/add");
		
		return modelAndView;
	}
	
	@PostMapping("qna/add")
	public ModelAndView setProductQnAAdd(ProductQnADTO productQnADTO, HttpSession session, ModelAndView modelAndView) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		productQnADTO.setMemberId(memberDTO.getMemberId());
		
		int result = productQnAService.setProductQnAAdd(productQnADTO);
		
		String message = "등록에 실패했습니다.";
		
		if(result > 0) {
			message = "등록에 성공했습니다.";
		}

		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "../detail?productNum="+productQnADTO.getProductNum());
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}
	
	@GetMapping("qna/reply")
	public ModelAndView setProductQnAReplyAdd(ModelAndView modelAndView) throws Exception {		
		modelAndView.setViewName("product/qna/reply");
		
		return modelAndView;
	}
	
	@PostMapping("qna/reply")
	public ModelAndView setReplyAdd(ProductQnADTO productQnADTO, HttpSession session, ModelAndView modelAndView) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		productQnADTO.setMemberId(memberDTO.getMemberId());
		
		int result = productQnAService.setProductQnAReplyAdd(productQnADTO);
		
		String message = "등록에 실패했습니다.";
		
		if(result > 0) {
			message = "등록에 성공했습니다.";
		}

		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "../detail?productNum="+productQnADTO.getProductNum());
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}
	
	/** UPDATE **/
	@GetMapping("qna/update")
	public ModelAndView setProductQnAUpdate(ProductQnADTO productQnADTO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		productQnADTO = productQnAService.getProductQnADetail(productQnADTO);
		
		modelAndView.addObject("DTO", productQnADTO);
		modelAndView.setViewName("product/qna/update");
		
		return modelAndView;
	}
	
	@PostMapping("qna/update")
	public ModelAndView setProductQnAUpdate(ProductQnADTO productQnADTO, ModelAndView modelAndView) throws Exception {
		int result = productQnAService.setProductQnAUpdate(productQnADTO);
		
		String message = "수정에 실패했습니다.";
		
		if(result > 0) {
			message = "수정에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "../detail?productNum="+productQnADTO.getProductNum());
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}
	
	/** DELETE **/
	@PostMapping("qna/delete")
	public ModelAndView setProductQnADelete(ProductQnADTO productQnADTO, ModelAndView modelAndView) throws Exception {
		int result = productQnAService.setProductQnADelete(productQnADTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
}