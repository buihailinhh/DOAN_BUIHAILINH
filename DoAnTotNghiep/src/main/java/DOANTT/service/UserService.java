package DOANTT.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import DOANTT.model.User;

@Service
public class UserService extends BaseService<User>{
	
	@Override
	public Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}
	
	  public List<User> findAllActive() {
	 return  super.executeNativeSql("SELECT * FROM tbl_user WHERE status=1"); //tao cau
	  }
	 
	/*
	 * @Transactional public void deleteUserById(int id) { super.deleteById(); }
	 */
	
	

}
