package com.suflower.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.suflower.domain.OrderDTO;
import com.suflower.mapper.OrderMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderServiceImpl implements OrderService {
	
	private final OrderMapper mapper;

	public OrderServiceImpl(OrderMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public List<OrderDTO> getOrderList() {
		
		return mapper.getList();
	}

	@Override
	public OrderDTO getOrder(Long orderId) {
		
		return mapper.read(orderId);
	}

	@Override
	public void registerOrder(OrderDTO order) {
		
		mapper.insert(order);
	}

	@Override
	public boolean modifyOrder(OrderDTO order) {
		
		return mapper.update(order) == 1;
	}

	@Override
	public boolean removeOrder(Long orderId) {

		return mapper.delete(orderId) == 1;
	}
	
	
	
	
	
	

}
