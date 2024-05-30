package DOANTT.controller.formdemo;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.annotation.JsonAlias;

import DOANTT.dto.Constants;
import DOANTT.dto.Customer;


@Controller

public class SignupsfController implements Constants{
	@RequestMapping (value="/signup-sf" ,method= RequestMethod.GET)
	public String signupAccount( final Model model, final HttpServletRequest request, HttpServletResponse response) {
		
      model.addAttribute("customer", new Customer());
		return "/formdemo/signup-sf";
	}
	
	@RequestMapping (value = "/customer-list-sf" , method = RequestMethod.POST)
	public String saveCustomer(final Model model , final HttpServletRequest request,
			HttpServletResponse response,
			
			@ModelAttribute("customer") Customer customer) { // hứng dữ liệu từ spring form
		
		model.addAttribute("customer", customer);// đẩy lên view customer-list-sf
			
		return "formdemo/customer-list-sf";
	}
	@RequestMapping(value="/customer-edit-sf", method= RequestMethod.GET)
	public String customerEditSf(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		Customer customer = new Customer("Leo Messi", "123", "Messi", "leo@1234", false);
		model.addAttribute("customer", customer);
				
				
		return"formdemo/customer-edit-sf";
	}
	
	@RequestMapping(value = "/customer-edit-ajax-sf", method= RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> saveEditAjax(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			final @RequestBody Customer customer) throws IOException{
		
		Map<String , Object> jsolResult = new HashMap<String, Object>();
		jsolResult.put("code", 200);
		jsolResult.put("message", "Thông tim đã được lưu: " + customer.getTxtAccount());
		
		return ResponseEntity.ok(jsolResult);
	}

}
