package org.paldo.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ShopPaymentVO {

	private int price;
	private String orderId;
	private String payStatus;
	private Date payDate;
	private Date lastUpdate;
	private List<ShopPaymentVO> sPaymentVO;
}
