package org.paldo.mapper;

import java.util.List;

import org.paldo.domain.CriteriaNotice;
import org.paldo.domain.ShopBoardVO;

public interface NoticeBoardMapper {

	public List<ShopBoardVO> getList();
	
	public List<ShopBoardVO> getListWithPaging(CriteriaNotice criNo);
	
	public void register(ShopBoardVO board);
	
	public void insertSelectKey(ShopBoardVO board);
	
	public ShopBoardVO get(long boardId);
	
	public int delete(int boardId);
	
	public int modify(ShopBoardVO sBoardVO);
	
	public int getTotalCount(CriteriaNotice criNo);
}
