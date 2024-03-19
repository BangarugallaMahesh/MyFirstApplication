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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myfirst.app.dto.StudentDetails;
import com.myfirst.app.dto.StudentQualification;
import com.myfirst.app.model.StudentLogin;
import com.myfirst.app.service.StudentServiceImpl;

import jakarta.validation.Valid;




@Controller
@SessionAttributes("studentLogin")
public class StudentController {
    @Autowired
	private StudentServiceImpl studentServiceImpl;
	
	@ModelAttribute("studentLogin")
	public StudentLogin studentLoginSession() {
		return new StudentLogin();
	}
	@GetMapping("/student")
	public String studentLogin() {
		return "student-login";
	}
	@GetMapping("/studentHome")
	public String studentHome(@Valid @ModelAttribute("studentLogin")StudentLogin studentLogin,BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<ObjectError> listOfErrors = result.getAllErrors();
			model.addAttribute("listOfErrors", listOfErrors);
			return "student-login";
		}
		StudentDetails studentDetails = studentServiceImpl.findStudent(studentLogin);
		System.out.println(studentDetails);
		 if(studentDetails==null) {
			 model.addAttribute("_ERROR_MESSAGE_", "Student Not Found Please Enter Correct Details");
			 return "student-login";
		 }
		
		return "student-home";
	}
	@GetMapping("/studentProfile")
	public String getMethodName(@ModelAttribute("studentLogin")StudentLogin studentLogin,@ModelAttribute("studentDetails")StudentDetails studentDetailList,Model model,@RequestParam Map<String ,String> requestParams) {
		  StudentDetails studentDetails = studentServiceImpl.findStudent(studentLogin);
		  List<StudentQualification> studentQualificationList = studentServiceImpl.getAllStudentQualifications();
		model.addAttribute("studentDetails", studentDetails);
		model.addAttribute("studentQualificationList", studentQualificationList);
		model.addAttribute("studentDetailsList", studentDetailList);
		//System.out.println("studentDetailList========"+studentDetailList);
		//System.out.println("studentDetails========"+studentDetails);
		if(requestParams.containsKey("_SUCCESS_MESSAGE_")) {
			model.addAttribute("_SUCCESS_MESSAGE_", requestParams.get("_SUCCESS_MESSAGE_"));
		}else if(requestParams.containsKey("_ERROR_MESSAGE_")){
			model.addAttribute("_ERROR_MESSAGE_", requestParams.get("_ERROR_MESSAGE_"));
		}
		return "student-profile";
	}
	@PostMapping("/editStudentDetails")
	public String editStudentDetails(@ModelAttribute("studentDetails") StudentDetails studentDetails,@ModelAttribute("studentLogin") StudentLogin studentLogin,RedirectAttributes redirectAttribute) {
		  int rowCount = studentServiceImpl.updateStudentDetailsById(studentDetails);
		 if(rowCount==1) {
			 redirectAttribute.addAttribute("_SUCCESS_MESSAGE_", "Updated Your Details Successfully");
		 }else {
			 redirectAttribute.addAttribute("_ERROR_MESSAGE_", "Error While Updating Your Details");
		 }
		return "redirect:/studentProfile";
	}
	@GetMapping("/studentResults")
	public String studentResults(@ModelAttribute("studentDetails") StudentDetails studentDetails) {
		return "student-results";
	}
	
	
	@GetMapping("/studentLogOut")
	public String studentLogOut(@ModelAttribute("studentLogin")StudentLogin studentLogin,SessionStatus status) {
		 status.setComplete();
		return "student-login";
	}
	
}
