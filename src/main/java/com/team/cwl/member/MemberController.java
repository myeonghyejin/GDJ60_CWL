package com.team.cwl.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Bean
	BCryptPasswordEncoder pwEncoder() {
		return new BCryptPasswordEncoder();
	};
	
	// 약관동의
	@RequestMapping(value = "memberAgree", method = RequestMethod.GET)
	public void setMemberAgree() throws Exception {
		
	}
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "memberAdd", method = RequestMethod.GET)
	public void loginGET() {
		logger.info("회원가입 페이지 진입");
	}
	
	// 회원가입
	@RequestMapping(value="memberAdd", method=RequestMethod.POST)
	public String addPOST(MemberDTO member) throws Exception {
		
		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호
		
		rawPw = member.getMemberPw(); // 비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		member.setMemberPw(encodePw); // 인코딩된 비밀번호 member 객체에 다시 저장
		
		/* 회원가입 쿼리 실행 */
		memberService.memberAdd(member);
		
		return "redirect:/";		
	}
	
	// 로그인 페이지 이동
	@RequestMapping(value = "memberLogin", method = RequestMethod.GET)
	public void addGET() {
		logger.info("로그인 페이지 진입");
	}

	// 아이디 중복 체크
	@RequestMapping(value = "memberIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdCheckPOST(String memberId) throws Exception {
		
		logger.info("memberIdCheck() 진입");
		
		int result = memberService.idCheck(memberId);
		
		logger.info("결과값 = " + result);
		
		if(result != 0) {
			return "fail"; // 중복 아이디 존재
		} else {
			return "success"; // 중복 아이디 없음
		}
	} // memberIdCheckPOST() 종료
	
	// 닉네임 중복 체크
		@RequestMapping(value = "memberNickNameCheck", method = RequestMethod.POST)
		@ResponseBody
		public String memberNickNameCheckPOST(String memberNickName) throws Exception {
			
			logger.info("memberNickNameCheck() 진입");
			
			int result = memberService.nickNameCheck(memberNickName);
			
			logger.info("결과값 = " + result);
			
			if(result != 0) {
				return "fail"; // 중복 아이디 존재
			} else {
				return "success"; // 중복 아이디 없음
			}
		} // memberNickNameCheckPOST() 종료
	
	/* 로그인 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberDTO member, RedirectAttributes rttr) throws Exception {
		
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		
		MemberDTO membercheck = memberService.memberLogin(member); // 제출한 아이디와 일치한 아이디가 있는지 확인
		
		if(membercheck != null) { // 일치하는 아이디 존재시
			rawPw = member.getMemberPw(); // 사용자가 제출한 비밀번호
			encodePw = membercheck.getMemberPw(); // DB에 저장한 인코딩된 비밀번호
			
			if(true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치여부 판단
				
				membercheck.setMemberPw(""); // 인코딩된 비밀번호 정보 지움
				session.setAttribute("member", membercheck); // session에 사용자의 정보 저장
				return "redirect:/"; // 메인페이지로 이동
			} else {
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/memberLogin"; // 로그인 페이지로 이동
			}
		} else {									// 일치하는 아이디가 존재하지 않을 시(로그인 실패)
			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/memberLogin"; // 로그인 페이지로 이동
		} 
		
	}
	
	/* 메인페이지 로그아웃 */
	@RequestMapping(value = "memberLogout", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception {
		
		logger.info("logoutMainGET메서드 진입");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	/* 비동기방식 로그아웃 메서드 */
	@RequestMapping(value = "memberLogout", method = RequestMethod.POST)
	@ResponseBody
	public void logoutPOST(HttpServletRequest request) throws Exception {
		
		logger.info("비동기 로그아웃 메서드 진입");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
	}
	
	@RequestMapping(value = "memberPage", method = RequestMethod.GET)
	public ModelAndView getMemberPage(HttpSession session) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		memberDTO = memberService.getMemberPage(memberDTO);
		modelAndView.addObject("dto", memberDTO);
		modelAndView.setViewName("/member/memberPage");
		return modelAndView;
	}
	
}
