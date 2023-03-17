package com.team.cwl.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		modelAndView.setViewName("lesson/list");
		
		return modelAndView;
	}
	
	@GetMapping("detail")
	public ModelAndView getLessonDetail(ProductDTO productDTO, ModelAndView modelAndView) throws Exception {
		productDTO = productService.getProductDetail(productDTO);
		
		modelAndView.addObject("DTO", productDTO);
		modelAndView.setViewName("lesson/detail");
		
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
	public ModelAndView setProductAdd(ProductDTO productDTO, ModelAndView modelAndView) throws Exception {
		int result = productService.setProductAdd(productDTO);
		
		String message = "등록에 실패했습니다.";
		
		if(result > 1) {
			message = "등록에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "./list");
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}
	
	/** UPDATE **/
	//입력 폼으로 이동
	//Overloading 하기 위해 매개 변수에 ModelAndView 빠짐
	@GetMapping("update")
	public ModelAndView setProductUpdate(ProductDTO productDTO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		productDTO = productService.getProductDetail(productDTO);
		
		modelAndView.addObject("DTO", productDTO);
		modelAndView.setViewName("lesson/update");
		
		return modelAndView;
	}
	
	//DB에 Insert
	@PostMapping("update")
	public ModelAndView setProductUpdate(ProductDTO productDTO, ModelAndView modelAndView) throws Exception {
		int result = productService.setProductUpdate(productDTO);
		
		String message = "수정에 실패했습니다.";
		
		if(result > 1) {
			message = "수정에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "./detail?productNum="+productDTO.getProductNum());
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}
	
	/** DELETE **/
	@PostMapping("delete")
	public ModelAndView setLessonDelete(ProductDTO productDTO, ModelAndView modelAndView) throws Exception {
		int result = productService.setProductDelete(productDTO);
		
		String message = "삭제에 실패했습니다.";
		
		if(result > 1) {
			message = "삭제에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "./list");
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}

}
