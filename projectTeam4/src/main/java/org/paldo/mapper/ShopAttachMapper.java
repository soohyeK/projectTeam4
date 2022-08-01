package org.paldo.mapper;

import java.util.List;

import org.paldo.domain.ShopImageVO;


public interface ShopAttachMapper {
	
	public void insert(ShopImageVO vo);
	
	public List<ShopImageVO> findByCode(Long code);
	
//	public List<ShopImageVO> getOldFiles(Long code);
	
	public void delete(String uuid);
	
//	public void deleteAll(Long code);
	
	public List<ShopImageVO> getList(int productId);
}
