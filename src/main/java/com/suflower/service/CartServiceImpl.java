package com.suflower.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.suflower.domain.CartDTO;
import com.suflower.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService{

	
	

	private final CartMapper mapper;
	
	
	public CartServiceImpl(CartMapper mapper) {
		
		this.mapper = mapper;
	}

	@Override
	public List<CartDTO> cartMoney() {
		
		return mapper.cartMoney();
	}

	@Override
	public void insert(CartDTO cart) {
		
		mapper.insert(cart);
	}

	@Override
	public List<CartDTO> list(String memberId) {
		
		return mapper.getList(memberId);
	}

	@Override
	public void delete(int cartId) {
		
		mapper.delete(cartId);
	}

	@Override
	public int deleteAll(String memberId) {
		
		return mapper.deleteAll(memberId);
	}

	@Override
	public int sumMoney(String memberId) {
		
		return mapper.sumMoney(memberId);
	}

	@Override
	public int countCart(String memberId, Long productId) {
		
		return mapper.countCart(memberId, productId);
	}

	@Override
	public int updateCart(CartDTO cart) {
		
		return mapper.updateCart(cart);
	}

	@Override
	public int countItems(String memberId) {
		
		return mapper.countItems(memberId);
	}
	
}
