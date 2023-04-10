package com.team.cwl.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.team.cwl.member.MemberDTO;

public class AdminInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		if(memberDTO == null || memberDTO.getAdminCheck() == 0) { // 관리자 계정이 아닌 경우
			
			response.sendRedirect("/"); // 홈으로 리다이렉트
			
			return false;
		}
		
		
		return true;   //  관리자 계정 로그인 경우 (memberDTOs != null && memberDTOs.getAdmincheck() == 1)
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
}
