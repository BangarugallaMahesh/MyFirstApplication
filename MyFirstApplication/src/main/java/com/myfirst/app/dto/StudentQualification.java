package com.myfirst.app.dto;

public class StudentQualification {
	private String qualificationId;
	private String qualificationName;
	public String getQualificationId() {
		return qualificationId;
	}
	public void setQualificationId(String qualificationId) {
		this.qualificationId = qualificationId;
	}
	public String getQualificationName() {
		return qualificationName;
	}
	public void setQualificationName(String qualificationName) {
		this.qualificationName = qualificationName;
	}
	@Override
	public String toString() {
		return "StudentQualification [qualificationId=" + qualificationId + ", qualificationName=" + qualificationName
				+ "]";
	}
	

}
