package DOANTT.controller.admin;



import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import DOANTT.dto.Constants;

import DOANTT.model.SaleOrder;
import DOANTT.model.SaleOrderProduct;
import DOANTT.model.User;
import DOANTT.service.SaleOrderProductService;
import DOANTT.service.SaleOrderService;
import DOANTT.service.UserService;


@RequestMapping(value="/manager")
@Controller

public class AdminHomeController implements Constants {
	
	
	@Autowired
	private SaleOrderProductService  saleOrderProductService;
	@Autowired 
	private UserService userService;
	@Autowired SaleOrderService saleOrderService;
	
	@RequestMapping(value = "/home-admin", method = RequestMethod.GET)
	public String signup(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			
			throws IOException {
		// Thống kê sản phẩm đã bán theo số lượng
				List<SaleOrderProduct> saleOrderProducts = saleOrderProductService.findAllActive();
				int totalProducts = 0;
				for (SaleOrderProduct saleOrderProduct : saleOrderProducts) {
					totalProducts += saleOrderProduct.getQuantity();
				}

				model.addAttribute("totalProducts", totalProducts);
				
				// só don hang
				List<SaleOrder> saleOrders = saleOrderService.findAllActive();
				int orders = saleOrders.size();
				model.addAttribute("orders", orders);
				
				// Tính tổng doanh số bán hàng
				BigDecimal totalSales = BigDecimal.ZERO;

				// Duyệt qua danh sách đơn hàng và cộng dồn giá trị total của mỗi đơn
				

				for (SaleOrder saleOrder : saleOrders) {
					BigDecimal orderTotal;

					if (saleOrder.getTotal() == null) {
						orderTotal = BigDecimal.ZERO;
					} else {
						orderTotal = saleOrder.getTotal();
					}

					totalSales = totalSales.add(orderTotal);
				}
				// Thêm totalSales vào model
				model.addAttribute("totalSales", totalSales);

				// Thống kê khách hàng - admin trong user
				List<User> users = userService.findAllActive();
				int visitors = users.size();
				model.addAttribute("visitors", visitors);
				
				// ĐANG LÀM DỞ ĐOẠN NÀY - LẤY THÔNG TIN VẼ BIỂU ĐỒ VỚI THÁNG NĂM
				
				int monthChart, yearChart;
				if (request.getParameter("month-chart") == null) {
					monthChart = 1;
				} else {
					monthChart = Integer.parseInt(request.getParameter("month-chart"));
				}
				if (request.getParameter("year-chart") == null) {
					yearChart = 2020;
				} else {
					yearChart = Integer.parseInt(request.getParameter("year-chart"));
				}
				
				System.out.println(monthChart + " - " + yearChart);
		
		return "admin/home-admin";
	}
}
