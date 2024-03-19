package com.myfirst.app.service;

import java.util.List;

import com.myfirst.app.dto.StudentDetails;
import com.myfirst.app.dto.StudentQualification;
import com.myfirst.app.model.StudentLogin;

public interface StudentService {
 public	StudentDetails findStudent(StudentLogin studentLogin);
 public List<StudentQualification> getAllStudentQualifications();
 public int updateStudentDetailsById(StudentDetails stdDetails);
}
