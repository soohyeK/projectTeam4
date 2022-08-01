package org.paldo.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ShopAdminVO {

	private ShopAdminVO() {
		
	}
	
	private String adminId;
	private String adminPw;
	private String adminName;
	private String adminEmail;
	private String adminAdd;
	private String adminTel;
	private String adminStatus;
	private Date regDate;
	private Date lastUpdate;
	private List<ShopAdminVO> sadminVO;
}
