package com.myfirst.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myfirst.app.dto.StudentDetails;
import com.myfirst.app.dto.StudentQualification;
import com.myfirst.app.model.StudentLogin;
import com.myfirst.app.repository.StudentRepositoryImpl;

@Service 
public class StudentServiceImpl implements StudentService {
	@Autowired
    private StudentRepositoryImpl studentRepositoryImpl;
	@Override
	public StudentDetails findStudent(StudentLogin studentLogin) {
		StudentDetails studentDetails = studentRepositoryImpl.findStudent(studentLogin);
		return studentDetails;
	}
	@Override
	public List<StudentQualification> getAllStudentQualifications() {
		List<StudentQualification> result = studentRepositoryImpl.getAllStudentQualifications();
		return result;
	}
	@Override
	public int updateStudentDetailsById(StudentDetails studentDetails) {
		int rowCount = studentRepositoryImpl.updateStudentDetailsById(studentDetails);
		return rowCount;
	}

}
