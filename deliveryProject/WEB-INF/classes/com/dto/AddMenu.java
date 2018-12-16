package com.dto;

import java.util.Arrays;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Alias("addMenu")

public class AddMenu {

	CommonsMultipartFile theFile;
	private String[] recipes;
	
	public AddMenu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AddMenu(CommonsMultipartFile theFile, String[] recipes) {
		super();
		this.theFile = theFile;
		this.recipes = recipes;
	}

	public CommonsMultipartFile getTheFile() {
		return theFile;
	}

	public void setTheFile(CommonsMultipartFile theFile) {
		this.theFile = theFile;
	}

	public String[] getRecipes() {
		return recipes;
	}

	public void setRecipes(String[] recipes) {
		this.recipes = recipes;
	}

	@Override
	public String toString() {
		return "AddMenu [theFile=" + theFile + ", recipes=" + Arrays.toString(recipes) + "]";
	}

	
}
