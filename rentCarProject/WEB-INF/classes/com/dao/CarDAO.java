package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.CarDTO;

public class CarDAO {

	public List<CarDTO> carAllList(SqlSession session, CarDTO dto) {
		List<CarDTO> list = session.selectList("com.car.carAllList", dto);
		return list;
	}
}
