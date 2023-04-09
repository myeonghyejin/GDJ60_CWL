package com.team.cwl.product;

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
public class ProductController {
	
	@Autowired
	private ProductService productService;

//----------------------------------------------
	
	/** SELECT **/
	@GetMapping("list")
	public ModelAndView getLessonList(Pagination pagination, ModelAndView modelAndView) throws Exception {
		List<ProductDTO> ar = productService.getProductList(pagination);
		
		modelAndView.addObject("list", ar);
		modelAndView.setViewName("product/list");
		
		return modelAndView;
	}
	
	@GetMapping("detail")
	public ModelAndView getLessonDetail(ProductDTO productDTO, ModelAndView modelAndView) throws Exception {
		productDTO = productService.getProductDetail(productDTO);
		
		modelAndView.addObject("DTO", productDTO);
		modelAndView.setViewName("product/detail");
		
		return modelAndView;
	}
	
	/** INSERT **/
	//입력 폼으로 이동
	@GetMapping("add")
	public ModelAndView setProductAdd(ModelAndView modelAndView) throws Exception {
		modelAndView.setViewName("product/add");
		
		return modelAndView;
	}
	
	//DB에 Insert
	@PostMapping("add")
	public ModelAndView setProductAdd(ProductDTO productDTO, MultipartFile [] imgs, HttpSession session, ModelAndView modelAndView) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		productDTO.setMemberId(memberDTO.getMemberId());
		
		int result = productService.setProductAdd(productDTO, imgs, session);
		
		String message = "등록에 실패했습니다.";
		
		if(result != 0) {
			message = "등록에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "./list");
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}
	
	/** UPDATE **/
	//입력 폼으로 이동
	@GetMapping("update")
	public ModelAndView setProductUpdate(ProductDTO productDTO, ModelAndView modelAndView) throws Exception {
		productDTO = productService.getProductDetail(productDTO);
		
		modelAndView.addObject("DTO", productDTO);
		modelAndView.setViewName("product/update");
		
		return modelAndView;
	}
	
	//DB에 Insert
	@PostMapping("update")
	public ModelAndView setProductUpdate(ProductDTO productDTO, MultipartFile [] imgs, HttpSession session, Long [] imgNums, ModelAndView modelAndView) throws Exception {
		int result = productService.setProductUpdate(productDTO, imgs, session, imgNums);
		
		String message = "수정에 실패했습니다.";
		
		if(result != 0) {
			message = "수정에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "./detail?productNum="+productDTO.getProductNum());
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}
	
	/** DELETE **/
	@PostMapping("delete")
	public ModelAndView setProductDelete(ProductDTO productDTO, HttpSession session, ModelAndView modelAndView) throws Exception {
		modelAndView.setViewName("common/result");
		
		int result = productService.setProductDelete(productDTO, session);
		
		String message = "삭제에 실패했습니다.";
		
		if(result != 0) {
			message = "삭제되었습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "./list");
		
		return modelAndView;
	}

	@PostMapping("imgDelete")
	public ModelAndView setProductImgDelete(Long imgNum, ModelAndView modelAndView) throws Exception {
		int result = productService.setProductImgDelete(imgNum);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
}
