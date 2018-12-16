package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("Menu")
public class Menu {

	private String mCode;
	private String mImg;
	private String mImg2;
	private String mCategory;
	private String mName;
	private int mPrice;
	private String mContent1;
	private String mContent2;
	private String mRecipe;
	private int mTotalSalesAmount;
	
	
	public Menu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Menu(String mCode, String mImg, String mImg2, String mCategory, String mName, int mPrice, String mContent1,
			String mContent2, String mRecipe, int mTotalSalesAmount) {
		super();
		this.mCode = mCode;
		this.mImg = mImg;
		this.mImg2 = mImg2;
		this.mCategory = mCategory;
		this.mName = mName;
		this.mPrice = mPrice;
		this.mContent1 = mContent1;
		this.mContent2 = mContent2;
		this.mRecipe = mRecipe;
		this.mTotalSalesAmount = mTotalSalesAmount;
	}
	public String getmCode() {
		return mCode;
	}
	public void setmCode(String mCode) {
		this.mCode = mCode;
	}
	public String getmImg() {
		return mImg;
	}
	public void setmImg(String mImg) {
		this.mImg = mImg;
	}
	public String getmImg2() {
		return mImg2;
	}
	public void setmImg2(String mImg2) {
		this.mImg2 = mImg2;
	}
	public String getmCategory() {
		return mCategory;
	}
	public void setmCategory(String mCategory) {
		this.mCategory = mCategory;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public int getmPrice() {
		return mPrice;
	}
	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}
	public String getmContent1() {
		return mContent1;
	}
	public void setmContent1(String mContent1) {
		this.mContent1 = mContent1;
	}
	public String getmContent2() {
		return mContent2;
	}
	public void setmContent2(String mContent2) {
		this.mContent2 = mContent2;
	}
	public String getmRecipe() {
		return mRecipe;
	}
	public void setmRecipe(String mRecipe) {
		this.mRecipe = mRecipe;
	}
	public int getmTotalSalesAmount() {
		return mTotalSalesAmount;
	}
	public void setmTotalSalesAmount(int mTotalSalesAmount) {
		this.mTotalSalesAmount = mTotalSalesAmount;
	}
	@Override
	public String toString() {
		return "Menu [mCode=" + mCode + ", mImg=" + mImg + ", mImg2=" + mImg2 + ", mCategory=" + mCategory + ", mName="
				+ mName + ", mPrice=" + mPrice + ", mContent1=" + mContent1 + ", mContent2=" + mContent2 + ", mRecipe="
				+ mRecipe + ", mTotalSalesAmount=" + mTotalSalesAmount + "]";
	}
	
	
	
	
}
