package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("Order")
public class Order {

	private String order_code;
	private String order_id;
	private String order_tel;
	private String order_request;
	private String order_people;
	private String order_address;
	private int order_all_price;
	private String order_status;
	private String sales_payment_date;

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(String order_code, String order_id, String order_tel, String order_request, String order_people,
			String order_address, int order_all_price, String order_status, String sales_payment_date) {
		super();
		this.order_code = order_code;
		this.order_id = order_id;
		this.order_tel = order_tel;
		this.order_request = order_request;
		this.order_people = order_people;
		this.order_address = order_address;
		this.order_all_price = order_all_price;
		this.order_status = order_status;
		this.sales_payment_date = sales_payment_date;
	}
	
	public Order(String order_code, String order_id, String order_tel, String order_request, String order_people,
			String order_address, int order_all_price, String order_status) {
		super();
		this.order_code = order_code;
		this.order_id = order_id;
		this.order_tel = order_tel;
		this.order_request = order_request;
		this.order_people = order_people;
		this.order_address = order_address;
		this.order_all_price = order_all_price;
		this.order_status = order_status;
	}

	public String getOrder_code() {
		return order_code;
	}

	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getOrder_tel() {
		return order_tel;
	}

	public void setOrder_tel(String order_tel) {
		this.order_tel = order_tel;
	}

	public String getOrder_request() {
		return order_request;
	}

	public void setOrder_request(String order_request) {
		this.order_request = order_request;
	}

	public String getOrder_people() {
		return order_people;
	}

	public void setOrder_people(String order_people) {
		this.order_people = order_people;
	}

	public String getOrder_address() {
		return order_address;
	}

	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}

	public int getOrder_all_price() {
		return order_all_price;
	}

	public void setOrder_all_price(int order_all_price) {
		this.order_all_price = order_all_price;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public String getSales_payment_date() {
		return sales_payment_date;
	}

	public void setSales_payment_date(String sales_payment_date) {
		this.sales_payment_date = sales_payment_date;
	}

	@Override
	public String toString() {
		return "Order [order_code=" + order_code + ", order_id=" + order_id + ", order_tel=" + order_tel
				+ ", order_request=" + order_request + ", order_people=" + order_people + ", order_address="
				+ order_address + ", order_all_price=" + order_all_price + ", order_status=" + order_status
				+ ", sales_payment_date=" + sales_payment_date + "]";
	}

}