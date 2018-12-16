package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MypageDAO;
import com.dto.Member;
import com.dto.MyOrder;

@Service
public class MypageService {

	@Autowired
	MypageDAO dao;
	

	public Member getInfoMember(String member_id) {
		return dao.getInfoMember(member_id);
	}


	public int updateMypage(Member member) {
		return dao.updateMypage(member);
	}


	public List<MyOrder> getMyOrder(String member_id) {
		return dao.getMyOrder(member_id);
	}

}



