package com.dto;

public class ShopDTO {
	/*
	shopid varchar2(4) NOT NULL,
	shopname varchar2(16),
	addr varchar2(100),
	phone varchar2(12),
	map varchar2(15),
	PRIMARY KEY (shopid)
	*/
	
	 private String shopId;
	 private String shopName;
	 private String addr;
	 private String phone;
	 private String lat;
	 private String lon;
	 
	
	public ShopDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ShopDTO(String shopId, String shopName, String addr, String phone, String lat, String lon) {
		super();
		this.shopId = shopId;
		this.shopName = shopName;
		this.addr = addr;
		this.phone = phone;
		this.lat = lat;
		this.lon = lon;
	}


	public String getShopId() {
		return shopId;
	}


	public void setShopId(String shopId) {
		this.shopId = shopId;
	}


	public String getShopName() {
		return shopName;
	}


	public void setShopName(String shopName) {
		this.shopName = shopName;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getLat() {
		return lat;
	}


	public void setLat(String lat) {
		this.lat = lat;
	}


	public String getLon() {
		return lon;
	}


	public void setLon(String lon) {
		this.lon = lon;
	}


	@Override
	public String toString() {
		return "ShopDTO [shopId=" + shopId + ", shopName=" + shopName + ", addr=" + addr + ", phone=" + phone + ", lat="
				+ lat + ", lon=" + lon + "]";
	}	 
	 
}//end
