package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MysqlSessionFactory;
import com.dao.QABoardDAO;
import com.dto.QABoardDTO;
import com.dto.QABoardPageDTO;

public class QABoardService {
	QABoardDAO dao = null;
	
	public QABoardService() {
		dao = new QABoardDAO();
	}

	public QABoardPageDTO getAllList(QABoardPageDTO pDto, HashMap<String, String> map) {
		SqlSession session = MysqlSessionFactory.getSession();
		QABoardPageDTO list = null;
		
		try {
			list = dao.getAllList(session,pDto, map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public QABoardDTO getContent(int num) {
		SqlSession session = MysqlSessionFactory.getSession();
		QABoardDTO dto = null;
		
		try {
			dto = dao.getContent(session, num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}

	public int repWrite(QABoardDTO dto) {
		SqlSession session = MysqlSessionFactory.getSession();
		int n = 0;
		
		try {
			n = dao.repWrite(session,dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(n != 0) session.commit();
			session.close();
		}
		
		return n;
	}

	public int write(QABoardDTO dto) {
		SqlSession session = MysqlSessionFactory.getSession();
		int n = 0;
		
		try {
			n = dao.write(session,dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(n != 0) session.commit();
			session.close();
		}
		
		return n;
	}

	public int update(QABoardDTO dto) {
		SqlSession session = MysqlSessionFactory.getSession();
		int n = 0;
		
		try {
			n = dao.update(session,dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(n != 0) session.commit();
			session.close();
		}
		
		return n;
	}

	public int delete(int num) {
		SqlSession session = MysqlSessionFactory.getSession();
		int n = 0;
		
		try {
			n = dao.delete(session,num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(n != 0) session.commit();
			session.close();
		}
		
		return n;
	}

	
}
