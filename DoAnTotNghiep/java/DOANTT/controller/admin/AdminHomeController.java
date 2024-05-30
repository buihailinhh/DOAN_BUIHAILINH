package DOANTT.controller.admin;



import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import DOANTT.dto.Constants;

@RequestMapping(value="/manager")
@Controller
public class AdminHomeController implements Constants {
	@RequestMapping(value = "/home-admin", method = RequestMethod.GET)
	public String signup(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			
			throws IOException {
		
		return "admin/home-admin";
	}

}
