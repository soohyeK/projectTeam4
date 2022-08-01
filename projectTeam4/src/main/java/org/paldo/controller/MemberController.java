package org.paldo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.paldo.domain.ShopMemberVO;
import org.paldo.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member")
@AllArgsConstructor
public class MemberController {
	
	private MemberService MemberService;


	@RequestMapping(value="login",method=RequestMethod.GET)
	public void loginPageGET() {

		log.info("로그인 페이지로");

	}
	
	/*로그아웃 */
    @RequestMapping(value="logout.do",method=RequestMethod.GET)
    @ResponseBody
    public void logoutGet() throws Exception{
    	log.info("로그아웃");
    }
    

	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, ShopMemberVO member, RedirectAttributes rttr) throws Exception {
		
		HttpSession session = request.getSession();
		ShopMemberVO sMvo = MemberService.memberLogin(member);
				
		if(sMvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";
		   }
			session.setAttribute("member", sMvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
			return "redirect:/main";
		
	}
	 /* 비동기방식 로그아웃 메서드 */
    @RequestMapping(value="logout.do", method=RequestMethod.POST)
    @ResponseBody
    public void logoutPOST(HttpServletRequest request) throws Exception{
        
        log.info("비동기 로그아웃 메서드 진입");
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
    }
    
}
