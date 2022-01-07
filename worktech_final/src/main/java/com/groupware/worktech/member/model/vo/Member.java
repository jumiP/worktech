package com.groupware.worktech.member.model.vo;

import java.sql.Date;

public class Member {

	private String mNo;
	private String email;
	private String name;
	private String pwd;
	private String jobGrade;
	private Date birthDay;
	private String phone;
	private String address;
	private String mGrade; // 회원 등급 : user/admin
	private int dNo;
	private String dName;
	private Date hireDate;
	private String pUrl; // 프로필 사진 경로
	private String mStatus;
	
	public Member() {}

	public Member(String mNo, String email, String name, String pwd, String jobGrade, Date birthDay, String phone,
			String address, String mGrade, int dNo, String dName, Date hireDate, String pUrl, String mStatus) {
		super();
		this.mNo = mNo;
		this.email = email;
		this.name = name;
		this.pwd = pwd;
		this.jobGrade = jobGrade;
		this.birthDay = birthDay;
		this.phone = phone;
		this.address = address;
		this.mGrade = mGrade;
		this.dNo = dNo;
		this.dName = dName;
		this.hireDate = hireDate;
		this.pUrl = pUrl;
		this.mStatus = mStatus;
	}

	public String getmNo() {
		return mNo;
	}

	public void setmNo(String mNo) {
		this.mNo = mNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getJobGrade() {
		return jobGrade;
	}

	public void setJobGrade(String jobGrade) {
		this.jobGrade = jobGrade;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getmGrade() {
		return mGrade;
	}

	public void setmGrade(String mGrade) {
		this.mGrade = mGrade;
	}

	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public String getpUrl() {
		return pUrl;
	}

	public void setpUrl(String pUrl) {
		this.pUrl = pUrl;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", email=" + email + ", name=" + name + ", pwd=" + pwd + ", jobGrade=" + jobGrade
				+ ", birthDay=" + birthDay + ", phone=" + phone + ", address=" + address + ", mGrade=" + mGrade
				+ ", dNo=" + dNo + ", dName=" + dName + ", hireDate=" + hireDate + ", pUrl=" + pUrl + ", mStatus="
				+ mStatus + "]";
	}

}
