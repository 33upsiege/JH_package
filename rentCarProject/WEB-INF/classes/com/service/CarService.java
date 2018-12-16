package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MysqlSessionFactory;
import com.dao.CarDAO;
import com.dao.ReservationDAO;
import com.dto.CarDTO;

public class CarService {
	
	private CarDAO dao;
	public CarService() {
		dao = new CarDAO();
	}


	public List<CarDTO> carAllList(CarDTO dto) {
		SqlSession session = MysqlSessionFactory.getSession();
		List<CarDTO> list = null;
		try {
			list = dao.carAllList(session, dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		} 
		return list;
	}

}
