package com.suflower.service;

import java.util.List;

import com.suflower.domain.OrderDTO;

public interface OrderService {

	public List<OrderDTO> getOrderList();
	
	public OrderDTO getOrder(Long orderId);
	
	public void registerOrder(OrderDTO order);
	
	public boolean modifyOrder(OrderDTO order);
	
	public boolean removeOrder(Long orderId);
	
}
