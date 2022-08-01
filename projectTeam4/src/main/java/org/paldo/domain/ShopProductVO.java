package org.paldo.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ShopProductVO {

	private int productId;
	private int companyId;
	private String productName;
	private int stock;
	private int price;
	private double discount;
	private int lastPrice;
	private Date regDate;
	private Date lastUpdate;
	private List<ShopProductVO> sProductVO;
	private List<ShopImageVO> imageVO;
	
	private boolean image;
	private String uuid;
	private String uploadPath;
	private String fileName;
	

}
