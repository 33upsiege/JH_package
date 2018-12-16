package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("Sales")
public class Sales {

   private String order_code;
   private String product_code;
   private String menu_code;
   private int sales_amount;
   private String sales_payment_date;
   private int sales_price;
   
   public Sales() {
      super();
      // TODO Auto-generated constructor stub
   }

   public Sales(String order_code, String product_code, String menu_code, int sales_amount, String sales_payment_date,
			int sales_price) {
		super();
		this.order_code = order_code;
		this.product_code = product_code;
		this.menu_code = menu_code;
		this.sales_amount = sales_amount;
		this.sales_payment_date = sales_payment_date;
		this.sales_price = sales_price;
	}

	public String getOrder_code() {
		return order_code;
	}
	
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	
	public String getProduct_code() {
		return product_code;
	}
	
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	
	public String getMenu_code() {
		return menu_code;
	}
	
	public void setMenu_code(String menu_code) {
		this.menu_code = menu_code;
	}
	
	public int getSales_amount() {
		return sales_amount;
	}
	
	public void setSales_amount(int sales_amount) {
		this.sales_amount = sales_amount;
	}
	
	public String getSales_payment_date() {
		return sales_payment_date;
	}
	
	public void setSales_payment_date(String sales_payment_date) {
		this.sales_payment_date = sales_payment_date;
	}
	
	public int getSales_price() {
		return sales_price;
	}
	
	public void setSales_price(int sales_price) {
		this.sales_price = sales_price;
	}

	@Override
	public String toString() {
		return "Sales [order_code=" + order_code + ", product_code=" + product_code + ", menu_code=" + menu_code
				+ ", sales_amount=" + sales_amount + ", sales_payment_date=" + sales_payment_date + ", sales_price="
				+ sales_price + "]";
	}
	   
}