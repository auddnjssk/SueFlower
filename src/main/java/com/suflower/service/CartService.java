package com.suflower.service;

import java.util.List;

import com.suflower.domain.CartDTO;

public interface CartService {

	public List<CartDTO> cartMoney();
	
	public void insert(CartDTO cart);
	
	public List<CartDTO> list(String memberId);
	
	public void delete(int cartId);
	
	public int deleteAll(String memberId);
	
	public int sumMoney(String memberId);
	
	public int countCart(String memberId, Long productId);
	
	public int updateCart(CartDTO cart);
	
	public int countItems(String memberId);
}
