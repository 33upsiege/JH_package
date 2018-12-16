package com.dto;

import java.util.Arrays;

import org.apache.ibatis.type.Alias;

@Alias("Topping")
public class Topping {

	private String order_code;
	private String menu_code;
	private String count;
	private String price;
	private String[] topingArr; 
	
	private String[] topingPriceArr;
	public Topping() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Topping(String menu_code, String count, String price, String[] topingArr, String[] topingPriceArr) {
		super();
		this.menu_code = menu_code;
		this.count = count;
		this.price = price;
		this.topingArr = topingArr;
		this.topingPriceArr = topingPriceArr;
	}
	@Override
	public String toString() {
		return "Topping [menu_code=" + menu_code + ", count=" + count + ", price=" + price + ", topingArr="
				+ Arrays.toString(topingArr) + ", topingPriceArr=" + Arrays.toString(topingPriceArr) + "]";
	}
	public String getMenu_code() {
		return menu_code;
	}
	public void setMenu_code(String menu_code) {
		this.menu_code = menu_code;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String[] getTopingArr() {
		return topingArr;
	}
	public void setTopingArr(String[] topingArr) {
		this.topingArr = topingArr;
	}
	public String[] getTopingPriceArr() {
		return topingPriceArr;
	}
	public void setTopingPriceArr(String[] topingPriceArr) {
		this.topingPriceArr = topingPriceArr;
	} 
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
}
