package org.paldo.service;

import java.util.List;

import org.paldo.domain.ShopProductDetailVO;
import org.paldo.domain.ShopProductVO;
import org.paldo.mapper.ProductViewMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductViewServicempl implements ProductViewService {

	private ProductViewMapper mapper;
	
	@Override
	public List<ShopProductVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}
	@Override
	public ShopProductDetailVO getProduct(int productId) {
		return mapper.getProduct(productId);
	}

}
