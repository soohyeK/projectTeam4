package org.paldo.controller;

import javax.servlet.http.HttpServletRequest;

import org.paldo.domain.CriteriaNotice;
import org.paldo.domain.NoticePageDTO;
import org.paldo.domain.ShopBoardVO;
import org.paldo.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/admin/notice")
public class NoticeController {

	private NoticeService service;
	
    @RequestMapping(value="/list", method = RequestMethod.GET)
    public void noticeList (Model model, CriteriaNotice criNo){
    	log.info("list: "+criNo);

		log.info("list: "+criNo);
		model.addAttribute("list",service.getList(criNo));
		int total = service.getTotal(criNo);
		log.info("total :"+total);
		log.info(model);
		model.addAttribute("pageMaker", new NoticePageDTO(criNo, total));
	}

    @PostMapping("/register")
	public String register(ShopBoardVO sBoardVO, RedirectAttributes rttr, HttpServletRequest request) {
		log.info("register: "+sBoardVO);
		service.register(sBoardVO);
		rttr.addFlashAttribute("result", sBoardVO.getBoardId());
		return "redirect:list";
	}
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("boardId") long boardId, @ModelAttribute("criNo") CriteriaNotice criNo, Model model, ShopBoardVO sboardVO) {
		log.info("/get or /modify"+boardId+sboardVO);
		//sboardVO = service.get(boardId);
		model.addAttribute("sBoardVO", service.get(boardId));
	}
	
	@PostMapping("/modify")
	public String modify(ShopBoardVO sBoardVO, @ModelAttribute("criNo") CriteriaNotice criNo, RedirectAttributes rttr) {
		log.info("modify: "+sBoardVO);
		if(service.modify(sBoardVO)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:list"+criNo.getListLink();
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public String remove(@RequestParam("boardId") int boardId, @ModelAttribute("criNo") CriteriaNotice criNo, RedirectAttributes rttr) {
		log.info("remove..."+boardId);
		if(service.delete(boardId)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:list"+criNo.getListLink();
	}
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public void register() {
		
	}
}
