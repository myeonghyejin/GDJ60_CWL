package com.team.cwl.member;

public interface MemberService {
	
	/* 회원가입 */
	public void memberAdd(MemberDTO member) throws Exception;
	
	/*아이디 중복 검사*/
	public int idCheck(String memberId) throws Exception;
	
	/* 로그인 */
	public MemberDTO memberLogin(MemberDTO member) throws Exception;
	
	/* 주문자 정보 */
	public MemberDTO getMemberInfo(String memberId);
	
	public MemberDTO getMemberPage(MemberDTO memberDTO) throws Exception;
}
