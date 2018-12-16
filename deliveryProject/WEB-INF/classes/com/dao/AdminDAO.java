package com.dao;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.dto.Menu;
import com.dto.OrderInformationList;
import com.dto.OrderMember;
import com.dto.OrderNotice;
import com.dto.SalesList;
import com.dto.StockList;
import com.dto.Upload;


@Repository
public class AdminDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public List<OrderNotice> getOrderNotice() {
		return template.selectList("NoticeMapper.getOrderNotice");
				
	}

	public List<StockList> getStockNotice() {
		return template.selectList("NoticeMapper.getStockNotice");
	}

	public OrderMember getUserMail(OrderInformationList orderInfo) {
		
		String memberId = template.selectOne("UserMapper.getUserId", orderInfo.getOrderCode());
		HashMap<String, String> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("orderCode", orderInfo.getOrderCode());
		System.out.println("daomap"+map);
		
		OrderMember orderMember = new OrderMember();
		if(memberId.contains("@")) {
			orderMember = template.selectOne("UserMapper.getGUserMail",map);
			System.out.println("dao@ "+orderMember);
		}else { 
			orderMember = template.selectOne("UserMapper.getUserMail",map);
			System.out.println("dao222 "+orderMember);
		}
		return orderMember;
	}
	
	public int updateOrderStatus(OrderInformationList orderInfo) {
		return template.update("NoticeMapper.updateOrderStatus", orderInfo);
	}
	
	public List<StockList> addMenuForm() {
		return template.selectList("StockMapper.addMenuForm");
	}

	public int addMenu(Menu menu) {
		return template.insert("StockMapper.addMenu", menu);
	}

	public List<Menu> menuList(String category) {
		return template.selectList("StockMapper.menuList", category);
	}

	public int delMenu(String mCode) {
		return template.delete("StockMapper.delMenu", mCode);
	}
	

	
}
