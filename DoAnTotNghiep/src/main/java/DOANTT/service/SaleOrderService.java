package DOANTT.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import DOANTT.dto.ProductSearch;
import DOANTT.model.Category;
import DOANTT.model.SaleOrder;


@Service
public class SaleOrderService extends BaseService<SaleOrder> {
	@Override
	public Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}
	
	public List<SaleOrder> findAllActive(){
		return super.executeNativeSql("Select * From tbl_sale_order WHERE status = 1");
	}
	public List<SaleOrder> getOrdersByUserId(int userId) {
		return super.executeNativeSql("SELECT * FROM tbl_sale_order WHERE user_id = " + userId);
	}
	@Transactional
	public SaleOrder saveOrder(SaleOrder saleOrder) {
		return super.saveOrUpdate(saleOrder);
	}
	@Transactional
	 public void deleteOrderById(int saleOrderId) {
		 // Lấy Category trong DB
		SaleOrder saleOrder = super.getById(saleOrderId);
		 

		 // xóa category trong db
		 super.delete(saleOrder);
		 }	 
	
	

	/*
	 * public List<SaleOrder> search(ProductSearch saleOrderSearch) {
	 * 
	 * String sql = "SELECT * FROM tbl_sale_order s WHERE 1=1";
	 * 
	 * if (saleOrderSearch.getStatus() < 2 && saleOrderSearch.getStatus() > -1) {
	 * sql += " AND s.status=" + saleOrderSearch.getStatus(); }
	 * 
	 * if (!StringUtils.isEmpty(saleOrderSearch.getKeyword())) { sql +=
	 * " AND (s.code='" + saleOrderSearch.getKeyword() + "'" +
	 * " OR s.customer_name like '%" + saleOrderSearch.getKeyword() + "%'" +
	 * " OR s.customer_address like '%" + saleOrderSearch.getKeyword() + "%'" +
	 * " OR s.customer_mobile like '%" + saleOrderSearch.getKeyword() + "%'" +
	 * " OR s.customer_email like '%" + saleOrderSearch.getKeyword() + "%')"; }
	 * 
	 * String bDate = saleOrderSearch.getBeginDate(); String eDate =
	 * saleOrderSearch.getEndDate(); if (bDate != null && eDate != null) { eDate =
	 * eDate + " 23:59:59"; sql += " AND (s.create_date BETWEEN '" + bDate +
	 * "' AND '" + eDate + "')"; } System.out.println("sql: " + sql); return
	 * super.executeNativeSql(sql); // return super.executeNativeSql(sql,
	 * saleOrderSearch.getCurrentPage(), saleOrderSearch.getSizeOfPage()); }
	 */
}
