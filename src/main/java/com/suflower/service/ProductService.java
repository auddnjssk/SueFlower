package com.suflower.service;

import java.util.List;

import com.suflower.domain.ProductDTO;

public interface ProductService {
	
	public void register(ProductDTO product);
	
	public ProductDTO get(Long productId);
	
	public boolean modify(ProductDTO product);
	
	public boolean remove(Long productId);
	
	public List<ProductDTO> getList();
	
	public String uploadfile(Long productId);
	
}//ProductService
