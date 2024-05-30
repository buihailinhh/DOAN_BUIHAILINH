package DOANTT.dto;

public class ProductSearch {
	private String keyword;
	private int categoryId;
	private int page;
	private int currentPage;
	private int sizeOfPage;
	private double minPrice;
	private double maxPrice;
	public ProductSearch() {
		this.keyword = null;
		this.categoryId = 0;
		this.page = 0;
		this.currentPage = 0;
		this.sizeOfPage = 0;
		this.minPrice = -1;
		this.maxPrice = -1;
	}
	public double getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(double minPrice) {
		this.minPrice = minPrice;
	}
	public double getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(double maxPrice) {
		this.maxPrice = maxPrice;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getSizeOfPage() {
		return sizeOfPage;
	}
	public void setSizeOfPage(int sizeOfPage) {
		this.sizeOfPage = sizeOfPage;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	
}
