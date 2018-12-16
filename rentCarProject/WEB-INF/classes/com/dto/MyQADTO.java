package com.dto;

import java.util.List;

public class MyQADTO {
	
	private List<QABoardDTO> list;
	int curPage;
	int perPage;
	int totalRecord;
	String startDate;
	String endDate;
	String userId;
	private int perBlock;
	public MyQADTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyQADTO(List<QABoardDTO> list, int curPage, int perPage, int totalRecord, String startDate, String endDate,
			String userId, int perBlock) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.perPage = perPage;
		this.totalRecord = totalRecord;
		this.startDate = startDate;
		this.endDate = endDate;
		this.userId = userId;
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
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}
	@Override
	public String toString() {
		return "MyQADTO [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalRecord="
				+ totalRecord + ", startDate=" + startDate + ", endDate=" + endDate + ", userId=" + userId
				+ ", perBlock=" + perBlock + "]";
	}
	
}
