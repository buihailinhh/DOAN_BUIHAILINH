package DOANTT.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import DOANTT.model.Category;
import DOANTT.model.Product;
import DOANTT.model.ProductImage;

@Service
public class CategoryService extends BaseService<Category> {
	
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

}
