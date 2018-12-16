package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("OrderNotice")
public class OrderNotice {

	private Menu menu;
	private OrderInformationList orderList;
	private SalesList salseList;
	
	public OrderNotice() {
		// TODO Auto-generated constructor stub
	}

	public OrderNotice(Menu menu, OrderInformationList orderList, SalesList salseList, String orderCount) {
		super();
		this.menu = menu;
		this.orderList = orderList;
		this.salseList = salseList;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public OrderInformationList getOrderList() {
		return orderList;
	}

	public void setOrderList(OrderInformationList orderList) {
		this.orderList = orderList;
	}

	public SalesList getSalseList() {
		return salseList;
	}

	public void setSalseList(SalesList salseList) {
		this.salseList = salseList;
	}

	@Override
	public String toString() {
		return "OrderNotice [menu=" + menu + ", orderList=" + orderList + ", salseList=" + salseList + "]";
	}

	
	
}
