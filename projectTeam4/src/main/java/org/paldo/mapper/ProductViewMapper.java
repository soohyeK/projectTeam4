package org.paldo.mapper;

import java.util.List;

import org.paldo.domain.ShopProductDetailVO;
import org.paldo.domain.ShopProductVO;

public interface ProductViewMapper {

	public List<ShopProductVO> getList();
	
	public ShopProductDetailVO getProduct(int productId); 
	
}
