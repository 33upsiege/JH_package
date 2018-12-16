package com.dto;

import java.util.List;

public class BoardPageDTO {
	int perPage = 5;
	int curPage;
	int totalRecord;
	List<BoardDTO> list;
	public BoardPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardPageDTO(int perPage, int curPage, int totalRecord, List<BoardDTO> list) {
		super();
		this.perPage = perPage;
		this.curPage = curPage;
		this.totalRecord = totalRecord;
		this.list = list;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public List<BoardDTO> getList() {
		return list;
	}
	public void setList(List<BoardDTO> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "BoardPageDTO [perPage=" + perPage + ", curPage=" + curPage + ", totalRecord=" + totalRecord + ", list="
				+ list + "]";
	}
	
	
}
