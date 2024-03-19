package com.myfirst.app.model;

import jakarta.validation.constraints.NotBlank;

public class StudentLogin {
	@NotBlank(message="Please Enter StudentId")
	String studentId;
	@NotBlank(message="Please Enter Student Name")
	String studentName;
	@NotBlank(message="Please Enter Student Password")
	String password;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "StudentLogin [studentId=" + studentId + ", studentName=" + studentName + ", password=" + password + "]";
	}

}
