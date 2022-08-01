package org.paldo.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.paldo.domain.Criteria;
import org.paldo.domain.PageDTO;
import org.paldo.domain.ShopProductVO;
import org.paldo.service.PaldoService;
import org.paldo.service.ProductService;
import org.paldo.service.ProductViewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/")
public class PaldoController {

	private ProductViewService service;
	private ProductService pService;
	
	@Autowired
	private PaldoService paldoService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET(Model model) {
		
		log.info("mainpage");
		
		model.addAttribute("list",service.getList());
	}
	
	/* 상품 검색 */
	@GetMapping("search")
	public String searchProductGET(Criteria cri, Model model) {
		
		log.info("cri : " + cri);
		
		List<ShopProductVO> list = paldoService.getProductList(cri);
		log.info("pre list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			log.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");
			
			return "search";
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, paldoService.productGetTotal(cri)));
		
		
		return "search";
		
	}
	
	
//	@GetMapping("/display")
//	public String searchProductGet(Model model, Criteria cri){
//		
//		
//		List<ShopProductVO> list = service.getList();
//		
//		if(!list.isEmpty()) {
//			model.addAttribute("list",list);
//		}else {
//			model.addAttribute("listCheck", "empty");
//			return "search";
//		}
//		
//		model.addAttribute("pageMaker", new PageDTO(cri, pService.productGetTotal(cri)));
//		return "search";
//	}
//	
}
