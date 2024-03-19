package com.myfisrt.app.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myfirst.app.dto.AdminDTO;
import com.myfirst.app.dto.StudentDetails;
import com.myfirst.app.dto.StudentQualification;
import com.myfirst.app.dto.StudentSubjectDetails;
import com.myfirst.app.model.AdminLogin;
import com.myfirst.app.service.AdminServiceImpl;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;



@Controller
@SessionAttributes({"adminLogin"})
public class AdminController {
	
	@Autowired
	public AdminServiceImpl adminServiceImpl;
	
	@ModelAttribute("adminLogin")
	public AdminLogin adminLoginSession() {
		
		return new AdminLogin();
	}
	@GetMapping("/admin")
	public String adminLogin(@ModelAttribute("adminLogin") AdminLogin adminLogin) {
		
		return "admin-login";
	}
	@GetMapping("/adminHome")
	public String adminHome(@Valid @ModelAttribute("adminLogin") AdminLogin adminLogin,BindingResult result,HttpSession session,
			Model model, @RequestParam Map<String, String> requestParams) {
	 System.out.println("admin login="+adminLogin);
	   if(requestParams.containsKey("_ERROR_MESSAGE_")) {
		   model.addAttribute("_ERROR_MESSAGE_", requestParams.get("_ERROR_MESSAGE_"));
	   }else if(requestParams.containsKey("_SUCCESS_MESSAGE_")) {
		   model.addAttribute("_SUCCESS_MESSAGE_", requestParams.get("_SUCCESS_MESSAGE_"));
	   }
	// System.out.println("successMsg= or errorMsg=="+model);
		if(result.hasErrors()) {
			List<ObjectError> listOfErrors = result.getAllErrors();
			//System.out.println("result=="+result);
			model.addAttribute("listOfErrors", listOfErrors);
			return "admin-login";
		}
		
		String userName=adminLogin.getUserName();
		String password=adminLogin.getPassword();
		String resultPage="";
		List<AdminDTO> adminList= adminServiceImpl.getAdminDetails(userName, password);
		resultPage="admin-login";
		String adminName="";
		String adminPassword="";
		for(AdminDTO eachAdmin:adminList) {
			adminName=eachAdmin.getUserName();
			adminPassword=eachAdmin.getPassword();
			
			if(userName.equals(adminName) && password.equals(adminPassword)) {
				List<StudentDetails> studentDetails = adminServiceImpl.findAllStudentDetails();
				 //System.out.println("studentdeatils="+studentDetails);
				model.addAttribute("studentDetails", studentDetails);
				resultPage="admin-home";
			}else {
				resultPage="admin-login";
			}
		}
		 
			
	return resultPage;
	}
	
	@GetMapping("/addStudent")
	public String addStudent(@ModelAttribute("adminLogin")AdminLogin adminLogin,Model model) {
		System.out.println(adminLogin);
		 List<StudentQualification> result = adminServiceImpl.getAllStudentQualifications();
		  model.addAttribute("studentQualificationList", result);
		  System.out.println("result=="+result);
		return "add-student";
	}

	@GetMapping("/adminLogOut")
	public String adminLogOut(@ModelAttribute("adminLogin")AdminLogin adminLogin,SessionStatus status) {
		System.out.println("adminLogin before session=="+adminLogin);
		status.setComplete();
		System.out.println("adminLogin after session=="+adminLogin);
		return "admin-login";
	}
	@PostMapping("/processStudentDetails")
	public String processStudentDetails(@ModelAttribute("studentDetails") StudentDetails studentDetails,Model model,RedirectAttributes redirectAttributes) {
		
           int noOfRows = adminServiceImpl.insertstudentDetails(studentDetails);
           List<StudentQualification> result = adminServiceImpl.getAllStudentQualifications();
           model.addAttribute("studentQualificationList", result);
          // studentDetails=adminServiceImpl.findByStudentId(studentDetails.getStudentId());
           System.out.println("studentDetails========="+studentDetails);
           if(noOfRows==0) {
 	    	  redirectAttributes.addAttribute("_ERROR_MESSAGE_", "Error While Adding The Student Alereday Existed Id"+studentDetails.getStudentId()+" ["+studentDetails.getStudentName()+" ] ");  
 	      }else {
 	    	  redirectAttributes.addAttribute("_SUCCESS_MESSAGE_", "Student Added Successfully ");
 	      }
		return "redirect:/adminHome";
	}
	@PostMapping("/deleteStudentForm")
	public String deleteStudentDetails(@RequestParam("studentId")String studentId,Model model,RedirectAttributes redirectAttributes) {
		System.out.println("studentId="+studentId);
		  int noOfRows=adminServiceImpl.deleteStudentDetails(studentId);
		  if(noOfRows!=1) {
	    	  redirectAttributes.addAttribute("_ERROR_MESSAGE_", "Error While Deleting Student With id "+studentId);  
	      }else {
	    	  redirectAttributes.addAttribute("_SUCCESS_MESSAGE_", "Deleted Student Details Successfully With id "+studentId);
	      }
		return "redirect:/adminHome";
	}
	@PostMapping("/studentUpdateForm")
	public String updateStudentForm(@RequestParam("studentId")String studentId,@ModelAttribute("studentDetails") StudentDetails studentDetails,Model model) {
		   List<StudentDetails> studentDetailsById = adminServiceImpl.findByStudentId(studentId);
		  List<StudentQualification> result = adminServiceImpl.getAllStudentQualifications();
          model.addAttribute("studentQualificationList", result);
          model.addAttribute("studentDetailsById", studentDetailsById);
          
		return "/update-student";
	}
	@PostMapping("/updateStudentDetails")
	public String updateStudentDeatails(@ModelAttribute("studentDetails")StudentDetails studentDetails,RedirectAttributes  redirectAttributes) {
	      int noOfRows=adminServiceImpl.updateStudentDetails(studentDetails);
	      if(noOfRows!=1) {
	    	  redirectAttributes.addAttribute("_ERROR_MESSAGE_", "Error While Updating Student With id "+studentDetails.getStudentId());  
	      }else {
	    	  redirectAttributes.addAttribute("_SUCCESS_MESSAGE_", "Updated Student Details Successfully With id "+studentDetails.getStudentId());
	      }
	      return "redirect:/adminHome";
	}
	@GetMapping("/addStudentResutls")
	public String addStudentResults(@ModelAttribute("studentDetails")StudentDetails studentDetails,Model model) {
		List<StudentDetails> studentsList = adminServiceImpl.findAllStudentDetails();
		List<StudentQualification> studentQualificationList = adminServiceImpl.getAllStudentQualifications();
		model.addAttribute("studentsLists", studentsList);
		model.addAttribute("studentQualifications", studentQualificationList);
		return "add-student-result";
	}
	@PostMapping("/processAddStudentResult")
	public String processAddStudentResults(@RequestParam("studentId")String studentId,@RequestParam("qualification")String qualification,@ModelAttribute("studentDetails")StudentDetails studentDetails,Model model) {
		 List<StudentDetails> studentDetailsList = adminServiceImpl.findByStudentId(studentId);
		 List<StudentSubjectDetails> subjectsList = adminServiceImpl.studentSubjectDetails(qualification);
		 model.addAttribute("studentDetails", studentDetailsList);
		 model.addAttribute("subjectsList", subjectsList);
		 System.out.println("subjectsList==="+subjectsList);
		return "add-student-result-form";
	}
	
}
