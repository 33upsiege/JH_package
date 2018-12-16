package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MysqlSessionFactory;
import com.dao.CarDAO;
import com.dao.ReservationDAO;
import com.dto.CarDTO;
import com.dto.MyRentCheckPageDTO;
import com.dto.ReservationDTO;

public class ReservationService {
	
	
	private ReservationDAO dao;
	public ReservationService() {
		dao = new ReservationDAO();
	}


	public int insertOrder(ReservationDTO reservDTO, String carid) {
		SqlSession session = MysqlSessionFactory.getSession();
		int result = 0;
		try {
			result = dao.insertOrder(session, reservDTO);
			result = dao.updateState(session, carid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		} 
		return result;
	}




}
