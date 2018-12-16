package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.QABoardDTO;
import com.dto.QABoardPageDTO;

public class QABoardDAO {
	
	// 검색보기
	private List<QABoardDTO> search(SqlSession session, HashMap<String, String> map){
      List<QABoardDTO> list =session.selectList("search", map);
	  return list;
	}
	
	//getAllList: 페이징 포함 전체 출력 메소드
	public QABoardPageDTO getAllList(SqlSession session, QABoardPageDTO pDto, HashMap<String, String> map) {
		
		QABoardPageDTO dto = new QABoardPageDTO();
		int sIndex = (pDto.getCurPage() - 1)* pDto.getPerPage();
	    int length  = pDto.getPerPage();
	     
	    List<QABoardDTO> list = session.selectList("com.QABoard.getAllList", map, new RowBounds(sIndex,length));
	    int totalCount = 0;
	    
	    dto.setList(list);
	    dto.setCurPage(pDto.getCurPage());
	    if(map.get("searchValue")==null){
	    	  totalCount = session.selectOne("com.QABoard.totalCount");
	      }else{
	    	  totalCount = session.selectOne("com.QABoard.totalCountSearch", map);
	      }
	    
	    dto.setTotalCount(totalCount);
	    dto.setSearchName(map.get("searchName"));
	    dto.setSearchValue(map.get("searchValue"));
	    dto.setPerPage(pDto.getPerPage());
	    dto.setPerBlock(pDto.getPerBlock());
	    return dto;
	}

	public QABoardDTO getContent(SqlSession session, int num) {
		QABoardDTO dto = session.selectOne("com.QABoard.getContent",num);
		return dto;
	}

	public int repWrite(SqlSession session, QABoardDTO dto) {
		int n = session.insert("com.QABoard.repWrite",dto);
		return n;
	}

	public int write(SqlSession session, QABoardDTO dto) {
		int n = session.insert("com.QABoard.write",dto);
		return n;
	}

	public int update(SqlSession session, QABoardDTO dto) {
		int n = session.update("com.QABoard.update",dto);
		return n;
	}

	public int delete(SqlSession session, int num) {
		int n = session.delete("com.QABoard.delete",num);
		return n;
	}
}
