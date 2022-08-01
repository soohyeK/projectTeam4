package org.paldo.service;

import org.paldo.domain.ShopAdminVO;
import org.paldo.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminServicempl implements AdminService {
	
	@Autowired
	private AdminMapper adminmapper;

	@Override
	public ShopAdminVO adminLogin(ShopAdminVO admin) throws Exception {
		// TODO Auto-generated method stub
		log.info(admin);
		return adminmapper.adminLogin(admin);
	}

}
