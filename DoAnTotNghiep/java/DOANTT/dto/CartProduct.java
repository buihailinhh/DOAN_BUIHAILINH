package DOANTT.dto;

import java.math.BigDecimal;
import java.math.BigInteger;

public class CartProduct {
	private int productId;
	private String name;
	private String avatar;
	private BigInteger quantity;
	private BigDecimal price;
	
	// tisnh thanh tien
	public BigDecimal totalPrice() {
		if(this.price == null ||this.quantity==null) {
			return BigDecimal.ZERO;
		}
		return this.price.multiply(new BigDecimal(this.quantity));
	}
	
	
	public CartProduct() {
		super();
	}
	public CartProduct(int productId, String name, String avatar, BigInteger quantity, BigDecimal price) {
		super();
		this.productId = productId;
		this.name = name;
		this.avatar = avatar;
		this.quantity = quantity;
		this.price = price;
	}
	public BigInteger getQuantity() {
		return quantity;
	}


	public void setQuantity(BigInteger quantity) {
		this.quantity = quantity;
	}


	public int getProductId() {
		return productId;
	}
	public void setProductId(int produtId) {
		this.productId = produtId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
	
	

}
