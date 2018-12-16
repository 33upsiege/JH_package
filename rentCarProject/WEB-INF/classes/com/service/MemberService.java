package com.service;

import java.io.IOException;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MysqlSessionFactory;
import com.dao.MemberDAO;
import com.dto.MemberDTO;

public class MemberService {

	private MemberDAO dao;
	
	public MemberService() {
		dao = new MemberDAO();
	}
	
	//로그인 체크
	public int login(HashMap<String, String> map) {
		SqlSession session = MysqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.login(session, map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return n;
	}
	
	//회원가입
	public int addMember(MemberDTO mDTO) throws IOException {
		SqlSession session = MysqlSessionFactory.getSession();
		int n = 0;
		
		try {
			n = dao.addMember(session, mDTO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(n != 0) session.commit();
			session.close();
		}
		
		return n;
	}

	//아이디 체크
	public int idCheck(String userid) {
		SqlSession session = MysqlSessionFactory.getSession();
		int n = 0;
		
		try {
			n = dao.idCheck(session, userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return n;
	}

	
	
}
