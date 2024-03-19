package com.myfisrt.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MyFirstAppController {
	
	@GetMapping("/")
	public String index() {
		
		return "index";
	}
	@GetMapping("/contact")
	public String contactPage() {
		
		return "contact";
	}

}
