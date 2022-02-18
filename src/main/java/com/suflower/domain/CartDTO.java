package com.suflower.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class CartDTO {
	
	private int cartId;
	private String memberId;
	private String memberName;
	private Long productId;
	private String productName;
	private Long productPrice;
	private String reservationDate;
	private int quantity;
	private Long totalPrice;
	private Long sumTotalPrice;
	private int totalCartItems;
	private String uploadfile;
}
