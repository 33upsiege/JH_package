package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("Guest")
public class Guest {

	private String GMemberName;
	private String GMaemberPhone;
	private String GMemberEmail;
	private String GMamberAddress;
	private String GMamberJoinDate;
	
	public Guest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Guest(String gMemberName, String gMaemberPhone, String gMemberEmail, String gMamberAddress,
			String gMamberJoinDate) {
		super();
		GMemberName = gMemberName;
		GMaemberPhone = gMaemberPhone;
		GMemberEmail = gMemberEmail;
		GMamberAddress = gMamberAddress;
		GMamberJoinDate = gMamberJoinDate;
	}

	public String getGMemberName() {
		return GMemberName;
	}

	public void setGMemberName(String gMemberName) {
		GMemberName = gMemberName;
	}

	public String getGMaemberPhone() {
		return GMaemberPhone;
	}

	public void setGMaemberPhone(String gMaemberPhone) {
		GMaemberPhone = gMaemberPhone;
	}

	public String getGMemberEmail() {
		return GMemberEmail;
	}

	public void setGMemberEmail(String gMemberEmail) {
		GMemberEmail = gMemberEmail;
	}

	public String getGMamberAddress() {
		return GMamberAddress;
	}

	public void setGMamberAddress(String gMamberAddress) {
		GMamberAddress = gMamberAddress;
	}

	public String getGMamberJoinDate() {
		return GMamberJoinDate;
	}

	public void setGMamberJoinDate(String gMamberJoinDate) {
		GMamberJoinDate = gMamberJoinDate;
	}

	@Override
	public String toString() {
		return "Guest [GMemberName=" + GMemberName + ", GMaemberPhone=" + GMaemberPhone + ", GMemberEmail="
				+ GMemberEmail + ", GMamberAddress=" + GMamberAddress + ", GMamberJoinDate=" + GMamberJoinDate + "]";
	}
	
	
}
