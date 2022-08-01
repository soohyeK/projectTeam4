package org.paldo.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ShopCompanyVO {

	private int companyId;
	private String companyName;
	private String companyAdd;
	private String companyEmail;
	private String companyTel;
	private String companyContent;
	private int dealStatus;
	private Date regDate;
	private Date lastUpdate;
	private List<ShopCompanyVO> scompanyVO;
}
