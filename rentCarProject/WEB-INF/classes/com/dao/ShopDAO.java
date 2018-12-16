package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.CarDTO;
import com.dto.ShopDTO;

public class ShopDAO {

	public ShopDTO getShopList(SqlSession session, ShopDTO shopDTO) {
		return session.selectOne("com.shop.getShopList",shopDTO);
	}

}
