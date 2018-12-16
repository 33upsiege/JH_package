package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.Notice;
import com.dto.Product;
import com.dto.Stock;

@Repository
public class ProductDAO {

   @Autowired
   SqlSessionTemplate template;
   
   public List<Product> product_list(){
      List<Product> list = template.selectList("ProductMapper.productlist");
      return list;
   }
   
   public List<Product> getProduct(String tabName) {
		// TODO Auto-generated method stub
		return template.selectList("ProductMapper.getProduct",tabName);
	}
	
	public List<Product> getProductRecommend() {
		return template.selectList("ProductMapper.getProductRecommend");
	}

	public List<Product> getProductCode(String menu_code) {
		return template.selectList("ProductMapper.getProductCode",menu_code);
	}
  

}