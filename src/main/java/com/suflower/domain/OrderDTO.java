package com.suflower.domain;

import lombok.Data;

@Data
public class OrderDTO {
	
	private Long orderId;
	private Long productId;
	private int quantity;
	private String orderDate;
	private int sumTotalPrice;
	private String reservationDate;
	private String memberId;
	private String senderName;
	private String receiverName;
	private String receiverAddress1;
	private String receiverAddress2;
	private String receiverContact;

}
