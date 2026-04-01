package com.ems.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.ems.dto.EmployeeDto;
import com.ems.service.EmployeeService;

@Controller
public class EmployeeController {

	 @Autowired
	    private EmployeeService employeeService;  // ← inject service

	    @GetMapping("/view")
	    public String viewPage() {
	        return "register";
	    }

	    @PostMapping("/save")
	    public String savePage(@ModelAttribute EmployeeDto employeeDto, Model model) {

	        employeeService.saveEmployee(employeeDto);  // ← call service

	        model.addAttribute("successMessage", "Employee Saved Successfully!");
	        return "register";
	    }
}