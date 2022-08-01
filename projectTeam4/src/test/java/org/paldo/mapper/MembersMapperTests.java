package org.paldo.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.paldo.domain.Criteria;
import org.paldo.domain.ShopMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MembersMapperTests {
	
	@Autowired
    private MembersMapper mapper;
    
    /* 회원 등록 테스트 */
	/*
    @Test
    public void memberEnroll() throws Exception{
        
        ShopMemberVO member = new ShopMemberVO();
        
        member.setMemberID("test6");
        member.setMemberPW("12345");
        member.setMemberName("김민철");
        member.setMemberBirth("961105");
        member.setMemberEmail("adasd@gmail.com");
        member.setMemberAdd1("강서구");
        member.setMemberAdd2("강서구");
        member.setTel("010-0000-0000");
        
        mapper.memberEnroll(member);
        
    }    
*/
	
	/* 회원 목록 테스트 */
    @Test
    public void memberGetListTest() throws Exception{
        
        Criteria cri = new Criteria(3,10);    // 3페이지 & 10개 행 표시
        
        List<ShopMemberVO> list = mapper.memberGetList(cri);
        
        for(int i = 0; i < list.size(); i++) {
            System.out.println("list" + i + ".........." + list.get(i));
        }
        
    }
	
	
}
