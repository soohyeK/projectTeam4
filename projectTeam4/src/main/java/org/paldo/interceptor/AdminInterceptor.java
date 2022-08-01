package org.paldo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.paldo.domain.ShopAdminVO;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor{
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

		HttpSession session = request.getSession();
        
        ShopAdminVO mvo = (ShopAdminVO)session.getAttribute("admin");
        
        if(mvo == null) {    // 愿�由ъ옄 怨꾩젙 �븘�땶 寃쎌슦
            
            response.sendRedirect("/main");    // 硫붿씤�럹�씠吏�濡� 由щ떎�씠�젆�듃
            
            return false;
            
        }
        
        return true; 
    }

}
