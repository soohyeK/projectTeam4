package org.paldo.service;

import java.util.List;

import org.paldo.domain.Criteria;
import org.paldo.domain.ShopMemberVO;
import org.paldo.mapper.MembersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Log4j
@Service
@AllArgsConstructor
public class MembersServicempl implements MembersService{
	
	

	  @Autowired
	    MembersMapper membersMapper;
	  
	  @Override
	    public void memberEnroll(ShopMemberVO member) throws Exception {
	        
	        membersMapper.memberEnroll(member);
	        
	    }
	  
	  /* 회원 목록 */
		@Override
		public List<ShopMemberVO> memberGetList(Criteria cri) throws Exception {

			log.info("(service)memberGetList()......." + cri);
			
			return membersMapper.memberGetList(cri);
		}
		
		 /* 회원 총 수 */
	    @Override
	    public int memberGetTotal(Criteria cri) throws Exception {
	        log.info("(service)memberGetTotal()......." + cri);
	        return membersMapper.memberGetTotal(cri);
	    }
	 

}
