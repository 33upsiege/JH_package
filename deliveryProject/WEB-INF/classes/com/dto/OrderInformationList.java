package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("OrderInformationList")
public class OrderInformationList {

	private String orderCode;
	private String orderId;
	private String orderTel;
	private String orderRequest;
	private String orderPeople;
	private String orderAddress;
	private String orderStatus;
	private int orderAllPrice;
	private Integer orderCount;
	
	public OrderInformationList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderInformationList(String orderCode, String orderId, String orderTel, String orderRequest,
			String orderPeople, String orderAddress, String orderStatus, int orderAllPrice, int orderCount) {
		super();
		this.orderCode = orderCode;
		this.orderId = orderId;
		this.orderTel = orderTel;
		this.orderRequest = orderRequest;
		this.orderPeople = orderPeople;
		this.orderAddress = orderAddress;
		this.orderStatus = orderStatus;
		this.orderAllPrice = orderAllPrice;
		this.orderCount = orderCount;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getOrderTel() {
		return orderTel;
	}

	public void setOrderTel(String orderTel) {
		this.orderTel = orderTel;
	}

	public String getOrderRequest() {
		return orderRequest;
	}

	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}

	public String getOrderPeople() {
		return orderPeople;
	}

	public void setOrderPeople(String orderPeople) {
		this.orderPeople = orderPeople;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getOrderAllPrice() {
		return orderAllPrice;
	}

	public void setOrderAllPrice(int orderAllPrice) {
		this.orderAllPrice = orderAllPrice;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	@Override
	public String toString() {
		return "OrderInformationList [orderCode=" + orderCode + ", orderId=" + orderId + ", orderTel=" + orderTel
				+ ", orderRequest=" + orderRequest + ", orderPeople=" + orderPeople + ", orderAddress=" + orderAddress
				+ ", orderStatus=" + orderStatus + ", orderAllPrice=" + orderAllPrice + ", orderCount=" + orderCount
				+ "]";
	}

	
	
	
}
