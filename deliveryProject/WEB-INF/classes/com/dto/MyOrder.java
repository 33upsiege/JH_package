package com.dto;

public class MyOrder {
	private Order order;
	private Sales sales;
	private Product product;
	private Member member;
	private String count;

	public MyOrder() {
		// TODO Auto-generated constructor stub
	}

	public MyOrder(Order order, Sales sales, Product product, Member member, String count) {
		super();
		this.order = order;
		this.sales = sales;
		this.product = product;
		this.member = member;
		this.count = count;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Sales getSales() {
		return sales;
	}

	public void setSales(Sales sales) {
		this.sales = sales;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "MyOrder [order=" + order + ", sales=" + sales + ", product=" + product + ", member=" + member
				+ ", count=" + count + "]";
	}

	
	
}
