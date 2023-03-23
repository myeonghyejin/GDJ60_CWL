package com.team.cwl.lesson;

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
@RequestMapping("/lesson/*")
public class LessonController {
	
	@Autowired
	private LessonService lessonService;

//----------------------------------------------
	
	/** SELECT **/
	@GetMapping("list")
	public ModelAndView getLessonList(Pagination pagination, ModelAndView modelAndView) throws Exception {
		List<LessonDTO> ar = lessonService.getLessonList(pagination);
		
		modelAndView.addObject("list", ar);
		modelAndView.setViewName("lesson/list");
		
		return modelAndView;
	}
	
	@GetMapping("detail")
	public ModelAndView getLessonDetail(LessonDTO lessonDTO, ModelAndView modelAndView) throws Exception {
		lessonDTO = lessonService.getLessonDetail(lessonDTO);
		
		lessonService.setLessonHitUpdate(lessonDTO);
		
		modelAndView.addObject("DTO", lessonDTO);
		modelAndView.setViewName("lesson/detail");
		
		return modelAndView;	
	}
	
	/** INSERT **/
	//입력 폼으로 이동
	@GetMapping("add")
	public ModelAndView setLessonAdd(ModelAndView modelAndView) throws Exception {
		modelAndView.setViewName("lesson/add");
		
		return modelAndView;
	}
	
	//DB에 Insert
	@PostMapping("add")
	public ModelAndView setLessonAdd(LessonDTO lessonDTO, MultipartFile [] imgs, HttpSession session, ModelAndView modelAndView) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		lessonDTO.setMemberId(memberDTO.getMemberId());
		
		int result = lessonService.setLessonAdd(lessonDTO, imgs, session);
		
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
	public ModelAndView setLessonUpdate(LessonDTO lessonDTO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		lessonDTO = lessonService.getLessonDetail(lessonDTO);
		
		modelAndView.addObject("DTO", lessonDTO);
		modelAndView.setViewName("lesson/update");
		
		return modelAndView;
	}
	
	//DB에 Insert
	@PostMapping("update")
	public ModelAndView setLessonUpdate(LessonDTO lessonDTO, MultipartFile [] imgs, HttpSession session, Long [] imgNums, ModelAndView modelAndView) throws Exception {
		int result = lessonService.setLessonUpdate(lessonDTO, imgs, session, imgNums);
		
		String message = "수정에 실패했습니다.";
		
		if(result > 0) {
			message = "수정에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "./detail?lessonNum="+lessonDTO.getLessonNum());
		modelAndView.setViewName("common/result");
		
		return modelAndView;
	}
	
	/** DELETE **/
	@PostMapping("delete")
	public ModelAndView setLessonDelete(LessonDTO lessonDTO, HttpSession session, ModelAndView modelAndView) throws Exception {
		modelAndView.setViewName("common/result");
		
		int result = lessonService.setLessonDelete(lessonDTO, session);
		
		String message = "삭제에 실패했습니다.";
		
		if(result > 0) {
			message = "삭제에 성공했습니다.";
		}
		
		modelAndView.addObject("result", message);
		modelAndView.addObject("URL", "./list");
		
		return modelAndView;
	}
	
	@PostMapping("imgDelete")
	public ModelAndView setLessonImgDelete(Long imgNum, ModelAndView modelAndView) throws Exception {
		int result = lessonService.setLessonImgDelete(imgNum);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("common/ajaxResult");
		
		return modelAndView;
	}
}
