package com.suflower.service;

import static org.assertj.core.api.Assertions.fail;
import static org.junit.Assert.fail;

import org.assertj.core.api.Assertions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.suflower.domain.OrderDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration(classes= {com.suflower.config.RootConfig.class})
public class OrderServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private OrderServiceImpl service;
	
	
//	@Test
//	public void testServiceExistance() {
//		Assertions.assertThat(service).isNotNull();
//	}
	
	@Test
	public void testGetOrderList() {
		
		service.getOrderList().forEach(order -> log.info(order) );
	}
	
//	@Test
//	public void testRegisterOrder() {
//		
//		OrderDTO order = new OrderDTO();
//		
//		try {
//			order.setMemberId("jaek19978");
//			order.setOrderDate("03-JAN-22");
//			order.setOrderQuantity(4);
//			order.setProductId(3L);
//			order.setReceiverAddr1("서울특별시 대치동");
//			order.setReceiverAddr2("삼성래미안");
//			order.setReceiverName("김상심");
//			order.setReceiverPhoneNum("010-0000-0000");
//			order.setReservationDate("21-MAR-23");
//			
//			service.registerOrder(order);
//		}catch(Exception e) {
//			log.info("중복된 주문입니다");
//			fail();
//		}
//		
//		
//		
//	}
//	@Test
//	public void testGetOrder() {
//	
//		OrderDTO order = service.getOrder(8L);
//		
//		Assertions.assertThat(order.getOrderId()).isEqualTo(8L);
//		
//	}
	
//	@Test 
//	public void testModifyOrder() {
//		
//		OrderDTO order = service.getOrder(8L);
//		
//		if(order == null) {
//			return;
//		}
//		
//		order.setReservationDate("22-DEC-25");
//		
//		Assertions.assertThat(service.modifyOrder(order)).isEqualTo(true);
//	}
	
}
