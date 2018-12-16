package com.dto;

public class MemberDTO {
	
	private String userid;
	private String username;
	private String passwd;
	private String post;
	private String addr1;
	private String addr2;
	private String phone;
	private String birth;
	private String email;
	private String licensetype;
	private String licensenum;
	private int mlevel;

	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String userid, String username, String passwd, String post, String addr1, String addr2, String phone,
			String birth, String email, String licensetype, String licensenum, int mlevel) {
		super();
		this.userid = userid;
		this.username = username;
		this.passwd = passwd;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
		this.licensetype = licensetype;
		this.licensenum = licensenum;
		this.mlevel = mlevel;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLicensetype() {
		return licensetype;
	}

	public void setLicensetype(String licensetype) {
		this.licensetype = licensetype;
	}

	public String getLicensenum() {
		return licensenum;
	}

	public void setLicensenum(String licensenum) {
		this.licensenum = licensenum;
	}

	public int getMlevel() {
		return mlevel;
	}

	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}

	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", username=" + username + ", passwd=" + passwd + ", post=" + post
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", phone=" + phone + ", birth=" + birth + ", email=" + email
				+ ", licensetype=" + licensetype + ", licensenum=" + licensenum + ", mlevel=" + mlevel + "]";
	}
	
}
