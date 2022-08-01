package org.paldo.mapper;

import java.util.List;

import org.paldo.domain.Criteria;
import org.paldo.domain.ShopProductVO;

public interface PaldoMapper {

	/* 상품 검색 */
	public List<ShopProductVO> getProductList(Criteria cri);
	
	/* 상품 총 갯수 */
	public int productGetTotal(Criteria cri);
}
