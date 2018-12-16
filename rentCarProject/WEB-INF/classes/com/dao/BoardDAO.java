package com.dao;


import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.BoardDTO;
import com.dto.BoardPageDTO;


public class BoardDAO {

	/*public List<BoardDTO> selectBoardList(SqlSession session) {
		List<BoardDTO> list = session.selectList("com.board.selectBoardList") ;
		return list;
	}*/
	
    //전체 개수 구하는 메서드 생성
    public int totalRecord(SqlSession session) {
          int n=session.selectOne("totalRecord");
          return n;
    }

	public BoardPageDTO selectBoardList(SqlSession session,int curPage) {
      	
      BoardPageDTO pdto = new BoardPageDTO();
      int offset = (curPage -1)*pdto.getPerPage();
		
		List<BoardDTO> list = session.selectList("com.board.selectBoardList",null,new RowBounds(offset,pdto.getPerPage())) ;
		
		pdto.setList(list);
		pdto.setCurPage(curPage);
		
		int count = totalRecord(session);
		pdto.setTotalRecord(count);
		
		return pdto;
	}

	public int insertBoard(SqlSession session, BoardDTO dto) {
		int n = session.insert("com.board.insertBoard",dto);
		return n;
	}

	public BoardDTO viewBoard(SqlSession session, String num) {
		BoardDTO dto  = session.selectOne("com.board.viewBoard",num);
		return dto;
	}

	public int delBoard(SqlSession session, String num) {
		int n = session.delete("com.board.delBoard",num);
		return n;
	}

	public int updateBoard(SqlSession session, BoardDTO dto) {
		int n = session.update("com.board.updateBoard",dto);
		return n;
	}

	public int repWrite(SqlSession session, BoardDTO dto) {
		int n = session.update("com.board.repWrite",dto);
		return n;
	}
	
	public List<BoardDTO> getCommentList(SqlSession session, int boardNum) {
		return session.selectList("com.board.getCommentList", boardNum);
	}

	public int commentDel(SqlSession session, String num) {
		int n = session.delete("com.board.commentDel",num);
		return n;
	}

	public int repUpdate(SqlSession session, BoardDTO dto) {
		int n = session.update("com.board.repUpdate",dto);
		return n;
	}
	
}
