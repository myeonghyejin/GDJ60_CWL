package com.team.cwl.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.team.cwl.member.MemberDTO;

@Component
public abstract class CartInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		if(memberDTO == null) {
			response.sendRedirect("/main");
			return false;
		} else {
			return true;
		}		
		
	}
	
}
