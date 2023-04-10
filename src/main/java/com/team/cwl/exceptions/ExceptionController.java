package com.team.cwl.exceptions;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

//@ControllerAdvice
public class ExceptionController {
	// 예외를 전문 처리하는 Controller
	// 프로젝트 내에서 발생하는 Exception은 전부 여기서 처리
	
	@ExceptionHandler(NullPointerException.class)
	public ModelAndView fixException() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("message", "잘못된 접근입니다.<br>관리자에게 문의 바랍니다.");
		modelAndView.setViewName("common/error_500");
		
		return modelAndView;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView fix2Exception() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("message", "잘못된 접근입니다.<br>관리자에게 문의 바랍니다.");
		modelAndView.setViewName("common/error_500");
		
		return modelAndView;
	}
	
}
