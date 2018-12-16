package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("OrderMember")
public class OrderMember {

	private Member member;
	private Guest guest;
	private OrderInformationList orderInformationList;
	
	public OrderMember() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderMember(Member member, Guest guest, OrderInformationList orderInformationList) {
		super();
		this.member = member;
		this.guest = guest;
		this.orderInformationList = orderInformationList;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Guest getGuest() {
		return guest;
	}

	public void setGuest(Guest guest) {
		this.guest = guest;
	}

	public OrderInformationList getOrderInformationList() {
		return orderInformationList;
	}

	public void setOrderInformationList(OrderInformationList orderInformationList) {
		this.orderInformationList = orderInformationList;
	}

	@Override
	public String toString() {
		return "OrderMember [member=" + member + ", guest=" + guest + ", orderInformationList=" + orderInformationList
				+ "]";
	}


	
}
