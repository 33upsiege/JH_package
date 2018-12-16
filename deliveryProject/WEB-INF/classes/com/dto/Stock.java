package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("Stock")
public class Stock {


	private String product_code;
	private String product_name;
	private String product_amount;
	private String product_minimum_amount;
	private String product_enter_date;
	private String product_e_amount;
	private String product_e_cost;

	public Stock() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Stock(String product_code, String product_name, String product_amount, String product_minimum_amount,
			String product_enter_date, String product_e_amount, String product_e_cost) {
		super();
		this.product_code = product_code;
		this.product_name = product_name;
		this.product_amount = product_amount;
		this.product_minimum_amount = product_minimum_amount;
		this.product_enter_date = product_enter_date;
		this.product_e_amount = product_e_amount;
		this.product_e_cost = product_e_cost;
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_amount() {
		return product_amount;
	}

	public void setProduct_amount(String product_amount) {
		this.product_amount = product_amount;
	}

	public String getProduct_minimum_amount() {
		return product_minimum_amount;
	}

	public void setProduct_minimum_amount(String product_minimum_amount) {
		this.product_minimum_amount = product_minimum_amount;
	}

	public String getProduct_enter_date() {
		return product_enter_date;
	}

	public void setProduct_enter_date(String product_enter_date) {
		this.product_enter_date = product_enter_date;
	}

	public String getProduct_e_amount() {
		return product_e_amount;
	}

	public void setProduct_e_amount(String product_e_amount) {
		this.product_e_amount = product_e_amount;
	}

	public String getProduct_e_cost() {
		return product_e_cost;
	}

	public void setProduct_e_cost(String product_e_cost) {
		this.product_e_cost = product_e_cost;
	}

	@Override
	public String toString() {
		return "Stock [product_code=" + product_code + ", product_name=" + product_name + ", product_amount="
				+ product_amount + ", product_minimum_amount=" + product_minimum_amount + ", product_enter_date="
				+ product_enter_date + ", product_e_amount=" + product_e_amount + ", product_e_cost=" + product_e_cost
				+ "]";
	}

}

