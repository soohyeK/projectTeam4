package org.paldo.service;

import java.util.List;

import org.paldo.domain.CriteriaNotice;
import org.paldo.domain.ShopBoardVO;
import org.springframework.stereotype.Service;


public interface NoticeMemService {

	public ShopBoardVO get(long boardId);
	
	public int getTotal(CriteriaNotice criNo);
	
	public List<ShopBoardVO> getList(CriteriaNotice criNo);
}
