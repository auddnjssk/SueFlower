package com.suflower.mapper;

import java.util.List;

import com.suflower.domain.CartDTO;

public interface CartMapper {
	
	public List<CartDTO> cartMoney();
	
	public void insert(CartDTO cart);
	
	public List<CartDTO> getList(String memberId);
	
	public int delete(int cartId);
	
	public int deleteAll(String memberId);
	
	public int sumMoney(String memberId);
	
	public int countCart(String memberId, Long productId);
	
	public int updateCart(CartDTO cart);
	
	public int countItems(String memberId);

}
