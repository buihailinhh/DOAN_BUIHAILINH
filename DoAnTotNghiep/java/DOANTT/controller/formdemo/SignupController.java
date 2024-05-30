package DOANTT.controller.formdemo;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import DOANTT.controller.BaseController;


@Controller
public class SignupController extends BaseController {
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signAccount (final Model model, final HttpServletRequest request, HttpServletResponse response)
 throws IOException{
		return"formdemo/signup";
	}
	
 
}
