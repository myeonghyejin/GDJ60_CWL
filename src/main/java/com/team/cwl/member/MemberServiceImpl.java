package com.team.cwl.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	/* 닉네임 중복 체크 */
	@Override
	public int nickNameCheck(String memberNickName) throws Exception {
		return memberMapper.nickNameCheck(memberNickName);
	}
	
	/* 로그인 */
	@Override
	public MemberDTO memberLogin(MemberDTO member) throws Exception {
		return memberMapper.memberLogin(member);
	}
	
	/* 주문자 정보 */
	@Override
	public MemberDTO getMemberInfo(String memberId) {
		System.out.println(memberId);
		return memberMapper.getMemberInfo(memberId);
	}
	
	/* 마이페이지 */
	public MemberDTO getMemberPage(MemberDTO memberDTO) throws Exception {
		return memberMapper.memberLogin(memberDTO);
	}
	
	/* 회원 수정 */
	public int memberUpdate(MemberDTO memberDTO) throws Exception {
		return memberMapper.memberUpdate(memberDTO);
	}
	
	public void modifyPw(MemberDTO member) throws Exception {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("암호화 전 비밀번호 : " + member.getMemberPw());
		
		String securePw = encoder.encode(member.getMemberPw());
		member.setMemberPw(securePw);
		
		System.out.println("암호화 후 비밀번호 : " + member.getMemberPw());
		
		memberMapper.modifyPw(member);
		
	}
}
