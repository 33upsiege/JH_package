package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MysqlSessionFactory;
import com.dao.CarDAO;
import com.dao.ReservationDAO;
import com.dao.ShopDAO;
import com.dto.CarDTO;
import com.dto.ShopDTO;

public class ShopService {
	
	private ShopDAO dao;
	public ShopService() {
		dao = new ShopDAO();
	}



	public ShopDTO getShopList(ShopDTO shopDTO) {
		SqlSession session = MysqlSessionFactory.getSession();
		ShopDTO dto = null;
		try {
			dto = dao.getShopList(session, shopDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		} 
		return dto;
	}



}
