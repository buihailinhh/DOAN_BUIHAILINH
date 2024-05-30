package DOANTT.model;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_sale_order")


public class SaleOrder extends BaseModel {
    @Column(name = "code", length = 45, nullable = false)
    private String code;
    @Column(name = "total", nullable = false)
    private BigDecimal total = BigDecimal.ZERO;

    @Column(name = "customer_Name", length = 100, nullable = true)
    private String customerName;

    @Column(name = "customer_Address", length = 200, nullable = true)
    private String customerAddress;

    @Column(name = "customer_Mobile", length = 100, nullable = true)
    private String customerMobile;

    @Column(name = "customer_Email", length = 100, nullable = true)
    private String customerEmail;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    //Mapping many-to-one: product-to-category

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "saleOrder")
    private Set<SaleOrderProduct> saleOrderProducts = new HashSet<SaleOrderProduct>();

    //Phuong thuc them va xoa phan tu trong danh sach quan he category-product
    public void addRelationalSaleOrderProduct(SaleOrderProduct saleOrderProduct) {
        saleOrderProducts.add(saleOrderProduct);
        saleOrderProduct.setSaleOrder(this);
    }

    public void deleteRelationalSaleOrderProduct(SaleOrderProduct saleOrderProduct) {
        saleOrderProducts.remove(saleOrderProduct);
        saleOrderProduct.setSaleOrder(null);
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerMobile() {
        return customerMobile;
    }

    public void setCustomerMobile(String customerMobile) {
        this.customerMobile = customerMobile;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public Set<SaleOrderProduct> getSaleOrderProducts() {
        return saleOrderProducts;
    }

    public void setSaleOrderProducts(Set<SaleOrderProduct> saleOrderProducts) {
        this.saleOrderProducts = saleOrderProducts;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


}
