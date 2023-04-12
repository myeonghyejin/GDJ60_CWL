package com.team.cwl.recipe;

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
@RequestMapping("/recipe/*")
public class RecipeController {
	
	@Autowired
	private RecipeService recipeService;

//----------------------------------------------
	
	/** SELECT **/
	@GetMapping("list")
	public ModelAndView getRecipeList(Pagination pagination, ModelAndView modelAndView) throws Exception {
		List<RecipeDTO> ar = recipeService.getRecipeList(pagination);
		
		modelAndView.addObject("list", ar);
		modelAndView.setViewName("recipe/list");
		
		return modelAndView;
	}
	
	@GetMapping("detail")
	public ModelAndView getRecipeDetail(RecipeDTO recipeDTO, ModelAndView modelAndView) throws Exception {
		recipeDTO = recipeService.getRecipeDetail(recipeDTO);
		
		modelAndView.addObject("DTO", recipeDTO);
		modelAndView.setViewName("recipe/detail");
		
		return modelAndView;	
	}
	
	/** INSERT **/
	//입력 폼으로 이동
	@GetMapping("add")
	public ModelAndView setRecipeAdd(ModelAndView modelAndView) throws Exception {
		modelAndView.setViewName("recipe/add");
		
		return modelAndView;
	}
	
	//DB에 Insert
	@PostMapping("add")
	public ModelAndView setRecipeAdd(RecipeDTO recipeDTO, MultipartFile img, HttpSession session, ModelAndView modelAndView) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		recipeDTO.setMemberId(memberDTO.getMemberId());
		
		int result = recipeService.setRecipeAdd(recipeDTO, img, session);
		
		String message = "등록에 실패했습니다.";
		
		if(result > 0) {
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
	public ModelAndView setRecipeUpdate(RecipeDTO recipeDTO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		recipeDTO = recipeService.getRecipeDetail(recipeDTO);
		
		modelAndView.addObject("DTO", recipeDTO);
		modelAndView.setViewName("recipe/update");
		
		return modelAndView;
	}
	
	//DB에 Insert
	@PostMapping("update")
	public ModelAndView setRecipeUpdate(RecipeDTO recipeDTO, MultipartFile img, HttpSession session, Long imgNum, ModelAndView modelAndView) throws Exception {
		int result = recipeService.setRecipeUpdate(recipeDTO, img, session, imgNum);
		
		String message = "수정에 실패했습니다.";
		
		if(result > 0) {
			message = "수정에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "./detail?recipeNum="+recipeDTO.getRecipeNum());
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}
	
	/** DELETE **/
	@PostMapping("delete")
	public ModelAndView setRecipeDelete(RecipeDTO recipeDTO, HttpSession session, ModelAndView modelAndView) throws Exception {
		modelAndView.setViewName("common/result");
		
		int result = recipeService.setRecipeDelete(recipeDTO, session);
		
		String message = "삭제에 실패했습니다.";
		
		if(result > 0) {
			message = "삭제에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "./list");
		
		return modelAndView;
	}
}