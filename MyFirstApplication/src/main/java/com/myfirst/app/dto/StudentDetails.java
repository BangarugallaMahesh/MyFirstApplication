package com.myfirst.app.dto;

public class StudentDetails {
	
	private String studentId;
	private String studentName;
	private String regQualification;
	private String emailId;
	private String password;
	private String address;
	private String gender;
	
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getRegQualification() {
		return regQualification;
	}
	public void setRegQualification(String regQualification) {
		this.regQualification = regQualification;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "StudentDetails [studentId=" + studentId + ", studentName=" + studentName + ", regQualification="
				+ regQualification + ", emailId=" + emailId + ", password=" + password + ", address=" + address
				+ ", gender=" + gender + "]";
	}
	

}
