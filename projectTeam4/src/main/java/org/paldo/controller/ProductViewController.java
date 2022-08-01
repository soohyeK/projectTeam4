package org.paldo.controller;

import org.paldo.domain.ShopProductDetailVO;
import org.paldo.service.ProductViewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/product")
public class ProductViewController {

	private ProductViewService service;
	
	@GetMapping("/get")
	public void getProduct(ShopProductDetailVO dVo, Model model, @RequestParam("productId") int productId ) {
		model.addAttribute("dVo", service.getProduct(productId));
	}
}
