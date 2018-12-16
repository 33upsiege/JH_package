package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.Member;
import com.dto.MyOrder;

@Repository
public class MypageDAO {

	@Autowired
	SqlSessionTemplate template;

	public Member getInfoMember(String member_id) {
		return template.selectOne("MypageMapper.getInfoMember",member_id);
	}

	public int updateMypage(Member member) {
		return template.update("MypageMapper.updateMypage",member);
	}

	public List<MyOrder> getMyOrder(String member_id) {
		System.out.println("DAO 접근  "+member_id);
		return template.selectList("MypageMapper.getMyOrder",member_id);
	}
}
