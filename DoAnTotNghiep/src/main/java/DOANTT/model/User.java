package DOANTT.model;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.*;


@Entity
@Table(name = "tbl_user")
public class User extends BaseModel implements UserDetails {

    @Column(name = "username", length = 120, nullable = false)
    private String username;

    @Column(name = "password", length = 120, nullable = false)
    private String password;
    
    @Column(name = "name", length = 120, nullable = true)
    private String name;
    
    @Column(name = "mobile", length = 20, nullable = true)
    private String mobile;
    
    @Column(name = "address", length = 300, nullable = true)
    private String address;
    
    @Column(name = "email", length = 120, nullable = true)
    private String email;

    @Column(name = "description", length = 200, nullable = true)
    private String description;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
    private final Set<SaleOrder> saleOrders = new HashSet<SaleOrder>();
    // Handling many-to-many relationship: Mapping data fields user -> role
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "users")
    private final List<Role> roles = new ArrayList<Role>();

    public User() {
        super();
    }

    

    public User(String username, String password, String name, String mobile, String address, String email,
			String description) {
		super();
		this.username = username;
		this.password = password;
		this.name = name;
		this.mobile = mobile;
		this.address = address;
		this.email = email;
		this.description = description;
	}



	// Handling one-to-many relationship: Add and remove data contained
    // relational-list
    public void addRelationalSaleOrder(SaleOrder saleOrder) {
        saleOrders.add(saleOrder);
        saleOrder.setUser(this);
    }

    public void deleteRelationalSaleOrder(SaleOrder saleOrder) {
        saleOrders.remove(saleOrder);
        saleOrder.setUser(null);
    }

    public void addRole(Role role) {
        role.getUsers().add(this);
        roles.add(role);
    }

    public void deleteRole(Role role) {
        role.getUsers().remove(this);
        roles.remove(role);
    }

  

    public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getMobile() {
		return mobile;
	}



	public void setMobile(String mobile) {
		this.mobile = mobile;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public Set<SaleOrder> getSaleOrders() {
		return saleOrders;
	}



	public List<Role> getRoles() {
		return roles;
	}



	@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // TODO Auto-generated method stub
        return this.roles;
    }

    @Override
    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isEnabled() {
        // TODO Auto-generated method stub
        return true;
    }


}
