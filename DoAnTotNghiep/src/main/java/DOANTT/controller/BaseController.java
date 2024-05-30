package DOANTT.controller;

import java.math.BigInteger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import DOANTT.dto.Cart;
import DOANTT.model.User;

@Configuration
public class BaseController {
	
	@ModelAttribute("title")
	public String projectTitle() {
		return "TTTBNH HAI DANG";
	}
	@ModelAttribute("totalCartProducts")
	public BigInteger getTotalCartProducts(final HttpServletRequest request) {
		HttpSession session	= request.getSession();
		if(session.getAttribute("cart")== null) {
			return BigInteger.ZERO;
		}
		Cart cart = (Cart) session.getAttribute("cart");
		return cart.totalCartProducts();
	}
	
	// lấy thông tin của user đăng nhập
	@ModelAttribute("loginedUser")
	public User getLoginedUser() {
		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loginedUser != null && loginedUser instanceof UserDetails) {
			User user = (User) loginedUser;
			return user;
		}
		return new User();
		
	}
	// kiểm tra xem user login chưa
	@ModelAttribute("isLogined")
	public boolean istLogined() {
		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loginedUser != null && loginedUser instanceof UserDetails) {
			return true;
		}
		return false;
		
	}

	

}
