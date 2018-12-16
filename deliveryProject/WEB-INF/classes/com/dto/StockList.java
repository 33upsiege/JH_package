package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("StockList")
public class StockList {

	private String pCode;
	private String pName;
	private Integer pAmount;
	private Integer pMinimumAmount;
	
	public StockList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StockList(String pCode, String pName, Integer pAmount, Integer pMinimumAmount) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pAmount = pAmount;
		this.pMinimumAmount = pMinimumAmount;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public Integer getpAmount() {
		return pAmount;
	}
	public void setpAmount(Integer pAmount) {
		this.pAmount = pAmount;
	}
	public Integer getpMinimumAmount() {
		return pMinimumAmount;
	}
	public void setpMinimumAmount(Integer pMinimumAmount) {
		this.pMinimumAmount = pMinimumAmount;
	}
	@Override
	public String toString() {
		return "StockList [pCode=" + pCode + ", pName=" + pName + ", pAmount=" + pAmount + ", pMinimumAmount="
				+ pMinimumAmount + "]";
	}
	
	
}
