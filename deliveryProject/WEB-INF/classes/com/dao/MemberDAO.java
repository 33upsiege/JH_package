package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.Member;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate template;


	public int addMember(Member member) {
		return template.insert("MemberMapper.addMember", member);

	}


	public Member getLoginMember(Member member) {
		return template.selectOne("MemberMapper.getLoginMember", member);
	}


	public String checkID(String member_id) {
		return template.selectOne("MemberMapper.checkID",member_id);
		
	}
}
