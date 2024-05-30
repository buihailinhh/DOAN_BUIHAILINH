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

import DOANTT.model.SaleOrder;
import DOANTT.service.SaleOrderService;
@RequestMapping(value="/manager")

@Controller
public class OrderAdminController {
	@Autowired
	private SaleOrderService saleOrderService;
	
	@RequestMapping(value = "/list-order", method = RequestMethod.GET) 
	public String listOrder(final Model model, final HttpServletRequest request, final
	  HttpServletResponse response) throws IOException {
	 
	 List<SaleOrder> orders = saleOrderService.findAll();
	 
	 model.addAttribute("orders", orders); 

	 Integer total = saleOrderService.findAll().size();
	 model.addAttribute("total", total);
	 
	 
	 return "admin/list-order"; 
	 }
	@RequestMapping(value = "/delete-Order/{saleOrderId}",method = RequestMethod.GET)
	public String deleteProduct(final Model model,
	         @PathVariable("saleOrderId") int saleOrderId 
	         )// lấy product id khi click delete
			throws IOException{
		saleOrderService.deleteOrderById(saleOrderId);
		// xoa het  anh trong tbl_product_image va cac file anh tuong ung
		//Product//Image
		
		return "redirect:/manager/list-category";

}
}
