package org.paldo.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ShopCartVO {

	private int cartId;
	private String memberId;
	private int productId;
	private int cartCount;
	private Date regDate;
	private Date lastUpdate;
	private List<ShopCartVO> scartVO;
}
