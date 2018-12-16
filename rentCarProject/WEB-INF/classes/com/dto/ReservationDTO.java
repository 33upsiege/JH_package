package com.dto;

public class ReservationDTO {
    /*
	CREATE TABLE reservation
	(
		rentid varchar2(8) NOT NULL,
		rentdate varchar2(10) NOT NULL,
		real_returndate varchar2(10) NOT NULL,
		returndate varchar2(10),
		insurance varchar2(10),
		userid varchar2(15) NOT NULL,
		carid varchar2(4) NOT NULL,
		shopid varchar2(4) NOT NULL,
	  price number(9,0),
	  navigation varchar2(1) default 'N' ,
	  babyseat varchar2(1) default 'N',
	  baby_carriage varchar2(1) default 'N',
		PRIMARY KEY (rentid)
	);
	*/
	
	private String rentId;
	private String rentDate;
	private String returnDate;
	private String RealReturnDate;
	private String insurance;
	private String carId;
	private String shopId;
	private String userId;
	private String navigation;
	private String babySeat;
	private String babyCarriage;
	private int price;
	
	private CarDTO carDTO;
	
	public ReservationDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReservationDTO(String rentId, String rentDate, String returnDate, String realReturnDate, String insurance,
			String carId, String shopId, String userId, String navigation, String babySeat, String babyCarriage,
			int price, CarDTO carDTO) {
		super();
		this.rentId = rentId;
		this.rentDate = rentDate;
		this.returnDate = returnDate;
		RealReturnDate = realReturnDate;
		this.insurance = insurance;
		this.carId = carId;
		this.shopId = shopId;
		this.userId = userId;
		this.navigation = navigation;
		this.babySeat = babySeat;
		this.babyCarriage = babyCarriage;
		this.price = price;
		this.carDTO = carDTO;
	}

	public String getRentId() {
		return rentId;
	}

	public void setRentId(String rentId) {
		this.rentId = rentId;
	}

	public String getRentDate() {
		return rentDate;
	}

	public void setRentDate(String rentDate) {
		this.rentDate = rentDate;
	}

	public String getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	public String getRealReturnDate() {
		return RealReturnDate;
	}

	public void setRealReturnDate(String realReturnDate) {
		RealReturnDate = realReturnDate;
	}

	public String getInsurance() {
		return insurance;
	}

	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNavigation() {
		return navigation;
	}

	public void setNavigation(String navigation) {
		this.navigation = navigation;
	}

	public String getBabySeat() {
		return babySeat;
	}

	public void setBabySeat(String babySeat) {
		this.babySeat = babySeat;
	}

	public String getBabyCarriage() {
		return babyCarriage;
	}

	public void setBabyCarriage(String babyCarriage) {
		this.babyCarriage = babyCarriage;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public CarDTO getCarDTO() {
		return carDTO;
	}

	public void setCarDTO(CarDTO carDTO) {
		this.carDTO = carDTO;
	}

	@Override
	public String toString() {
		return "ReservationDTO [rentId=" + rentId + ", rentDate=" + rentDate + ", returnDate=" + returnDate
				+ ", RealReturnDate=" + RealReturnDate + ", insurance=" + insurance + ", carId=" + carId + ", shopId="
				+ shopId + ", userId=" + userId + ", navigation=" + navigation + ", babySeat=" + babySeat
				+ ", babyCarriage=" + babyCarriage + ", price=" + price + ", carDTO=" + carDTO + "]";
	}

	
	
	
}//end
