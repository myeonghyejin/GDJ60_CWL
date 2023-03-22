package com.team.cwl.lesson.review;

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
@RequestMapping("/lesson/review/*")
public class LessonReviewController {
	
	@Autowired
	private LessonReviewService lessonReviewService;
	
//--------------------------------------------
	
	/** SELECT **/
	@GetMapping("list")
	public ModelAndView getLessonReviewList(Pagination pagination, ModelAndView modelAndView) throws Exception {
		List<LessonReviewDTO> ar = lessonReviewService.getLessonReviewList(pagination);
		
		modelAndView.addObject("list", ar);
		modelAndView.setViewName("lesson/review");
		
		return modelAndView;
	}
	
	/** INSERT **/
	@PostMapping("add")
	public ModelAndView setLessonReviewAdd(LessonReviewDTO lessonReviewDTO, HttpSession session, ModelAndView modelAndView) throws Exception {		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		lessonReviewDTO.setMemberId(memberDTO.getMemberId());
		
		int result = lessonReviewService.setLessonReviewAdd(lessonReviewDTO, null);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
	/** UPDATE **/
	@PostMapping("update")
	public ModelAndView setLessonReviewUpdate(LessonReviewDTO lessonReviewDTO, ModelAndView modelAndView) throws Exception {
		int result = lessonReviewService.setLessonReviewUpdate(lessonReviewDTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
	
	/** DELETE **/
	@PostMapping("delete")
	public ModelAndView setLessonDelete(LessonReviewDTO lessonReviewDTO, ModelAndView modelAndView) throws Exception {
		int result = lessonReviewService.setLessonReviewDelete(lessonReviewDTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}

}
