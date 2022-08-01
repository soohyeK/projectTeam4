package org.paldo.controller;

import org.paldo.domain.CriteriaNotice;
import org.paldo.domain.NoticePageDTO;
import org.paldo.domain.ShopBoardVO;
import org.paldo.service.NoticeMemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/member/notice")
public class NoticeMemController {

	private NoticeMemService service;
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
    public void noticeList (Model model, CriteriaNotice criNo){
    	log.info("list: "+criNo);

		log.info("list: "+criNo);
		model.addAttribute("list",service.getList(criNo));
		int total = service.getTotal(criNo);
		log.info("total :"+total);
		model.addAttribute("pageMaker", new NoticePageDTO(criNo, total));
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("boardId") long boardId, @ModelAttribute("criNo") CriteriaNotice criNo, Model model, ShopBoardVO sboardVO) {
		log.info("/get "+boardId+sboardVO);
		//sboardVO = service.get(boardId);
		model.addAttribute("sBoardVO", service.get(boardId));
	}
}
