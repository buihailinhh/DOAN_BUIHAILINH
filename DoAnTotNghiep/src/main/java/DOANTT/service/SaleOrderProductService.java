package DOANTT.service;

import java.util.List;

import org.springframework.stereotype.Service;

import DOANTT.model.Product;
import DOANTT.model.SaleOrder;
import DOANTT.model.SaleOrderProduct;


	@Service
	public class SaleOrderProductService extends BaseService<SaleOrderProduct> {
		@Override
		public Class<SaleOrderProduct> clazz() {
			// TODO Auto-generated method stub
			return SaleOrderProduct.class;
		}
		public List<SaleOrderProduct> findAllActive() {
			return super.executeNativeSql("SELECT * FROM tbl_sale_order_product WHERE status=1");
			//tao cau lenh truy van
		}

	}
