package org.paldo.service;

import java.util.List;

import org.paldo.domain.Criteria;
import org.paldo.domain.ShopAttachFileDTO;
import org.paldo.domain.ShopImageVO;
import org.paldo.domain.ShopProductVO;
import org.paldo.mapper.ProductMapper;
import org.paldo.mapper.ShopAttachMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServicempl implements ProductService{

	@Setter(onMethod_=@Autowired)
	private ProductMapper productMapper;
	@Setter(onMethod_=@Autowired)
	private ShopAttachMapper aMapper;
	
	/* 상품 등록 */
	@Override
	@Transactional
	public void productEnroll(ShopProductVO product) {
		
		log.info("(srevice)productEnroll........");
		
		productMapper.productEnroll(product);
		
		if(product.getImageVO()== null || product.getImageVO().size() <= 0) {
			return;
		}
		
		product.getImageVO().forEach(attach -> {
			attach.setProductId(product.getProductId());
			aMapper.insert(attach);
			log.info("image....");
		});
		
	}
	
	/* 상품 리스트 */
	@Override
	public List<ShopProductVO> productGetList(Criteria cri) {
		log.info("productGetTotalList()..........");
		return productMapper.productGetList(cri);
	}

	/* 상품 총 갯수 */
	public int productGetTotal(Criteria cri) {
		log.info("productGetTotal().........");
		return productMapper.productGetTotal(cri);
	}
	
	public void imageEnroll(ShopImageVO vo) {
		productMapper.imageEnroll(vo);
	}
	
}
