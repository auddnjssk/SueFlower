package com.suflower.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductDTO {
	
	private Long productId;
	private String productType;
	private String productName;
	private int productQuantity;
	private Long productPrice;
	private String regdate;
	private String updateDate;	
	private String uploadfile;
	private MultipartFile uploadfilef;
}
