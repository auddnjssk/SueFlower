package com.suflower.mapper;

import org.assertj.core.api.Assertions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.suflower.domain.ProductDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.suflower.config.RootConfig.class})
@Log4j
public class ProductMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
//	@Test
//	public void testProductInsert() {
//		ProductDTO product = new ProductDTO();
//		
//		product.setProductName("Raninculus");
//		product.setProductType("Flower");
//		product.setProductPrice(10000L);
//		product.setProductQuantity(1);
//		product.setFilename("raninculus.png");
//		
//		mapper.insertProduct(product);
//		
//	}
	
//	@Test
//	public void testProductList() {
//		mapper.productList().forEach(product -> log.info(product));
//	}
//	
//	@Test
//	public void testDetail() {
//		mapper.readProduct(7L);
//	}
}
