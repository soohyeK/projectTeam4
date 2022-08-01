package org.paldo.domain;

import lombok.Data;

@Data
public class ShopAttachFileDTO {
	private String fileName;
	private String uploadPath;
	private String uuid;
	private int productId;
	private boolean image;
	private int CODE;
	public int getProductId(int productId) {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
}
