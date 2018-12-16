package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.AdminDAO;
import com.dto.Menu;
import com.dto.OrderInformationList;
import com.dto.OrderMember;
import com.dto.OrderNotice;
import com.dto.SalesList;
import com.dto.StockList;

@Service
public class AdminService {

	@Autowired
	AdminDAO dao;
	
	public List<OrderNotice> getOrderNotice(){
		return dao.getOrderNotice();
	}

	public List<StockList> getStockNotice() {
		return dao.getStockNotice();
	}
	/*
	public OrderMember getUserMail(OrderInformationList orderInfo) {
		return dao.getUserMail(orderInfo);
	}

	public int updateOrderStatus(OrderInformationList orderInfo) {
		return dao.updateOrderStatus(orderInfo);
	}
	*/
	
	
	//트랜잭션
	@Transactional
	public OrderMember tran(OrderInformationList orderInfo) {
		//orderCode , member_id => 변수에 담기(dto)
		OrderMember orderMember = dao.getUserMail(orderInfo);
		//System.out.println(map);
		//위에서 담은 dto를 파라미터로 같이 전달
		dao.updateOrderStatus(orderInfo);
		return orderMember;
	}

	public List<StockList> addMenuForm() {
		return dao.addMenuForm();
	}

	public int addMenu(Menu menu) {
		return dao.addMenu(menu);
	}

	public List<Menu> menuList(String category) {
		return dao.menuList(category);
	}

	public int delMenu(String mCode) {
		return dao.delMenu(mCode);
	}
}
