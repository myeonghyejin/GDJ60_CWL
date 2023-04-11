package com.team.cwl.member;

public interface MemberService {
	
	/* 회원가입 */
	public void memberAdd(MemberDTO member) throws Exception;
	
	/*아이디 중복 검사*/
	public int idCheck(String memberId) throws Exception;
	
	/* 닉네임 중복 검사 */
	public int nickNameCheck(String memberNickName) throws Exception;
	
	/* 로그인 */
	public MemberDTO memberLogin(MemberDTO member) throws Exception;
	
	/* 주문자 정보 */
	public MemberDTO getMemberInfo(String memberId);
	
	/* 마이 페이지 */
	public MemberDTO getMemberPage(MemberDTO memberDTO) throws Exception;
	
	/* 회원 수정 */
	public int memberUpdate(MemberDTO memberDTO) throws Exception;
	
	/* 비밀번호 변경 */
	public void modifyPw(MemberDTO member) throws Exception;
}
