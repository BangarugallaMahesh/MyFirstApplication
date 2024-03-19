package com.myfirst.app.service;

import java.util.List;

import com.myfirst.app.dto.AdminDTO;
import com.myfirst.app.dto.StudentDetails;
import com.myfirst.app.dto.StudentQualification;
import com.myfirst.app.dto.StudentSubjectDetails;

public interface AdminService {
  public List<AdminDTO> getAdminDetails(String userName,String password);
  public List<StudentQualification> getAllStudentQualifications();
  public int insertstudentDetails(StudentDetails studentDetails);
  public List<StudentDetails> findByStudentId(String studentId);
  public List<StudentDetails> findAllStudentDetails();
  public int deleteStudentDetails(String studentId);
  public int updateStudentDetails(StudentDetails studentDetails);
  public List<StudentSubjectDetails> studentSubjectDetails(String qualification);
}
