package org.paldo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.paldo.domain.ShopAdminVO;
import org.paldo.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/login")
@AllArgsConstructor
public class LoginController {

	private AdminService adminservcie;
	
	/* 관리자 로그인 페이지*/
    @RequestMapping(value="admin.do",method=RequestMethod.GET)
	public void loginPageGET() {

		log.info("관리자 로그인 페이지로");
    }
    /* 관리자 로그인*/
    @RequestMapping(value="admin.do",method=RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, ShopAdminVO admin, RedirectAttributes rttr) throws Exception {
		
		HttpSession session = request.getSession();
		String adminId = request.getParameter("adminId");
		session.setAttribute("adminId", adminId);
		ShopAdminVO sAvo = adminservcie.adminLogin(admin);
				
		if(sAvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/login/admin";
		   }
			session.setAttribute("admin", sAvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
			return "redirect:/admin/main";
		
	}
}
