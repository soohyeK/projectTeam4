package org.paldo.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;


@Data
public class ShopMemberVO {

	private ShopMemberVO() {
		
	}
	
	private String memberId;
	private String memberPw;
	private String memberName;
	private Date memberBirth;
	private String memberEmail;
	private String memberAdd1;
	private String memberAdd2;
	private String tel;
	private int dormatStatus;
	private int withdrawlStatus;
	private Date withdrawlDate;
	private Date regDate;
	private Date lastUpdate;
	private List<ShopMemberVO> smemberVO;
	public int getAdminCk() {
		// TODO Auto-generated method stub
		return 0;
	}
}
