package DOANTT.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import DOANTT.dto.Constants;
import DOANTT.dto.ProductSearch;
import DOANTT.model.Product; 
import DOANTT.model.ProductImage;

@Service
public class ProductService extends BaseService<Product> implements Constants {
	@Override
	public Class<Product> clazz(){
		return Product.class;
	}
	
	public List<Product> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_product WHERE status=1");
		//tao cau lenh truy van
	}
	public List<Product> search(ProductSearch productSearch) {
	    // Tạo câu lệnh truy vấn
	    String sql = "SELECT * FROM tbl_product p WHERE 1=1";

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
//	    return super.executeNativeSql(sql);
	    return super.executeNativeSql(sql, productSearch.getCurrentPage(), productSearch.getSizeOfPage());
	}
	// kiểm tra người dùng có upload Avatar k?
	public boolean isEmptyUploadAvatar(MultipartFile avatarFile) {
		if(avatarFile == null || avatarFile.getOriginalFilename().isEmpty()) {
			return true;// không upload
		}
		return false;
	}
	// kiểm tra người dùng có upload Image k?
	public boolean isEmptyUploadImages(MultipartFile[]  imageFile) { 
		if(imageFile == null || imageFile.length <= 0) {
			return true;
		}
		if( imageFile.length == 1 && imageFile[0].getOriginalFilename().isEmpty()) {
			return true;
		}
		return false;
		
	}
	 @Transactional
	  public Product saveProduct(Product product, MultipartFile avatarFile, MultipartFile[] imageFiles) 
	  throws IOException{
		  String path;
		  // luu avatar
		  if(!isEmptyUploadAvatar(avatarFile)) {
			  // Lưu file vào thư mục "Product/Avatar"
			  path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			  avatarFile.transferTo(new File(path));
			  
			  // Lưu đường dẫn vào DB 
			 product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		  }
		  //Lưu các images
		  if(!isEmptyUploadImages(imageFiles)) {
			  for(MultipartFile x : imageFiles) {
				  if(!x.isEmpty()) {
				
				  // Lưu file vào thư mục "Product/Image"
				  path= FOLDER_UPLOAD + "Product/Image/" + x.getOriginalFilename();
				  x.transferTo(new File(path));
				  
				  ProductImage productImage = new ProductImage();
				  productImage.setTitle(x.getOriginalFilename());
				  productImage.setPath("Product/Image/" + x.getOriginalFilename());
				  product.addRelationalProductImage(productImage);
			  }
		  }
		  }
		  
		  return super.saveOrUpdate(product);
		 
	  }
	 
	 
	 @Transactional
	  public Product saveEditProduct(Product product, MultipartFile avatarFile, MultipartFile[] imageFiles) 
	  throws IOException{
		 // Lấy  product trong database - tbl_product
		 
		 
		  String path;
		 Product dbProduct = super.getById(product.getId());
		 
		  // Kiểm tra người dùng có up avatar k ?
		  if(!isEmptyUploadAvatar(avatarFile)) {// có
			  
			  // xóa avata cũ
			  File file = new File(FOLDER_UPLOAD + dbProduct.getAvatar());
			  file.delete();
			  
			  
			  
			  // Lưu avatar mới vào thư mục "Product/Avatar"
			  path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			  avatarFile.transferTo(new File(path));
			  
			  // Lưu đường dẫn vào DB 
			 product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		  }
		  else {// người dùng không upload avatar mới
			  product.setAvatar(dbProduct.getAvatar());// giữ avatar cũ
			  
			  
		  }
		  //Lưu các images
		  if(!isEmptyUploadImages(imageFiles)) {
			  for(MultipartFile x : imageFiles) {
				  if(!x.isEmpty()) {
				
				  // Lưu file vào thư mục "Product/Image"
				  path= FOLDER_UPLOAD + "Product/Image/" + x.getOriginalFilename();
				  x.transferTo(new File(path));
				  
				  ProductImage productImage = new ProductImage();
				  productImage.setTitle(x.getOriginalFilename());
				  productImage.setPath("Product/Image/" + x.getOriginalFilename());
				  product.addRelationalProductImage(productImage);
			  }
		  }
		  }
		  
		  return super.saveOrUpdate(product);
		 
	  }
	 
	 // Delete product
	 
	 @Autowired
	 private ProductImageService productImageService;
	 @Transactional
	 public void deleteUserById(int productId) {
		 // Lấy Product trong DB
		 Product product = super.getById(productId);
		 
		     //+ Lấy danh sách ảnh product trong tbl_product_image
		 String sql = "SELECT * FROM tbl_product_image WHERE product_id= " + productId;
		 List<ProductImage> productImages = productImageService.executeNativeSql(sql);
		 
		// xóa lân lượt các ảnh  cua product trong Product/Image
		 // xóa lần lượt các đường dẫn trong tbl_product_image
		 
		 for(ProductImage productImage: productImages) {
			 // xóa file trong thư mục Product image(trước)
			 String path = FOLDER_UPLOAD+ productImage.getPath();
			 File file = new File(path);
			 file.delete();
			 
			 // xóa bản ghi thông tin  ảnh trong tbl_product_image
//			 product.deleteRelationalProductImage(productImage);
		 }
		 // xóa  file avatar trong thư mục Product/avatar
		 
		 String path = FOLDER_UPLOAD+ product.getAvatar();
		 File file = new File(path);
		 file.delete();
		 
		 // xóa product trong db
		 super.delete(product);
		 }	 
	 @Transactional
		public void deleteProduct(Product product) {
			super.delete(product);
		}


}
