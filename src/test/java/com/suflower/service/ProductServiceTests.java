package com.suflower.service;


import static org.junit.Assert.assertNotNull;

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
public class ProductServiceTests {

//	@Setter(onMethod_ = @Autowired)
//	public ProductService service;
//	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(product -> log.info(product));
//	}
//	
//	@Test
//	public void testServiceExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
//	
//	@Test
//	public void testRegister() {
//		
//		ProductDTO product = new ProductDTO();
//		
//		try {
//			product.setProductType("Flower");
//			product.setProductName("Tulip");
//			product.setProductQuantity(1);
//			product.setProductPrice(8400L);
//			
//			service.register(product);
//			log.info("생성된 상품의 번호: " + product.getProductId());
//		}catch(Exception e) {
//			e.getMessage();
//			log.info("중복된 상품명이 추가되었습니다" );
//		}
//	}
//	
//	@Test
//	public void testGet() {
//		
//		ProductDTO product = service.get(10000000L);
//	
//		Assertions.assertThat(product).isNull();
//	}
//	
//	@Test
//	public void testUpdate() {
//		ProductDTO product = service.get(2L);
//		
//		if(product == null) {
//			return;
//		}
//		
//		
//		product.setProductQuantity(2);
//		
//		log.info("Modify result => " + service.modify(product));
//	}
//	
//	@Test
//	public void testDelete() {
//		
//		log.info(service.remove(2L));
//	}
	
}//ProductServiceTests
