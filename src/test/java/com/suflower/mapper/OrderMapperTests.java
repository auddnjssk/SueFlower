package com.suflower.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.suflower.domain.OrderDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.suflower.config.RootConfig.class})
@Log4j
public class OrderMapperTests {

	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;
	
	@Test
	public void testOrderList() {
		mapper.getList().forEach(order -> log.info(order));
	}
	
//	@Test
//	public void testInsert() {
//		OrderDTO order = new OrderDTO();
//		
//		order.setProductId(3L);
//		order.setOrderDate("03-FEB-22");
//		order.setOrderQuantity(2);
//		order.setMemberId("jaek1997");
//		order.setReceiverName("이재경");
//		order.setReceiverAddr1("경기도 용인시 기흥구");
//		order.setReceiverAddr2("동백죽전대로");
//		order.setReceiverPhoneNum("010-0000-0000");
//		
//		mapper.insert(order);
//		
//		log.info(order);
//		
//	}
	
//	@Test
//	public void testRead() {
//		OrderDTO order = mapper.read(7L);
//		log.info(order);
//	}
	
//	@Test
//	public void testUpdate() {
//		
//		OrderDTO order = new OrderDTO();
//		
//		order.setOrderId(7L);
//		order.setReservationDate("03-FEB-23");
//		order.setOrderQuantity(3);
//		order.setReceiverAddr1("경기도 용인시 처인구");
//		order.setReceiverAddr2("에버랜드");
//		order.setReceiverName("이재경");
//		order.setReceiverPhoneNum("010-0000-0000");
//		
//		int count = mapper.update(order);
//		
//		log.info("update count = " + count);
//	}
	
//	@Test
//	public void testDelete() {
//		
//		int count = mapper.delete(7L);
//		log.info("delete count = " + count);
//	}
	
	
	
}
