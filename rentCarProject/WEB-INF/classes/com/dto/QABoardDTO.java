package com.dto;

public class QABoardDTO {
/*
	num number(7,0) NOT NULL,
	title varchar2(50) NOT NULL,
	content varchar2(500),
	writeday date,
	type varchar2(10),
	userid varchar2(15) NOT NULL,
  	reproot number(7,0) not null,
  	repstep number(7,0) not null,
*/
	
	private int num;
	private String title;
	private String content;
	private String writeday;
	private String type;
	private String userid;
	private int reproot; 
	private int repstep;
	
	public QABoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public QABoardDTO(int num, String title, String content, String writeday, String type, String userid, int reproot,
			int repstep) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.writeday = writeday;
		this.type = type;
		this.userid = userid;
		this.reproot = reproot;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	@Override
	public String toString() {
		return "QABoardDTO [num=" + num + ", title=" + title + ", content=" + content + ", writeday=" + writeday
				+ ", type=" + type + ", userid=" + userid + ", reproot=" + reproot + ", repstep=" + repstep + "]";
	}
	
}
