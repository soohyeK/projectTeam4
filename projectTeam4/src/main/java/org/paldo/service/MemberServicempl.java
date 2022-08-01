package org.paldo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.paldo.mapper.MemberMapper;
import org.paldo.domain.ShopMemberVO;

import lombok.AllArgsConstructor;

	@Service
	@AllArgsConstructor
	public class MemberServicempl implements MemberService{

		@Autowired
		MemberMapper membermapper;
		
		//로그인
	    @Override
	    public ShopMemberVO memberLogin(ShopMemberVO member) throws Exception {
	        
	        return membermapper.memberLogin(member);
	    }

	    //회원가입
		@Override
		public void memberJoin(ShopMemberVO member) throws Exception {
			
			membermapper.memberJoin(member);
			
		}
		
		//아이디 중복 검사
		@Override
		public int idCheck(String memberId) throws Exception {
			
			return membermapper.idCheck(memberId);
		}

}
