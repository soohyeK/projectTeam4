package org.paldo.service;

import java.util.List;

import org.paldo.domain.Criteria;
import org.paldo.domain.ShopProductVO;
import org.paldo.mapper.PaldoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PaldoServicempl implements PaldoService{

	@Autowired
	private PaldoMapper paldoMapper;
	
	/* 상품 검색 */
	@Override
	public List<ShopProductVO> getProductList(Criteria cri) {
		
		log.info("getProductList().......");
		
		return paldoMapper.getProductList(cri);
	}

	/* 사품 총 갯수 */
	@Override
	public int productGetTotal(Criteria cri) {
		
		log.info("productGetTotal().......");
		
		return paldoMapper.productGetTotal(cri);
		
	}
}
