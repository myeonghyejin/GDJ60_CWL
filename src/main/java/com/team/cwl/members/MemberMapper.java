package com.team.cwl.members;

public interface MemberMapper {
	
	/* 회원가입 */
	public void memberAdd(MemberDTOS member);

	/* 아이디 중복 검사 */
	public int idCheck(String memberId);
	
	/* 로그인 */
	public MemberDTOS memberLogin(MemberDTOS member);
	
	/* 주문자 주소 정보 */
	public MemberDTOS getMemberInfo(String memberId);	
	
}
