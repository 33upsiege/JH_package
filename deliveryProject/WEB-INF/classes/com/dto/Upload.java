package com.dto;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Upload {

	String theText;
	CommonsMultipartFile theFile;

	public Upload() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getTheText() {
		return theText;
	}
	public void setTheText(String theText) {
		this.theText = theText;
	}
	public CommonsMultipartFile getTheFile() {
		return theFile;
	}
	public void setTheFile(CommonsMultipartFile theFile) {
		this.theFile = theFile;
	}
	@Override
	public String toString() {
		return "Upload [theText=" + theText + ", theFile=" + theFile + "]";
	}
	
	
}
