package org.paldo.domain;

import java.util.Date;

public class CartDTO {

	private int cartId;
    
    private String memberId;
    
    private int productId;
    
    private int cartCount;
    
    private Date regDate;
    
    private Date lastUpdate;

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpDate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	
	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", memberId=" + memberId + ", productId=" + productId + ", cartCount="
				+ cartCount + ", regDate=" + regDate + ", lastUpdate=" + lastUpdate + "]";
	}
    
}
