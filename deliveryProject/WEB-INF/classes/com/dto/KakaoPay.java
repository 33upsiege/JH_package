package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("KakaoPay")
public class KakaoPay {
	private String itemName;
	private String quantity;
	private String totalAmount;
	
	
	private String menu_code;
	private String count;
	private String price;
	private String toping;
	private String toping_price;
	private Order order;
	
	

	

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
	public String getToping() {
		return toping;
	}
	public void setToping(String toping) {
		this.toping = toping;
	}
	public String getToping_price() {
		return toping_price;
	}
	public void setToping_price(String toping_price) {
		this.toping_price = toping_price;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	@Override
	public String toString() {
		return "KakaoPay [itemName=" + itemName + ", quantity=" + quantity + ", totalAmount=" + totalAmount
				+ ", menu_code=" + menu_code + ", count=" + count + ", price=" + price + ", toping=" + toping
				+ ", toping_price=" + toping_price + ", order=" + order + "]";
	}
	
	
}
