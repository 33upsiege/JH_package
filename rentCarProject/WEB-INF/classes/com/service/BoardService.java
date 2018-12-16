package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MysqlSessionFactory;
import com.dao.BoardDAO;
import com.dto.BoardDTO;
import com.dto.BoardPageDTO;


public class BoardService {

	private BoardDAO dao;
	
	public BoardService() {
		dao= new BoardDAO();
	}
	


	public BoardPageDTO selectBoardList(int curpage) {
		SqlSession session = MysqlSessionFactory.getSession();
		BoardPageDTO pdto = null;
		try {
			pdto =dao.selectBoardList(session,curpage);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return pdto;
	}



	public int insertBoard(BoardDTO dto) {
		SqlSession session = MysqlSessionFactory.getSession();
		int n = 0;
		try {
			n =dao.insertBoard(session,dto);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return n;
	}



	public BoardDTO viewBoard(String num) {
		SqlSession session = MysqlSessionFactory.getSession();
		BoardDTO dto = null;
		try {
			dto =dao.viewBoard(session,num);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
		
	}



	public int delBoard(String num) {
		SqlSession session = MysqlSessionFactory.getSession();
		int n = 0;
		try {
			n =dao.delBoard(session,num);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			session.close();
		}
		
		return n;
	}



	public int updateBoard(BoardDTO dto) {
		SqlSession session = MysqlSessionFactory.getSession();
		int n = 0 ;
		try {
			n =dao.updateBoard(session,dto);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			session.close();
		}
		
		return n;
		
	}



	public int repWrite(BoardDTO dto) {
		SqlSession session = MysqlSessionFactory.getSession();
		int n = 0 ;
		try {
			n =dao.repWrite(session,dto);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			session.close();
		}
		
		return n;
	}
	
	public List<BoardDTO> getCommentList(int boardNum) {
		SqlSession session = MysqlSessionFactory.getSession();
		
		
		return dao.getCommentList(session, boardNum);
	}



	public int commentDel(String num) {
		SqlSession session = MysqlSessionFactory.getSession();
		int n = 0 ;
		try {
			n =dao.commentDel(session,num);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			session.close();
		}
		
		return n;
	}



	public int repUpdate(BoardDTO dto) {
		SqlSession session = MysqlSessionFactory.getSession();
		int n = 0 ;
		try {
			n =dao.repUpdate(session,dto);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			session.close();
		}
		
		return n;
		
	}
	
}
