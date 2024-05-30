package DOANTT.controller.admin;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.flow.FinallyFlowContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import DOANTT.dto.Constants;
import DOANTT.dto.ProductSearch;
import DOANTT.model.Category;
import DOANTT.model.Product;
import DOANTT.model.ProductImage;
import DOANTT.model.User;
import DOANTT.service.CategoryService;
import DOANTT.service.ProductImageService;
import DOANTT.service.ProductService;
import DOANTT.service.UserService;


@RequestMapping(value="/manager")
@Controller
public class ProductAdminController implements Constants {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductImageService productImageService;
	
	@RequestMapping( value = "/list-product/{page}", method = RequestMethod.GET)
	public  String  listProduct( final Model model,final HttpServletRequest request,
final HttpServletResponse response,
@PathVariable ("page") int page
) throws IOException{
		
		String keyword = request.getParameter("keyword");
		int categoryId = 0;
		
		
		if(request.getParameter("categoryId") != null && !"0".equals(request.getParameter("categoryId"))) {
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}
			ProductSearch productSearch = new ProductSearch();
			productSearch.setCategoryId(categoryId);
			productSearch.setKeyword(keyword);
			// de phan trang
			int currentPage = page;
			productSearch.setCurrentPage(currentPage);
			productSearch.setSizeOfPage(SIZE_OF_PAGE);
			
			List<Product> products = productService.search(productSearch);
//	List<Product> products = productService.findAll();
			
		model.addAttribute("products", products);
		/*
		 * List<ProductImage> productImages =
		 * productImageService.getImageByProductId(productId);
		 * model.addAttribute("productImages", productImages);
		 */
		
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		
		Integer total = productService.findAll().size();
		model.addAttribute("total", total);
		
		// tính
		int totalPage = total / SIZE_OF_PAGE;
		if(total % SIZE_OF_PAGE >0) {
			totalPage ++;
		}
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage",totalPage);
		
		return "admin/list-product";
	}
	@RequestMapping(value = "/add-product", method = RequestMethod.GET)
	public String addProduct (final Model model, 
			final HttpServletRequest request, 
			HttpServletResponse response) throws IOException{
		model.addAttribute("product", new Product());
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		
		return"admin/add-product";
	}
	
	@RequestMapping(value = "/save-add-product", method = RequestMethod.POST)
	public String saveAddProduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("product") Product product,
			@RequestParam("productAvatar") MultipartFile productAvatar,// lấy file từ form
			@RequestParam("productImages") MultipartFile[] productImages) throws IOException{
	
		if(product.getId() == null || product.getId() <= 0) {// thêm mới
			productService.saveProduct(product, productAvatar, productImages);
		}
		
		return "redirect:/manager/list-product/1";
		
		
	}
	
	@RequestMapping(value = "/edit-product/{productId}" , method = RequestMethod.GET)
	public String editProduct(final Model model, HttpServletRequest request,
			HttpServletResponse response,
			@PathVariable("productId") int productId // Lấy product id khi click Edit
	)throws IOException{
		
		
		List<Category> categories = categoryService.findAll();
		
		model.addAttribute("categories", categories);
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		// lay product co id la productId
		Product product = productService.getById(productId);
		model.addAttribute("product", product);
		
		
		return "admin/edit-product";
	}
	
	@RequestMapping(value = "/save-edit-product", method = RequestMethod.POST)
	public String saveEditProduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("product") Product product,
			@RequestParam("productAvatar") MultipartFile productAvatar,
			@RequestParam("productImages") MultipartFile[] productImages) throws IOException{
	
		if(product.getId() != null || product.getId() >= 0) {// thêm mới
			productService.saveEditProduct(product, productAvatar, productImages);
			
		}
		
		return "redirect:/manager/list-product/1";
		
		
	}
	@RequestMapping(value = "/delete-product/{productId}",method = RequestMethod.GET)
	public String deleteProduct(final Model model,
	         @PathVariable("productId") int productId)// lấy product id khi click delete
			throws IOException{
		Product dbProduct = productService.getById(productId);
		productService.deleteUserById(productId);
		// xoa het  anh trong tbl_product_image va cac file anh tuong ung
		//Product//Image
		List<ProductImage> productImages = productImageService.getImageByProductId(productId);
		for(ProductImage image: productImages) {
			// xóa file ảnh
						String path = FOLDER_UPLOAD + image.getPath();
						File file = new File(path);
						file.delete();
						
					
		}
		// Xóa file avatar  trong thư mục Product/Avatar
		
				String path = FOLDER_UPLOAD + dbProduct.getAvatar();
				File file = new File(path);
				file.delete();
				
				// Xóa product trong tbl_product( các ảnh tương ứng trong tbl_product_image)
				// sẽ tự đọng xóa( do ondelete = CASCADE)
				productService.deleteProduct(dbProduct);
		
		return "redirect:/manager/list-product/1";
		
	}
	
}