package com.team.cwl.member;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan(basePackages = "MemberMapper")
public interface MemberMapper {
	
	/* 회원가입 */
	public void memberAdd(MemberDTO member);

	/* 아이디 중복 검사 */
	public int idCheck(String memberId);
	
	/* 로그인 */
	public MemberDTO memberLogin(MemberDTO member);
	
	/* 주문자 주소 정보 */
	public MemberDTO getMemberInfo(String memberId);
	
	public MemberDTO getMemberPage(MemberDTO memberDTO);
	
}
