package org.paldo.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ShopBoardVO {

	private Long boardId;
	private String adminId;
	private String adminName;
	private String boardTitle;
	private String boardContent;
	private Date regDate;
	private Date lastUpdate;
	private List<ShopBoardVO> sboardVo;
	private ShopAdminVO adminVO;
}
