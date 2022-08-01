package org.paldo.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class QnaVO {

	private int questionId;
	private String memberId;
	private String adminId;
	private String qnaTitle;
	private String qnaContent;
	private Date regDate;
	private Date anserDate;
	private Date lastUpdate;
	private List<QnaVO> qnaVO;
}
