 package DOANTT.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import DOANTT.model.User;
import DOANTT.service.CategoryService;
import DOANTT.service.UserService;


@RequestMapping(value="/manager")
@Controller
public class CategoryAdminController implements Constants  {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private UserService userService;
	 @RequestMapping(value = "/list-category/{page}", method= RequestMethod.GET)
	 
	 public String listCategory(final Model model,
			                    final HttpServletRequest request,
			                    final HttpServletResponse response,
			                    @PathVariable("page")int page
			                    )throws IOException{
		 List<Category> categories = categoryService.findAll();
		 
		 ProductSearch productSearch = new ProductSearch();
		 
		 // phân trang
		 int currentPage = page;
		 productSearch.setCurrentPage(currentPage);
		 productSearch.setSizeOfPage(SIZE_OF_PAGE);
		 
		 
		 Integer total = categoryService.findAll().size();
		 model.addAttribute("total", total);
		 
		 int totalPage = total/SIZE_OF_PAGE;
		 if(total % SIZE_OF_PAGE > 0) {
			 totalPage++;
		 }
		 
		 
		 model.addAttribute("categories", categories);
		 model.addAttribute("currentPage", currentPage);
		 model.addAttribute("totalPage", totalPage);
		 
		 return "admin/list-category";
	 }
	 
	 @RequestMapping(value = "/add-category", method = RequestMethod.GET)
		public String addCategory(final Model model, final HttpServletRequest request,
				final HttpServletResponse response) throws IOException {
			
			model.addAttribute("category", new Category());
			
		    List<User> users = userService.findAll();
			model.addAttribute("users", users);
			
			return "admin/add-category";
		}
	 @RequestMapping(value = "/add-category", method = RequestMethod.POST)
		public String saveCategory(final Model model, final HttpServletRequest request,
				final HttpServletResponse response,
				@ModelAttribute("category") Category category
				) throws IOException {
			
			categoryService.saveOrUpdate(category);
			
			return "redirect:/manager/list-category";
		}
	 
	 @RequestMapping(value="/edit-category/{categoryId}", method= RequestMethod.GET)
	 public String editCategory(final Model model, final HttpServletRequest request,
			 HttpServletResponse response, @PathVariable("categoryId") int categoryId
			 )throws IOException{
		  List<User> users = userService.findAll();
			model.addAttribute("users", users);
			Category category = categoryService.getById(categoryId);
			model.addAttribute("category", category);
			
		 return"admin/edit-category";
	 }
	 @RequestMapping(value="/save-edit-category", method= RequestMethod.POST)
	 public String saveEditCategory(final Model model, HttpServletRequest request,
			 HttpServletResponse response,
			 @ModelAttribute("category") Category category)throws IOException{
		 if(category.getId() != null || category.getId() >=0) {
			 
			 categoryService.saveEditCategory(category);
			 
		 }
		
		 return"redirect:/manager/list-category";
	 }
	 
	 @RequestMapping(value = "/delete-category/{categoryId}",method = RequestMethod.GET)
		public String deleteProduct(final Model model,
		         @PathVariable("categoryId") int categoryId 
		         )// lấy product id khi click delete
				throws IOException{
			categoryService.deleteUserById(categoryId);
			// xoa het  anh trong tbl_product_image va cac file anh tuong ung
			//Product//Image
			
			return "redirect:/manager/list-category/1";
			
		}
	 
	
}
	 


