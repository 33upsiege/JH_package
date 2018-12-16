package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.StockDAO;
import com.dto.Stock;

@Service
public class StockService {


	@Autowired
 	StockDAO dao;
	
	public List<Stock> Stock_list(){
		return dao.Stock_list();
	}
	
	public int Stock_Modify(Stock so) {
		return dao.Stock_Modify(so);
	}
	
	public int Stock_Modify_plus(Stock so) {
		return dao.Stock_Modify_plus(so);
	}
	
	public int Stock_Delete(Stock so) {
		return dao.Stock_Delete(so);
	}
	
	public int Stock_Insert(Stock so) {
		return dao.Stock_Insert(so);
	}
	
	public int Stock_Minimum_amount_modify(Stock so) {
		return dao.Stock_Minimum_amount_modify(so);
	}
}
