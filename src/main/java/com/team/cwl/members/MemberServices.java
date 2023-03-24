package com.team.cwl.members;

public interface MemberServices {
	
	/* 회원가입 */
	public void memberAdd(MemberDTOS member) throws Exception;
	
	/*아이디 중복 검사*/
	public int idCheck(String memberId) throws Exception;
	
	/* 로그인 */
	public MemberDTOS memberLogin(MemberDTOS member) throws Exception;
	
	/* 주문자 정보 */
	public MemberDTOS getMemberInfo(String memberId);
}
