package org.paldo.service;

import java.util.List;

import org.paldo.domain.Criteria;
import org.paldo.domain.ShopAttachFileDTO;
import org.paldo.domain.ShopImageVO;
import org.paldo.domain.ShopProductVO;

public interface ProductService {

	/* 상품 등록 */
	public void productEnroll(ShopProductVO product);	
	
	/* 상품 리스트 */
	public List<ShopProductVO> productGetList(Criteria cri);
	
	/* 상품 총 개수 */
	public int productGetTotal(Criteria cri);
	
	public void imageEnroll(ShopImageVO vo);
}
