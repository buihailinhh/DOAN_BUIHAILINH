package DOANTT.dto;

public class Customer {
	// các thuộc tính của class  này phải trùng với name của input form   
	private String txtAccount;
	private String txtMobile;
	private String password;
	private String txtName;
	private String txtEmail;
	private boolean remember;
	
	public Customer() {
		super();
	}
	
	public Customer(String txtAccount, String password,String txtMobile, String txtName, String txtEmail, boolean remember) {
		super();
		this.txtAccount = txtAccount;
		this.txtMobile= txtMobile;
		this.password = password;
		this.txtName = txtName;
		this.txtEmail = txtEmail;
		this.remember = remember;
	}

	public String getTxtAccount() {
		return txtAccount;
	}
	public void setTxtAccount(String txtAccount) {
		this.txtAccount = txtAccount;
	}
	public String getTxtMobile() {
		return txtMobile;
	}
	public void setTxtMobile(String txtMobile) {
		this.txtMobile = txtMobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTxtName() {
		return txtName;
	}
	public void setTxtName(String txtName) {
		this.txtName = txtName;
	}
	public String getTxtEmail() {
		return txtEmail;
	}
	public void setTxtEmail(String txtEmail) {
		this.txtEmail = txtEmail;
	}
	public boolean isRemember() {
		return remember;
	}
	public void setRemember(boolean remember) {
		this.remember = remember;
	}
	

}
