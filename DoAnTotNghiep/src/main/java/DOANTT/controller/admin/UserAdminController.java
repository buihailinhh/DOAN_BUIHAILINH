package DOANTT.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import DOANTT.model.User;
import DOANTT.service.UserService;




@Controller


public class UserAdminController {
	
@Autowired
private UserService userService;
 @RequestMapping(value = "manager/list-user", method= RequestMethod.GET)
	 
	 public String listUser(final Model model,
			                    final HttpServletRequest request,
			                    final HttpServletResponse response)throws IOException{
			
			  List<User> users = userService.findAll();
			  Integer total = userService.findAll().size();
			  model.addAttribute("total",total); 
			  
			  model.addAttribute("users",users );
		
		 return "admin/list-user";
	 }
 

}
