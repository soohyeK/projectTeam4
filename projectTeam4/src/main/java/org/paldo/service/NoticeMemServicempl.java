package org.paldo.service;

import java.util.List;

import org.paldo.domain.CriteriaNotice;
import org.paldo.domain.ShopBoardVO;
import org.paldo.mapper.NoticeBoardMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
@Service
@AllArgsConstructor
public class NoticeMemServicempl implements NoticeMemService {
	
	private NoticeBoardMapper mapper;

	@Override
	public ShopBoardVO get(long boardId) {
		// TODO Auto-generated method stub
		
		return mapper.get(boardId);
	}

	@Override
	public int getTotal(CriteriaNotice criNo) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(criNo);
	}

	@Override
	public List<ShopBoardVO> getList(CriteriaNotice criNo) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(criNo);
	}

}
