package com.team.cwl.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServicesImpl implements MemberServices {
	
	@Autowired
	MemberMapper memberMapper;
	
	/* 회원가입 */
	@Override
	public void memberAdd(MemberDTOS member) throws Exception {
		memberMapper.memberAdd(member);
	}
	
	/* 아이디 중복 체크 */
	@Override
	public int idCheck(String memberId) throws Exception {
		return memberMapper.idCheck(memberId);
	}
	
	/* 로그인 */
	@Override
	public MemberDTOS memberLogin(MemberDTOS member) throws Exception {
		return memberMapper.memberLogin(member);
	}
	
	/* 주문자 정보 */
	@Override
	public MemberDTOS getMemberInfo(String memberId) {
		return memberMapper.getMemberInfo(memberId);
	}
}
