package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("Member")
public class Member {
	private String member_id;
	private String member_name;
	private String member_passwd;
	private String member_phone;
	private String member_email;
	private String member_gender;
	private String member_birthday;
	private String member_post;
	private String member_address1;
	private String member_address2;
	private String member_nickname;
	private String member_sns;
	private String member_status;
	private String member_joindate;
	private String member_withdrawal;
	
	private String MemberId;
	private String MemberName;
	private String MameberPasswd;
	private String MemberPhone;
	private String MemberEmail;
	private String MemberAddress;
	private String MemberSns;
	private String MameberStatus;
	private String MemberJoinDate;
	private String MemberWithdrawal;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String member_id, String member_name, String member_passwd, String member_phone, String member_email,
			String member_gender, String member_birthday, String member_post, String member_address1,
			String member_address2, String member_nickname, String member_sns, String member_status,
			String member_joindate, String member_withdrawal, String memberId, String memberName, String mameberPasswd,
			String memberPhone, String memberEmail, String memberAddress, String memberSns, String mameberStatus,
			String memberJoinDate, String memberWithdrawal) {
		super();
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_passwd = member_passwd;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_gender = member_gender;
		this.member_birthday = member_birthday;
		this.member_post = member_post;
		this.member_address1 = member_address1;
		this.member_address2 = member_address2;
		this.member_nickname = member_nickname;
		this.member_sns = member_sns;
		this.member_status = member_status;
		this.member_joindate = member_joindate;
		this.member_withdrawal = member_withdrawal;
		MemberId = memberId;
		MemberName = memberName;
		MameberPasswd = mameberPasswd;
		MemberPhone = memberPhone;
		MemberEmail = memberEmail;
		MemberAddress = memberAddress;
		MemberSns = memberSns;
		MameberStatus = mameberStatus;
		MemberJoinDate = memberJoinDate;
		MemberWithdrawal = memberWithdrawal;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_passwd() {
		return member_passwd;
	}

	public void setMember_passwd(String member_passwd) {
		this.member_passwd = member_passwd;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_birthday() {
		return member_birthday;
	}

	public void setMember_birthday(String member_birthday) {
		this.member_birthday = member_birthday;
	}

	public String getMember_post() {
		return member_post;
	}

	public void setMember_post(String member_post) {
		this.member_post = member_post;
	}

	public String getMember_address1() {
		return member_address1;
	}

	public void setMember_address1(String member_address1) {
		this.member_address1 = member_address1;
	}

	public String getMember_address2() {
		return member_address2;
	}

	public void setMember_address2(String member_address2) {
		this.member_address2 = member_address2;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getMember_sns() {
		return member_sns;
	}

	public void setMember_sns(String member_sns) {
		this.member_sns = member_sns;
	}

	public String getMember_status() {
		return member_status;
	}

	public void setMember_status(String member_status) {
		this.member_status = member_status;
	}

	public String getMember_joindate() {
		return member_joindate;
	}

	public void setMember_joindate(String member_joindate) {
		this.member_joindate = member_joindate;
	}

	public String getMember_withdrawal() {
		return member_withdrawal;
	}

	public void setMember_withdrawal(String member_withdrawal) {
		this.member_withdrawal = member_withdrawal;
	}

	public String getMemberId() {
		return MemberId;
	}

	public void setMemberId(String memberId) {
		MemberId = memberId;
	}

	public String getMemberName() {
		return MemberName;
	}

	public void setMemberName(String memberName) {
		MemberName = memberName;
	}

	public String getMameberPasswd() {
		return MameberPasswd;
	}

	public void setMameberPasswd(String mameberPasswd) {
		MameberPasswd = mameberPasswd;
	}

	public String getMemberPhone() {
		return MemberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		MemberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return MemberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		MemberEmail = memberEmail;
	}

	public String getMemberAddress() {
		return MemberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		MemberAddress = memberAddress;
	}

	public String getMemberSns() {
		return MemberSns;
	}

	public void setMemberSns(String memberSns) {
		MemberSns = memberSns;
	}

	public String getMameberStatus() {
		return MameberStatus;
	}

	public void setMameberStatus(String mameberStatus) {
		MameberStatus = mameberStatus;
	}

	public String getMemberJoinDate() {
		return MemberJoinDate;
	}

	public void setMemberJoinDate(String memberJoinDate) {
		MemberJoinDate = memberJoinDate;
	}

	public String getMemberWithdrawal() {
		return MemberWithdrawal;
	}

	public void setMemberWithdrawal(String memberWithdrawal) {
		MemberWithdrawal = memberWithdrawal;
	}

	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_name=" + member_name + ", member_passwd=" + member_passwd
				+ ", member_phone=" + member_phone + ", member_email=" + member_email + ", member_gender="
				+ member_gender + ", member_birthday=" + member_birthday + ", member_post=" + member_post
				+ ", member_address1=" + member_address1 + ", member_address2=" + member_address2 + ", member_nickname="
				+ member_nickname + ", member_sns=" + member_sns + ", member_status=" + member_status
				+ ", member_joindate=" + member_joindate + ", member_withdrawal=" + member_withdrawal + ", MemberId="
				+ MemberId + ", MemberName=" + MemberName + ", MameberPasswd=" + MameberPasswd + ", MemberPhone="
				+ MemberPhone + ", MemberEmail=" + MemberEmail + ", MemberAddress=" + MemberAddress + ", MemberSns="
				+ MemberSns + ", MameberStatus=" + MameberStatus + ", MemberJoinDate=" + MemberJoinDate
				+ ", MemberWithdrawal=" + MemberWithdrawal + "]";
	}

	
	
}
