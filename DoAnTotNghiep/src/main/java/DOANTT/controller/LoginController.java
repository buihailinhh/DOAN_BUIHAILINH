package DOANTT.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import DOANTT.model.Role;
import DOANTT.model.User;
import DOANTT.service.RoleService;
import DOANTT.service.UserService;




@Controller

public class LoginController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			
			throws IOException {
		
		return "login";
	}
	
//	@RequestMapping(value = "/signup", method = RequestMethod.GET)
//	public String signup(final Model model,
//			final HttpServletRequest request,
//			final HttpServletResponse response)
//			
//			throws IOException {
//		
//		return "signup";
//	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String register(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			
			throws IOException { 
		
		String username = request.getParameter("username");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		if (username.trim() == "" || password.trim() == "" || email.trim() == "" || mobile.trim()=="") {
			return "redirect:/login?signup_false=true";
		}
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(new BCryptPasswordEncoder(4).encode(password));
		user.setEmail(email);
		user.setMobile(mobile);
		
		
		// Set role cho user mới- mặc định role là 'customer'
		// Lấy cái role có name là 'customer' trong DB
		
		try {
			Role role =roleService.getRoleByName("CUSTOMER");
			user.addRole(role);// Luu rang buoc voi role -> tbl_user_role
			userService.saveOrUpdate(user);
		} catch(Exception e) {
			return "redirect:/login?signup_false=true";
		}
		
		return "redirect:/login?signup=true";
	}
	
	
 
}
