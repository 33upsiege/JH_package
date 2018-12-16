package com.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MysqlSessionFactory;
import com.dao.MyPageDAO;
import com.dao.ReservationDAO;
import com.dto.MemberDTO;
import com.dto.MyQADTO;
import com.dto.MyRentCheckPageDTO;

public class MyPageService {
	
	private MyPageDAO dao;
	public MyPageService() {
		dao = new MyPageDAO();
	}
	
	public MyRentCheckPageDTO rentCheck(MyRentCheckPageDTO pDTO) {
		SqlSession session = MysqlSessionFactory.getSession();
		MyRentCheckPageDTO reservList = null;
		try {
			reservList = dao.rentCheck(session, pDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return reservList;
	}

	public MyQADTO myQaList(MyQADTO qaDTO) {
		SqlSession session = MysqlSessionFactory.getSession();
		MyQADTO MyQaList = null;
		try {
			MyQaList = dao.myQaList(session, qaDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return MyQaList;
	}
	
	public MemberDTO memberInfo(String userId) {
		SqlSession session = MysqlSessionFactory.getSession();
		MemberDTO memberDTO = null;
		try {
			memberDTO = dao.memberInfo(session, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return memberDTO;
	}

	public int updateMember(MemberDTO mDTO) {
		SqlSession session = MysqlSessionFactory.getSession();
		int result = 0;
		try {
			result = dao.updateMember(session, mDTO);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}


}
