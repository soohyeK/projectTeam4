package org.paldo.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ShopWareVO {

	private int productId;
	private String warePrice;
	private int wareCount;
	private Date wareDate;
	private Date regDate;
	private Date lastUpdate;
	private List<ShopWareVO> sWareVO;
}
