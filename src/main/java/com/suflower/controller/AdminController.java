package com.suflower.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.suflower.service.MemberService;

//@Controller
//@RequestMapping(value = "/admin/*")
//public class AdminController {
//	
//	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
//
//	@Autowired
//	private AdminrService adminservice;
//	
//	@GetMapping("/adminPage")
//	public void adminPageGET() {
//		logger.info("관리자 페이지 진입");
//	}
//}
