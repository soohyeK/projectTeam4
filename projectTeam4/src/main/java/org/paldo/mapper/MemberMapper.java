package org.paldo.mapper;

import org.paldo.domain.ShopMemberVO;

public interface MemberMapper {
		
		//회원가입
			public void memberJoin(ShopMemberVO member);

		//아이디 중복 검사
			public int idCheck(String memberId);
			
		//로그인 
			public ShopMemberVO memberLogin(ShopMemberVO member);
}
