package com.dto;

import java.util.List;

public class QABoardPageDTO {

	private List<QABoardDTO> list;
	private int curPage; //현재 페이지
	private int totalCount; //전체 레코드 갯수
	private int perPage; //한 페이지에 보여질 게시물 갯수
	
	private String searchName;
	private String searchValue;
	private int perBlock; // 페이지 당 보여줄 페이지 번호 갯수
	
	public QABoardPageDTO() {
		// TODO Auto-generated constructor stub
	}

	public QABoardPageDTO(List<QABoardDTO> list, int curPage, int totalCount, int perPage, String searchName,
			String searchValue, int perBlock) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.perPage = perPage;
		this.searchName = searchName;
		this.searchValue = searchValue;
		this.perBlock = perBlock;
	}

	public List<QABoardDTO> getList() {
		return list;
	}

	public void setList(List<QABoardDTO> list) {
		this.list = list;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public int getPerBlock() {
		return perBlock;
	}

	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}

	@Override
	public String toString() {
		return "QABoardPageDTO [list=" + list + ", curPage=" + curPage + ", totalCount=" + totalCount + ", perPage="
				+ perPage + ", searchName=" + searchName + ", searchValue=" + searchValue + ", perBlock=" + perBlock
				+ "]";
	}
	
}
