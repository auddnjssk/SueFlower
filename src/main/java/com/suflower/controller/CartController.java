package com.suflower.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.suflower.domain.CartDTO;
import com.suflower.service.CartService;

@Controller
@RequestMapping("/cart/*")
@ResponseBody
public class CartController {

	private final CartService service;

	public CartController(CartService service) {
		this.service = service;
	}
	
	@RequestMapping("/insert")
	public void cartInsert(CartDTO cart, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		if (loginId != null) {
			cart.setMemberId(loginId);
			service.insert(cart);
		}
	}
	
	@RequestMapping("/cartList")
	public ModelAndView cartList(ModelAndView mv, CartDTO cart, 
			HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId != null) {
			String totalItemsInCart = Integer.toString(service.countItems(loginId));
			mv.addObject("totalItemsInCart", totalItemsInCart);
			mv.addObject("cartList", service.list(loginId));
			mv.addObject("sumTotalPrice", service.sumMoney(loginId));
			mv.addObject("cart", cart);
			mv.setViewName("/cart/cartList");
			
			if (totalItemsInCart.equals("0")) {
				mv.addObject("message", "장바구니가 비었습니다");
			}
			
			return mv;
		}else {
			mv.setViewName("/member/login");
			return mv;
		}
		
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(ModelAndView mv, int cartId) {
		
		service.delete(cartId);
		
		mv.setViewName("redirect:/cart/cartList");
		return mv;
	}
	
	@RequestMapping("/deleteAll")
	public ModelAndView deleteAll(ModelAndView mv, HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId != null) {
			service.deleteAll(loginId);
			mv.setViewName("redirect:/cart/cartList");
		}else {
			mv.setViewName("/member/login");
		}
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView updateCart(ModelAndView mv, CartDTO cart, HttpSession session,
			@RequestParam("cartId") int cartId, @RequestParam("quantity") int quantity) {
		
		String loginId = (String) session.getAttribute("loginId");
		if(loginId != null) {
			cart.setCartId(cartId);
			cart.setQuantity(quantity);
			service.updateCart(cart);
			mv.setViewName("redirect:/cart/cartList");
		}else {
			mv.setViewName("/member/login");
		}
	
		return mv;
	}

}
