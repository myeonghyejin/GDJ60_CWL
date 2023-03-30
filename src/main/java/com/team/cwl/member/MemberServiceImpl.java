package com.team.cwl.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper memberMapper;
	
	/* 회원가입 */
	@Override
	public void memberAdd(MemberDTO member) throws Exception {
		memberMapper.memberAdd(member);
	}
	
	/* 아이디 중복 체크 */
	@Override
	public int idCheck(String memberId) throws Exception {
		return memberMapper.idCheck(memberId);
	}
	
	/* 로그인 */
	@Override
	public MemberDTO memberLogin(MemberDTO member) throws Exception {
		return memberMapper.memberLogin(member);
	}
	
	/* 주문자 정보 */
	@Override
	public MemberDTO getMemberInfo(String memberId) {
		return memberMapper.getMemberInfo(memberId);
	}
	
	public MemberDTO getMemberPage(MemberDTO memberDTO) throws Exception {
		return memberMapper.memberLogin(memberDTO);
	}
}
