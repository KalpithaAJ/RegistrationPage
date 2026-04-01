package com.ems.service;

import com.ems.dto.EmployeeDto;
import java.util.List;

public interface EmployeeService {

    // Save employee
    public void saveEmployee(EmployeeDto employeeDto);

    // Get all employees
    public List<EmployeeDto> getAllEmployees();

    // Get employee by ID
    public EmployeeDto getEmployeeById(int id);

    // Update employee
    public void updateEmployee(EmployeeDto employeeDto);

    // Delete employee
    public void deleteEmployee(int id);

}