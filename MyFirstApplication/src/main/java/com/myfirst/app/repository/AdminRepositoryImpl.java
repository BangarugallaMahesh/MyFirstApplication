package com.myfirst.app.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.myfirst.app.dto.AdminDTO;
import com.myfirst.app.dto.StudentDetails;
import com.myfirst.app.dto.StudentQualification;
import com.myfirst.app.dto.StudentSubjectDetails;
@Repository
public class AdminRepositoryImpl implements AdminRepository {

	  @Autowired
	 private JdbcTemplate jdbcTemplate;
	 
	@Override
	public List<AdminDTO> getAdminDetails(String userName,String password) {
		
		String query="select * from Admin where userName=? and password=?";
		Object[] args= {userName,password};
          List<AdminDTO> result = jdbcTemplate.query(query,new BeanPropertyRowMapper<AdminDTO>(AdminDTO.class),args);

		return result;
	}

	@Override
	public List<StudentQualification> getAllStudentQualifications() {
		String query="select * from studentQualifications";
		 List<StudentQualification> result = jdbcTemplate.query(query,new BeanPropertyRowMapper<StudentQualification>(StudentQualification.class));
		return result;
	}

	@Override
	public int insertstudentDetails(StudentDetails st) {
		//check student is available or not
		String checkStudent="select studentId from StudentDetails where studentId=?";
		Object[] checkStudentParams= {st.getStudentId()};
		List<StudentDetails> checkStudentDetails = jdbcTemplate.query(checkStudent, new BeanPropertyRowMapper<StudentDetails>(StudentDetails.class), checkStudentParams);
		 String studentId="";
		 int noOfRows=0;
		for(StudentDetails eachStudentId:checkStudentDetails)
		{
			studentId=eachStudentId.getStudentId();
		}
		if(!studentId.equalsIgnoreCase(st.getStudentId()) || studentId=="") {
		String query="insert into studentDetails(studentId,studentName,regQualification,password) values(?,?,?,?)";
		Object[] params= {st.getStudentId(),st.getStudentName(),st.getRegQualification(),st.getPassword()};
		 noOfRows = jdbcTemplate.update(query, params);
		}
		return noOfRows;
	}

	@Override
	public List<StudentDetails> findByStudentId(String studentId) {
          String query="select * from studentDetails where studentId=?";
          Object[] params= {studentId};
           List<StudentDetails> studentDetails = jdbcTemplate.query(query, new BeanPropertyRowMapper<StudentDetails>(StudentDetails.class), params);
     
		return studentDetails;
	}

	@Override
	public List<StudentDetails> findAllStudentDetails() {
		String query="select studentId,studentName,regQualification,password from studentdetails order by sequenceNo desc";
	 List<StudentDetails> listOfStudents = jdbcTemplate.query(query, new BeanPropertyRowMapper<StudentDetails>(StudentDetails.class));
		return listOfStudents;
	}

	@Override
	public int deleteStudentDetails(String studentId) {
		String query="delete from studentDetails where studentId=?";
		Object[] params= {studentId};
		int noOfRows=jdbcTemplate.update(query, params);
		return noOfRows;
		
	}

	@Override
	public int updateStudentDetails(StudentDetails studentDetails) {
		System.out.println("studentDetails======"+studentDetails);
		String query="update studentDetails set studentName=?,regQualification=?,password=? where studentId=?";
		Object[] params= {studentDetails.getStudentName(),studentDetails.getRegQualification(),studentDetails.getPassword(),studentDetails.getStudentId()};
		return jdbcTemplate.update(query, params);
	}

	@Override
	public List<StudentSubjectDetails> studentSubjectDetails(String qualification) {
		String query="select * from studentSubjectDetails where qualificationType=? order by sequenceNo";
		Object[] params= {qualification};
		
		return jdbcTemplate.query(query,new BeanPropertyRowMapper<StudentSubjectDetails>(StudentSubjectDetails.class), params);
	}
   
}
