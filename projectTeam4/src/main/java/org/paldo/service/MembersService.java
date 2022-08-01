package org.paldo.service;

import java.util.List;

import org.paldo.domain.Criteria;
import org.paldo.domain.ShopMemberVO;

public interface MembersService {

	/* 회원 등록 */
    public void memberEnroll(ShopMemberVO member) throws Exception;
    
    /* 회원 목록 */
    public List<ShopMemberVO> memberGetList(Criteria cri) throws Exception;
    
    
  /* 회원 총 수 */
  public int memberGetTotal(Criteria cri) throws Exception; 

	
}
