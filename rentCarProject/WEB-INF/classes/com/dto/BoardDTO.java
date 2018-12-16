package com.dto;

import java.util.Date;
import java.util.List;

public class BoardDTO {
	
	private int num;
	private String title;
	private String content;
	private String writeday;
	private String userid;
	private int reproot; 
	private int repstep;
	
	public BoardDTO(int reproot, int repstep) {
		super();
		this.reproot = reproot;
		this.repstep = repstep;
	}
	
	
	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", title=" + title + ", content=" + content + ", writeday=" + writeday
				+ ", userid=" + userid + ", reproot=" + reproot + ", repstep=" + repstep + "]";
	}


	public BoardDTO(int num, String title, String content, String writeday, String userid,int reproot, int repstep) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.writeday = writeday;
		this.userid = userid;
		this.reproot = reproot;
		this.repstep = repstep;
	}
	
	public BoardDTO(int num, String content, String writeday, String userid,int reproot, int repstep) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.writeday = writeday;
		this.userid = userid;
		this.reproot = reproot;
		this.repstep = repstep;
	}
	
	
	public BoardDTO( String userid, String title,String content , String writeday) {
		super();
		this.title = title;
		this.content = content;
		this.userid = userid;
		this.writeday = writeday;
	}
	
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getReproot() {
		return reproot;
	}
	public void setReproot(int reproot) {
		this.reproot = reproot;
	}
	public int getRepstep() {
		return repstep;
	}
	public void setRepstep(int repstep) {
		this.repstep = repstep;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}


	public void setWriteday(Date strDate) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
}
