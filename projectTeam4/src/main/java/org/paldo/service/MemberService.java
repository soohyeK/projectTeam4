package org.paldo.service;

import org.paldo.domain.ShopMemberVO;

public interface MemberService {

	//회원가입
	public void memberJoin(ShopMemberVO member) throws Exception;
	
	//아이디 중복 검사
	public int idCheck(String memberId) throws Exception;
		
	//회원로그인
	public ShopMemberVO memberLogin(ShopMemberVO member) throws Exception;
}
