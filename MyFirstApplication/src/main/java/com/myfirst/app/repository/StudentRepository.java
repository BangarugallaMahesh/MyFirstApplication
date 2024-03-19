package com.myfirst.app.repository;

import java.util.List;

import com.myfirst.app.dto.StudentDetails;
import com.myfirst.app.dto.StudentQualification;
import com.myfirst.app.model.StudentLogin;

public interface StudentRepository {
	public StudentDetails findStudent(StudentLogin studentLogin);
	public List<StudentQualification> getAllStudentQualifications();
	public int updateStudentDetailsById(StudentDetails studentDetails);

}
