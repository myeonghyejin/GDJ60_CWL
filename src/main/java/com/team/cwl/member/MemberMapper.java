package com.team.cwl.member;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan(basePackages = "MemberMapper")
public interface MemberMapper {
	
	/* 회원가입 */
	public void memberAdd(MemberDTO member);

	/* 아이디 중복 검사 */
	public int idCheck(String memberId);
	
	/* 닉네임 중복 검사 */
	public int nickNameCheck(String memberNickName);
	
	/* 로그인 */
	public MemberDTO memberLogin(MemberDTO member);
	
	/* 주문자 주소 정보 */
	public MemberDTO getMemberInfo(String memberId);
	
	/* 마이페이지 */
	public MemberDTO getMemberPage(MemberDTO memberDTO);
	
	/* 회원 수정 */
	public int memberUpdate(MemberDTO memberDTO);
	
}
