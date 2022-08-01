package org.paldo.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class NoticePageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private CriteriaNotice criNo;
	
	public NoticePageDTO(CriteriaNotice criNo, int total) {
		this.criNo = criNo;
		this.total = total;
		
		this.endPage =(int)(Math.ceil(criNo.getPageNum()/10.0))*10;
		this.startPage =this.endPage-9;
		
		int realEnd = (int)(Math.ceil(total*1.0)/criNo.getAmount());
		
		if(realEnd<this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage>1;
		this.next = this.endPage<realEnd;
	}
}
