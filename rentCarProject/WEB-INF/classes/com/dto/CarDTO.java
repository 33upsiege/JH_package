package com.dto;

public class CarDTO {
	/*
	carid varchar2(4) NOT NULL,
	cartype varchar2(4) NOT NULL,
	carname varchar2(20) NOT NULL,
	manufactured_com varchar2(10),
	color varchar2(10),
	price number(7,0) NOT NULL,
	image varchar2(8),
	shopid varchar2(4) NOT NULL,
	PRIMARY KEY (carid)
	 */
	
	
	private String carId;
	private String carType;
	private String carName;
	private String manufacturedCom;
	private String color;
	private String price;
	private String image;
	private String shopId;
	private String state;
	
	
	
	public CarDTO() {
		super();
		// TODO Auto-generated constructor stub
	}



	public CarDTO(String carId, String carType, String carName, String manufacturedCom, String color, String price,
			String image, String shopId, String state) {
		super();
		this.carId = carId;
		this.carType = carType;
		this.carName = carName;
		this.manufacturedCom = manufacturedCom;
		this.color = color;
		this.price = price;
		this.image = image;
		this.shopId = shopId;
		this.state = state;
	}





	public String getCarId() {
		return carId;
	}



	public void setCarId(String carId) {
		this.carId = carId;
	}



	public String getCarType() {
		return carType;
	}



	public void setCarType(String carType) {
		this.carType = carType;
	}



	public String getCarName() {
		return carName;
	}



	public void setCarName(String carName) {
		this.carName = carName;
	}



	public String getManufacturedCom() {
		return manufacturedCom;
	}



	public void setManufacturedCom(String manufacturedCom) {
		this.manufacturedCom = manufacturedCom;
	}



	public String getColor() {
		return color;
	}



	public void setColor(String color) {
		this.color = color;
	}



	public String getPrice() {
		return price;
	}



	public void setPrice(String price) {
		this.price = price;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public String getShopId() {
		return shopId;
	}



	public void setShopId(String shopId) {
		this.shopId = shopId;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}





	@Override
	public String toString() {
		return "CarDTO [carId=" + carId + ", carType=" + carType + ", carName=" + carName + ", manufacturedCom="
				+ manufacturedCom + ", color=" + color + ", price=" + price + ", image=" + image + ", shopId=" + shopId
				+ ", state=" + state + "]";
	}
	
	
	
	
}
