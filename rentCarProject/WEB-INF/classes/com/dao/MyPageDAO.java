package com.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.MemberDTO;
import com.dto.MyQADTO;
import com.dto.MyRentCheckPageDTO;
import com.dto.QABoardDTO;
import com.dto.ReservationDTO;

public class MyPageDAO {

	public MyRentCheckPageDTO rentCheck(SqlSession session, MyRentCheckPageDTO pDTO) {
		MyRentCheckPageDTO dto = new MyRentCheckPageDTO();
		int offset = (pDTO.getCurPage()-1)*pDTO.getPerPage();
		
		List<ReservationDTO> list = session.selectList("com.mypage.rentCheck", pDTO, new RowBounds(offset,pDTO.getPerPage()));
		int totalCount = 0;
		if(pDTO.getStartDate()==null){
			  totalCount = session.selectOne("com.mypage.totalCount",pDTO);
	      }else{
	    	  totalCount = session.selectOne("com.mypage.totalCountSearch", pDTO);
	      }

		dto.setCurPage(pDTO.getCurPage());
		dto.setPerBlock(pDTO.getPerBlock());
		dto.setPerPage(pDTO.getPerPage());
		dto.setTotalRecord(totalCount);
		dto.setStartDate(pDTO.getStartDate());
		dto.setEndDate(pDTO.getEndDate());
		dto.setUserId(pDTO.getUserId());
		dto.setList(list);
		return dto;
	}

	public MyQADTO myQaList(SqlSession session, MyQADTO qaDTO) {
		MyQADTO dto = new MyQADTO();
		int offset = (qaDTO.getCurPage()-1)*qaDTO.getPerPage();
		
		List<QABoardDTO> list = session.selectList("com.mypage.myQaList", qaDTO, new RowBounds(offset,qaDTO.getPerPage()));
		int totalCount = 0;
		if(qaDTO.getStartDate()==null){
			  totalCount = session.selectOne("com.mypage.totalCountQA",qaDTO);
	      }else{
	    	  totalCount = session.selectOne("com.mypage.totalCountSearchQA", qaDTO);
	      }
		
		dto.setCurPage(qaDTO.getCurPage());
		dto.setPerBlock(qaDTO.getPerBlock());
		dto.setPerPage(qaDTO.getPerPage());
		dto.setTotalRecord(totalCount);
		dto.setStartDate(qaDTO.getStartDate());
		dto.setEndDate(qaDTO.getEndDate());
		dto.setUserId(qaDTO.getUserId());
		dto.setList(list);
		return dto;
		
	}

	public MemberDTO memberInfo(SqlSession session, String userId) {
		return session.selectOne("com.mypage.memberInfo", userId);
	}

	public int updateMember(SqlSession session, MemberDTO mDTO) {
		return session.update("com.mypage.updateMember", mDTO);
	}
}
