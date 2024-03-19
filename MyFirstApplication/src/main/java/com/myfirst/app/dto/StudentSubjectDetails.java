package com.myfirst.app.dto;

public class StudentSubjectDetails {
	public int sequenceNo;
	public String qualificationType;
	public int qualificationYear;
	public String subjectName;
	public String courseCode;
	public int semester;
	public int getSequenceNo() {
		return sequenceNo;
	}
	public void setSequenceNo(int sequenceNo) {
		this.sequenceNo = sequenceNo;
	}
	public String getQualificationType() {
		return qualificationType;
	}
	public void setQualificationType(String qualificationType) {
		this.qualificationType = qualificationType;
	}
	public int getQualificationYear() {
		return qualificationYear;
	}
	public void setQualificationYear(int qualificationYear) {
		this.qualificationYear = qualificationYear;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getCourseCode() {
		return courseCode;
	}
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	@Override
	public String toString() {
		return "StudentSubjectDetails [sequenceNo=" + sequenceNo + ", qualificationType=" + qualificationType
				+ ", qualificationYear=" + qualificationYear + ", subjectName=" + subjectName + ", courseCode="
				+ courseCode + ", semester=" + semester + "]";
	}
	

}
