package com.myfirst.app.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.myfirst.app.dto.StudentDetails;
import com.myfirst.app.dto.StudentQualification;
import com.myfirst.app.model.StudentLogin;

@Repository
public class StudentRepositoryImpl implements StudentRepository {
     @Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public StudentDetails findStudent(StudentLogin studentLogin) {
		String query="select * from studentDetails where studentId=? and studentName=? and password=?";
		Object[] args= {studentLogin.getStudentId(),studentLogin.getStudentName(),studentLogin.getPassword()};
		StudentDetails studentDetails=null;
		try {
		studentDetails = jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<StudentDetails>(StudentDetails.class), args);
		}catch(Exception e) {
	      System.out.println(e);
		}
		return studentDetails;
	}
	@Override
	public List<StudentQualification> getAllStudentQualifications() {
		String query="select * from studentQualifications";
		 List<StudentQualification> result = jdbcTemplate.query(query,new BeanPropertyRowMapper<StudentQualification>(StudentQualification.class));
		return result;
	}
	@Override
	public int updateStudentDetailsById(StudentDetails stdDetails) {
		String query="update studentDetails set studentName=?,regQualification=?,emailId=?,password=?,address=?,gender=? where studentId=?";
		Object[] params= {stdDetails.getStudentName(),stdDetails.getRegQualification(),stdDetails.getEmailId(),stdDetails.getPassword(),stdDetails.getAddress(),stdDetails.getGender(),stdDetails.getStudentId()};
		int rowCount = jdbcTemplate.update(query,params);
		return rowCount;
	}

}
