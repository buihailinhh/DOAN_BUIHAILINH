package DOANTT.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import DOANTT.dto.Constants;
import DOANTT.dto.ProductSearch;
import DOANTT.model.Category;
import DOANTT.model.Product;
import DOANTT.model.ProductImage;

@Service
public class CategoryService extends BaseService<Category> implements Constants {
	
	@Override
	public Class<Category> clazz() {
		// TODO Auto-generated method stub
		return Category.class;
	}
	@Transactional
	 public void deleteUserById(int categoryIdtId) {
		 // Lấy Category trong DB
		 Category category = super.getById(categoryIdtId);
		 

		 // xóa category trong db
		 super.delete(category);
		 }	 
	
	 @Transactional
	  public Category saveEditCategory(Category category) 
	  throws IOException{
		 // Lấy  product trong database - tbl_product
		 
		Category dbCategory  = super.getById(category.getId());
		 
		 
		  return super.saveOrUpdate(dbCategory);
		 
	  }
	 public List<Category> search(ProductSearch productSearch) {
		    // Tạo câu lệnh truy vấn
		    String sql = "SELECT * FROM tbl_category p WHERE 1=1";

		    // Tìm kiếm theo category
		    if (productSearch.getCategoryId() > 0) {
		        sql += " AND p.category_id=" + productSearch.getCategoryId();
		    }

		    // Tìm kiếm theo keyword
		    if (!StringUtils.isEmpty(productSearch.getKeyword())) {
		        sql += " AND (LOWER(p.name) COLLATE utf8mb4_vietnamese_ci LIKE '%" + productSearch.getKeyword().toLowerCase() + "%' COLLATE utf8mb4_vietnamese_ci" +
		                " OR LOWER(p.short_description) COLLATE utf8mb4_vietnamese_ci LIKE '%" + productSearch.getKeyword().toLowerCase() + "%' COLLATE utf8mb4_vietnamese_ci)";
		    }
		    
		    if (productSearch.getMinPrice() != -1 && productSearch.getMaxPrice() != 1) {
		    	sql += " AND p.sale_price BETWEEN " + productSearch.getMinPrice() + " AND " + productSearch.getMaxPrice();
		    }

		    // Gắn kết quả từ câu truy vấn vào danh sách sản phẩm
//		    return super.executeNativeSql(sql);
		    return super.executeNativeSql(sql, productSearch.getCurrentPage(), productSearch.getSizeOfPage());
		}

}
