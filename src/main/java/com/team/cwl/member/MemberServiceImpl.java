package com.team.cwl.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper memberMapper;
	
	/* ȸ������ */
	@Override
	public void memberAdd(MemberDTO member) throws Exception {
		memberMapper.memberAdd(member);
	}
	
	/* ���̵� �ߺ� üũ */
	@Override
	public int idCheck(String memberId) throws Exception {
		return memberMapper.idCheck(memberId);
	}
	
	/* �α��� */
	@Override
	public MemberDTO memberLogin(MemberDTO member) throws Exception {
		return memberMapper.memberLogin(member);
	}
	
	/* �ֹ��� ���� */
	@Override
	public MemberDTO getMemberInfo(String memberId) {
		System.out.println(memberId);
		return memberMapper.getMemberInfo(memberId);
	}
	
	public MemberDTO getMemberPage(MemberDTO memberDTO) throws Exception {
		return memberMapper.memberLogin(memberDTO);
	}
}
