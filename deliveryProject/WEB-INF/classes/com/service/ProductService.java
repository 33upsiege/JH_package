package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.NoticeDAO;
import com.dao.ProductDAO;
import com.dao.StockDAO;
import com.dto.Notice;
import com.dto.Product;
import com.dto.Stock;

@Service
public class ProductService {

   @Autowired
    ProductDAO dao;
   
   public List<Product> product_list(){
      return dao.product_list();
   }
   
   public List<Product> getProduct(String tabName) {
		// TODO Auto-generated method stub
		 return dao.getProduct(tabName);
	}
	public List<Product> getProductRecommend() {
		return dao.getProductRecommend();
	}


	public List<Product> getProductCode(String menu_code) {
		return dao.getProductCode(menu_code);
	}


}