package org.paldo.service;

import java.util.List;

import org.paldo.domain.CriteriaNotice;
import org.paldo.domain.ShopBoardVO;
import org.paldo.mapper.NoticeBoardMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServicempl implements NoticeService {

	private NoticeBoardMapper mapper;
	@Override
	public void register(ShopBoardVO sBoardVO) {
		// TODO Auto-generated method stub

		log.info("register ....."+sBoardVO);
		mapper.insertSelectKey(sBoardVO);
	}

	@Override
	public ShopBoardVO get(long boardId) {
		// TODO Auto-generated method stub
		
		log.info("get.......");
		return mapper.get(boardId);
	}

	@Override
	public boolean modify(ShopBoardVO sBoardVO) {
		// TODO Auto-generated method stub
		log.info("modify..."+sBoardVO);
		return mapper.modify(sBoardVO) == 1;
	}

	@Override
	public boolean delete(int boardId) {
		// TODO Auto-generated method stub
		log.info("delete...."+boardId);
		return mapper.delete(boardId) == 1;
	}

	@Override
	public List<ShopBoardVO> getList(CriteriaNotice criNo) {
		// TODO Auto-generated method stub
		log.info("get list with criteriaNotice :"+criNo);
		return mapper.getListWithPaging(criNo);
	}

	@Override
	public int getTotal(CriteriaNotice criNo) {
		// TODO Auto-generated method stub
		log.info("get total count");
		return mapper.getTotalCount(criNo);
	}

}
