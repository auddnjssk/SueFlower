package com.suflower.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.suflower.domain.ProductDTO;

public interface ProductMapper {

	public List<ProductDTO> productList();
	
	public void insertProductSelectKey(ProductDTO product);
	
	public void insertProduct(ProductDTO product);
	
	public ProductDTO readProduct(Long productId);
	
	public int deleteProduct(Long productId);
	
	public int updateProduct(ProductDTO product);
	
	public String uploadfile(Long productId);

	
}
