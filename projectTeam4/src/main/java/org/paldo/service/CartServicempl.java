package org.paldo.service;

import java.util.List;

import org.paldo.domain.CartDTO;
import org.paldo.mapper.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServicempl implements CartService{

	@Autowired
	private  CartMapper cartmapper;
	
	@Override
	public int addCart(CartDTO cart) {
		
				// 장바구니 데이터 체크
				CartDTO checkCart = cartmapper.checkCart(cart);
				
				if(checkCart != null) {
					return 2;
				}
				
				// 장바구니 등록 & 에러 시 0반환
				try {	
					return cartmapper.addCart(cart);
				} catch (Exception e) {
					return 0;
				}
		

	}
	
	@Override
	public List<CartDTO> getCartList(String memberId) {

		List<CartDTO> cart = cartmapper.getCart(memberId);
		
		return cart;
	}
}
