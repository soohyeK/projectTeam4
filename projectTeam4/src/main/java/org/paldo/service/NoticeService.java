package org.paldo.service;

import java.util.List;

import org.paldo.domain.CriteriaNotice;
import org.paldo.domain.ShopBoardVO;

public interface NoticeService {

	public void register(ShopBoardVO sBoardVO);
	
	public ShopBoardVO get(long boardId);
	
	public boolean modify(ShopBoardVO sBoardVO);
	
	public boolean delete(int boardId);
	
	public List<ShopBoardVO> getList(CriteriaNotice criNo);
	
	public int getTotal(CriteriaNotice criNo);
}
