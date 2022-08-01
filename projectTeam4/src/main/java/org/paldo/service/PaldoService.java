package org.paldo.service;

import java.util.List;

import org.paldo.domain.Criteria;
import org.paldo.domain.ShopProductVO;

public interface PaldoService {

	/* 상품 검색 */
	public List<ShopProductVO> getProductList(Criteria cri);
	
	/* 상품 총 갯수 */
	public int productGetTotal(Criteria cri);
}
