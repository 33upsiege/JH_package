package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("Notice")
public class Notice {

	private String notice_number;
	private String notice_title;
	private String notice_contents;
	private String notice_writer;
	private String notice_date;

	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notice(String notice_number, String notice_title, String notice_contents, String notice_writer,
			String notice_date) {
		super();
		this.notice_number = notice_number;
		this.notice_title = notice_title;
		this.notice_contents = notice_contents;
		this.notice_writer = notice_writer;
		this.notice_date = notice_date;
	}

	@Override
	public String toString() {
		return "Notice [notice_number=" + notice_number + ", notice_title=" + notice_title + ", notice_contents="
				+ notice_contents + ", notice_writer=" + notice_writer + ", notice_date=" + notice_date + "]";
	}

	public String getNotice_number() {
		return notice_number;
	}

	public void setNotice_number(String notice_number) {
		this.notice_number = notice_number;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_contents() {
		return notice_contents;
	}

	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}

	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

}