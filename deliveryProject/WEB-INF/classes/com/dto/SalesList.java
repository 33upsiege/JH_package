package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("SalesList")
public class SalesList {

	private String orderCode;
	private String menuCode;
	private int salesAmount;
	private String salesPaymentDate;
	private int salesPrice;
	
	public SalesList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SalesList(String orderCode, String menuCode, int salesAmount, String salesPaymentDate, int salesPrice,
			Menu menu) {
		super();
		this.orderCode = orderCode;
		this.menuCode = menuCode;
		this.salesAmount = salesAmount;
		this.salesPaymentDate = salesPaymentDate;
		this.salesPrice = salesPrice;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}

	public int getSalesAmount() {
		return salesAmount;
	}

	public void setSalesAmount(int salesAmount) {
		this.salesAmount = salesAmount;
	}

	public String getSalesPaymentDate() {
		return salesPaymentDate;
	}

	public void setSalesPaymentDate(String salesPaymentDate) {
		this.salesPaymentDate = salesPaymentDate;
	}

	public int getSalesPrice() {
		return salesPrice;
	}

	public void setSalesPrice(int salesPrice) {
		this.salesPrice = salesPrice;
	}

	@Override
	public String toString() {
		return "SalesList [orderCode=" + orderCode + ", menuCode=" + menuCode + ", salesAmount=" + salesAmount
				+ ", salesPaymentDate=" + salesPaymentDate + ", salesPrice=" + salesPrice + "]";
	}
	
}
