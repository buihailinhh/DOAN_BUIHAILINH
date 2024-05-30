package DOANTT.controller.user;

import java.io.IOException;
import java.math.BigInteger;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import DOANTT.dto.Cart;
import DOANTT.dto.ProductSearch;
import DOANTT.model.Category;
import DOANTT.model.Product;
import DOANTT.model.ProductImage;
import DOANTT.service.CategoryService;
import DOANTT.service.HomeSevice;
import DOANTT.service.ProductImageService;
import DOANTT.service.ProductService;







@Controller
public class HomeController   {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductImageService productImageService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private HomeSevice homeSevice;
	
	
	//Controller handle action name home
	
    
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	
	// requestMapping: dùng để ánh xạ
	public String home(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response
			) throws IOException {
		
		ProductSearch productSearch = new ProductSearch();
		// tìm theo keyword
		String keyword = request.getParameter("keyword");
		productSearch.setKeyword(keyword);
		
		try {
			Integer categoryID = Integer.parseInt(request.getParameter("categoryId"));
			productSearch.setCategoryId(categoryID);
		} catch (Exception e) {
			//
		}
		
		try {
			String price = request.getParameter("price");
			String[] priceSplit = price.split("-");
			productSearch.setMinPrice(Double.parseDouble(priceSplit[0]) * 1000000);
			productSearch.setMaxPrice(Double.parseDouble(priceSplit[1]) * 1000000);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		List<Product> products = productService.search(productSearch);
		model.addAttribute("products", products);
		
		BigInteger totalCartProducts = BigInteger.ZERO;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("cart") != null ) {
			Cart cart = (Cart) session.getAttribute("cart");
			totalCartProducts = cart.totalCartProducts();
		}
		model.addAttribute("totalCartProducts", totalCartProducts);
	
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
	
		return "user/home";
	}
	
	@RequestMapping(value = "/sanpham/{id}", method = RequestMethod.GET) 
	 public String sanpham(final Model model, final HttpServletRequest request, final
	 HttpServletResponse response, @PathVariable(name="id") int id ) throws IOException { //TODO: 1. Get data form
	 //DB hoac Post data into DB
		Product product = productService.getById(id);
	//	System.out.println(product.getName());
		model.addAttribute("product", product);
		
		// lấy danh sách ảnh trong tnl_product_image
	List<ProductImage> productImages = productImageService.getImageByProductId(id);
	model.addAttribute("productImages",productImages);
		return"user/sanpham";
	 }
	
	@RequestMapping(value = "/lienhe", method = RequestMethod.GET) 
	 public String lienhe(final Model model, final HttpServletRequest request, final
	 HttpServletResponse response ) throws IOException { //TODO: 1. Get data form
	 //DB hoac Post data into DB
		return"user/lienhe";
	 }
	
	@RequestMapping(value = "/contact-sent", method = RequestMethod.POST) 
	 public String contact(final Model model, final HttpServletRequest request, final
	 HttpServletResponse response ) throws IOException {
		String yourName = request.getParameter("your-name");
		String email = request.getParameter("email");
		String message = request.getParameter("message");
		
		homeSevice.sendVerificationEmail(yourName, email, message);
		
		return "redirect:/home";
	 }
	
}
