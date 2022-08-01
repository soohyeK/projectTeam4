package org.paldo.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.paldo.domain.Criteria;
import org.paldo.domain.CriteriaNotice;
import org.paldo.domain.NoticePageDTO;
import org.paldo.domain.PageDTO;
import org.paldo.domain.ShopAdminVO;
import org.paldo.domain.ShopAttachFileDTO;
import org.paldo.domain.ShopImageVO;
import org.paldo.domain.ShopMemberVO;
import org.paldo.domain.ShopProductVO;
import org.paldo.service.AdminService;
import org.paldo.service.MemberService;
import org.paldo.service.MembersService;
import org.paldo.service.NoticeService;
import org.paldo.service.ProductService;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin")
@Log4j
@AllArgsConstructor
public class AdminController {

	 private AdminService adminservcie;
	 private MembersService memberService;
	 private ProductService productService;
	 
	 /* 관리자 메인 페이지 이동 */
	    @RequestMapping(value="main", method = RequestMethod.GET)
	    public void adminMainGET() throws Exception{
	        
	        log.info("관리자 페이지 이동");
	        
	    }
//	    /* 관리자 로그인 페이지*/
//	    @RequestMapping(value="login",method=RequestMethod.GET)
//		public void loginPageGET() {
//
//			log.info("관리자 로그인 페이지로");
//
//		}
	    
	    /*로그아웃 */
	    @RequestMapping(value="logout.do",method=RequestMethod.GET)
	    @ResponseBody
	    public void logoutGet() throws Exception{
	    	log.info("로그아웃");
	    
	    }
	    
//	    /* 관리자 로그인*/
//	    @RequestMapping(value="login.do",method=RequestMethod.POST)
//		public String loginPOST(HttpServletRequest request, ShopAdminVO admin, RedirectAttributes rttr) throws Exception {
//			
//			HttpSession session = request.getSession();
//			ShopAdminVO sAvo = adminservcie.adminLogin(admin);
//					
//			if(sAvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
//				int result = 0;
//				rttr.addFlashAttribute("result", result);
//				return "redirect:/admin/login";
//			   }
//				session.setAttribute("admin", sAvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
//				return "redirect:/admin/main";
//			
//		}
	    /* 비동기방식 로그아웃 메서드 */
	    @RequestMapping(value="logout.do", method=RequestMethod.POST)
	    @ResponseBody
	    public String logoutPOST(HttpServletRequest request, RedirectAttributes rttr) throws Exception{
	        
	        log.info("비동기 로그아웃 메서드 진입");
	        
	        HttpSession session = request.getSession();
	        
	        session.invalidate();
	        return "redirect:/main";
	    }
	    
//	   /* 상품 등록 페이지 접속 */
	    @RequestMapping(value = "productEnroll", method = RequestMethod.GET)
	    public void productEnrollGET() throws Exception{
	        log.info("상품 등록 페이지 접속");
	    }
	    
	    /* 회원 등록 페이지 접속 */
	    @RequestMapping(value = "memberEnroll", method = RequestMethod.GET)
	    public void memberEnrollGET() throws Exception{
	        log.info("회원 등록 페이지 접속");
	    }
	    
	    /* 상품 관리 페이지 접속 */
		@RequestMapping(value = "productManage", method = RequestMethod.GET)
		public void productManageGET(Criteria cri, Model model) throws Exception{
		
			 log.info("상품 관리 페이지 접속");
			 
			 /* 상품 리스트 데이터 */
				List list = productService.productGetList(cri);
				
				if(!list.isEmpty()) {
					model.addAttribute("list", list);
				} else {
					model.addAttribute("listCheck", "empty");
					return;
				}
				
				/* 페이지 인터페이스 데이터 */
				model.addAttribute("pageMaker", new PageDTO(cri, productService.productGetTotal(cri)));

		}
	    
	    /* 회원 관리 페이지 접속 */
	    @RequestMapping(value = "memberManage", method = RequestMethod.GET)
	    public void memberManageGET(Criteria cri, Model model) throws Exception{
	        log.info("회원 관리 페이지 접속");
	        
	        /* 회원 목록 출력 데이터 */
	        List list = memberService.memberGetList(cri);
	        
	        if(!list.isEmpty()) {
				model.addAttribute("list",list);	// 작가 존재 경우
			} else {
				model.addAttribute("listCheck", "empty");	// 작가 존재하지 않을 경우
			}
	      
	    
	    /* 페이지 이동 인터페이스 데이터 */
        int total = memberService.memberGetTotal(cri);
        
        PageDTO pageMaker = new PageDTO(cri, total);
        
        model.addAttribute("pageMaker", pageMaker);
	    }

        
	    /* 회원 등록 */
	    @RequestMapping(value="memberEnroll.do", method = RequestMethod.POST)
	    public String memberEnrollPOST(ShopMemberVO member, RedirectAttributes rttr) throws Exception{
	    	
	    	log.info("memebrEnroll :" +  member);
	        
	        memberService.memberEnroll(member);      // 작가 등록 쿼리 수행
	        
	        rttr.addFlashAttribute("enroll_result", member.getMemberName());
	        
	        return "redirect:/admin/memberManage";
	 
	    }
	    
	    /* 상품 등록 */
		@PostMapping("/productEnroll")
		public String productEnrollPOST(ShopProductVO product, RedirectAttributes rttr,ShopImageVO dto) {
			
			log.info("productEnrollPOST......" + product);
			if(product.getImageVO() != null) {
				product.getImageVO().forEach(attach -> log.info(attach));
				productService.imageEnroll(dto);
			}
			
			productService.productEnroll(product);
			rttr.addFlashAttribute("enroll_result", product.getProductName());
			
			return "redirect:/admin/main";
		}	
		
}
