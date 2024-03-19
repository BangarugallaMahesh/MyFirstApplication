package com.myfirst.app.model;

import jakarta.validation.constraints.NotBlank;

public class AdminLogin {
	@NotBlank(message = "Please Enter User Name")
	private String userName;
	@NotBlank(message = "Please Enter Password")
	private String password;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "AdminLogin [userName=" + userName + ", password=" + password + "]";
	}
	

}
