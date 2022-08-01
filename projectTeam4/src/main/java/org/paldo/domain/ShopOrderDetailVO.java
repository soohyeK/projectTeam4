package org.paldo.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ShopOrderDetailVO {

	private int orderitemId;
	private String orderId;
	private int productId;
	private int orderCount;
	private String orderAdd;
	private String orderStatus;
	private Date orderDate;
	private Date lastUpdate;
	private List<ShopOrderDetailVO> soDeatilVO;
}
