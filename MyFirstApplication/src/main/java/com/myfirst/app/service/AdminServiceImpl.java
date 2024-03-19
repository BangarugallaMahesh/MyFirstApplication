package com.myfirst.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myfirst.app.dto.AdminDTO;
import com.myfirst.app.dto.StudentDetails;
import com.myfirst.app.dto.StudentQualification;
import com.myfirst.app.dto.StudentSubjectDetails;
import com.myfirst.app.repository.AdminRepositoryImpl;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired(required = true)
	public AdminRepositoryImpl adminRepositoryImpl;
	@Override
	public List<AdminDTO> getAdminDetails(String userName,String password) {
		 List<AdminDTO> result = adminRepositoryImpl.getAdminDetails(userName,password);
		return result;
	}
	@Override
	public List<StudentQualification> getAllStudentQualifications() {
		List<StudentQualification> result = adminRepositoryImpl.getAllStudentQualifications();
		return result;
	}
	@Override
	public int insertstudentDetails(StudentDetails studentDetails) {
		 int noOfRows=adminRepositoryImpl.insertstudentDetails(studentDetails);
		return noOfRows;
	}
	@Override
	public List<StudentDetails> findByStudentId(String studentId) {
		List<StudentDetails> studentDetails = adminRepositoryImpl.findByStudentId(studentId);
		return studentDetails;
	}
	@Override
	public List<StudentDetails> findAllStudentDetails() {
		List<StudentDetails> studentDetails = adminRepositoryImpl.findAllStudentDetails();
		return studentDetails;
	}
	@Override
	public int deleteStudentDetails(String studentId) {
		int noOfRows = adminRepositoryImpl.deleteStudentDetails(studentId);
		return noOfRows;
		
	}
	@Override
	public int updateStudentDetails(StudentDetails studentDetails) {
		
		return adminRepositoryImpl.updateStudentDetails(studentDetails);
	}
	@Override
	public List<StudentSubjectDetails> studentSubjectDetails(String qualification) {
		
		return adminRepositoryImpl.studentSubjectDetails(qualification);
	}
	
	

}
