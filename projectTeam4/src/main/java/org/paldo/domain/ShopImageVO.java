package org.paldo.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ShopImageVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fileFormat;
	private int productId;
	private Date regDate;
	private Date lastUpdate;
	private List<ShopImageVO> simageVO;
	private boolean image;
}
