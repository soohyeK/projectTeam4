package org.paldo.mapper;

import java.util.List;

import org.paldo.domain.ShopMemberVO;
import org.paldo.domain.Criteria;

public interface MembersMapper {

	 /* 회원 등록 */
    public void memberEnroll(ShopMemberVO member);

    /* 회원 목록 */
    public List<ShopMemberVO> memberGetList(Criteria cri);
    
    /* 회원 총 수 */
    public int memberGetTotal(Criteria cri);

}
