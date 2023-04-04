package com.team.cwl.product.review;

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
import com.team.cwl.util.Pagination;

@Controller
@RequestMapping("/product/*")
public class ProductReviewController {

	@Autowired
	private ProductReviewService productReviewService;
	
//--------------------------------------------
	
	/** SELECT **/
	@GetMapping("review/list")
	public ModelAndView getProductReviewList(Pagination pagination, ModelAndView modelAndView) throws Exception {
		List<ProductReviewDTO> ar = productReviewService.getProductReviewList(pagination);
		
//		for(ProductReviewDTO productReviewDTO: ar) {
//			System.out.println(productReviewDTO.getProductReviewImgDTOs().size());
//		}
		
		modelAndView.addObject("list", ar);
		modelAndView.setViewName("product/review/review");
		
		return modelAndView;
	}
	
	/** INSERT **/
	@GetMapping("review/add")
	public ModelAndView setProductReviewAdd(ModelAndView modelAndView) throws Exception {		
		modelAndView.setViewName("product/review/add");
		
		return modelAndView;
	}
	
	@PostMapping("review/add")
	public ModelAndView setProductReviewAdd(ProductReviewDTO productReviewDTO, MultipartFile [] imgs, HttpSession session, ModelAndView modelAndView) throws Exception {		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		productReviewDTO.setMemberId(memberDTO.getMemberId());
		
		int result = productReviewService.setProductReviewAdd(productReviewDTO, imgs, session);
		
		String message = "등록에 실패했습니다.";
		
		if(result > 0) {
			message = "등록에 성공했습니다.";
		}

		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "../detail?productNum="+productReviewDTO.getProductNum());
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}
	
	/** UPDATE **/
	@GetMapping("review/update")
	public ModelAndView setProductReviewUpdate(ProductReviewDTO productReviewDTO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		productReviewDTO = productReviewService.getProductReviewDetail(productReviewDTO);
		
		modelAndView.addObject("DTO", productReviewDTO);
		modelAndView.setViewName("product/review/update");
		
		return modelAndView;
	}
	
	@PostMapping("review/update")
	public ModelAndView setProductReviewUpdate(ProductReviewDTO productReviewDTO, MultipartFile [] imgs, HttpSession session, Long [] imgNums, ModelAndView modelAndView) throws Exception {
		int result = productReviewService.setProductReviewUpdate(productReviewDTO, imgs, session, imgNums);
		
		String message = "수정에 실패했습니다.";
		
		if(result > 0) {
			message = "수정에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "../detail?productNum="+productReviewDTO.getProductNum());
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}
	
	/** DELETE **/
	@PostMapping("review/delete")
	public ModelAndView setProductReviewDelete(ProductReviewDTO productReviewDTO, HttpSession session, ModelAndView modelAndView) throws Exception {
		modelAndView.setViewName("common/result");
		
		int result = productReviewService.setProductReviewDelete(productReviewDTO, session);
		
		String message = "삭제에 실패했습니다.";
		
		if(result > 0) {
			message = "삭제에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "./list");
		
		return modelAndView;
	}
	
	@PostMapping("review/imgDelete")
	public ModelAndView setProductReviewImgDelete(Long imgNum, ModelAndView modelAndView) throws Exception {
		int result = productReviewService.setProductReviewImgDelete(imgNum);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
}
