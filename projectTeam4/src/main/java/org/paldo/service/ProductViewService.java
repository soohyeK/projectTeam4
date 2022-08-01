package org.paldo.service;

import java.util.List;

import org.paldo.domain.ShopProductDetailVO;
import org.paldo.domain.ShopProductVO;

public interface ProductViewService {

	public List<ShopProductVO> getList();
	
	public ShopProductDetailVO getProduct(int productId);
	
}
