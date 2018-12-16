package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.Stock;

@Repository
public class StockDAO {


	@Autowired
	SqlSessionTemplate template;
	
	public List<Stock> Stock_list(){
		List<Stock> list = template.selectList("StockMapper.Stock_list");
		return list;
	}
	
	public int Stock_Modify(Stock so) {
		int n = template.update("StockMapper.Stock_modify",so);
		return n;
	}
	
	public int Stock_Modify_plus(Stock so) {
		int n = template.update("StockMapper.Stock_Modify_plus",so);
		return n;
	}
	
	public int Stock_Delete(Stock so) {
		int n = template.update("StockMapper.Stock_Delete",so);
		return n;
	}
	
	public int Stock_Insert(Stock so) {
		int n = template.update("StockMapper.Stock_Insert",so);
		return n;
	}
	
	public int Stock_Minimum_amount_modify(Stock so) {
		int n = template.update("StockMapper.Stock_Minimum_amount_modify",so);
		return n;
	}
	
}

