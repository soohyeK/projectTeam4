package org.paldo.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ShopOrderDelVO {

	private String orderId;
	private String orderName;
	private String memberId;
	private String orderAdd;
	private String delAdd;
	private String orderStatus;
	private String delStatus;
	private int delPrice;
	private Date orderDate;
	private Date lastUpdate;
	private List<ShopOrderDelVO> soDelVo;
}
