package com.suflower.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)

@WebAppConfiguration

@ContextConfiguration(classes = {com.suflower.config.RootConfig.class,
								 com.suflower.config.ServletConfig.class})
@Log4j
public class ProductControllerTests {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext context;
	
	private MockMvc mockMvc;
	
	
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
//	@Test
//	public void testList() throws Exception{
//		
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/product/list"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
//	
//	@Test
//	public void testRegister() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/product/register")
//				.param("productType", "Test type")
//				.param("productName", "Test name2")
//				.param("productQuantity", "19")
//				.param("productPrice", "2000")
//				).andReturn().getModelAndView().getViewName();
//				
//		log.info(resultPage);
//
//	}
//	
//	@Test
//	public void testGet() throws Exception{
//		
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//				.get("product/get")
//				.param("productId", "3"))
//				.andReturn()
//				.getModelAndView().getModelMap());
//	}
//	
//	@Test
//	public void testModify() throws Exception{
//		
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/product/modify")
//				.param("productId", "1")
//				.param("productType", "테스트")
//				.param("productName", "테스트")
//				.param("productQuantity", "3")
//				.param("productPrice", "4000"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//				
//	}
//	
//	@Test
//	public void testRemove() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/product/remove")
//				.param("productId", "1")).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//				
//	}
	
	@Test
	public void testProducts() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/product/products"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
		
	}
}//ProductControllerTests
