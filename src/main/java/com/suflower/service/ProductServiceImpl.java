package com.suflower.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.suflower.domain.ProductDTO;
import com.suflower.mapper.ProductMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service

public class ProductServiceImpl implements ProductService{
	
	
	private final ProductMapper mapper;
	
	//스프링 4.3이후로 @Autowired 생략 가능함
	public ProductServiceImpl(ProductMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public void register(ProductDTO product) {
		
		log.info("register => " + product);
		mapper.insertProductSelectKey(product);
	}

	@Override
	public ProductDTO get(Long productId) {
		
		return mapper.readProduct(productId);
	}

	@Override
	public boolean modify(ProductDTO product) {
		
		return mapper.updateProduct(product) == 1;
	}

	@Override
	public boolean remove(Long productId) {
		
		return mapper.deleteProduct(productId) == 1;
	}

	@Override
	public List<ProductDTO> getList() {
		
		return mapper.productList();
	}

	@Override
	public String uploadfile(Long productId) {
		
		return mapper.uploadfile(productId);
	}
	
	
	
}//ProductServiceImpl
