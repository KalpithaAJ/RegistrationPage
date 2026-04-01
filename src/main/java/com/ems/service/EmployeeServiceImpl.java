package com.ems.service;

import com.ems.dto.EmployeeDto;
import com.ems.entity.Employee;
import com.ems.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    // Save Employee
    @Override
    public void saveEmployee(EmployeeDto employeeDto) {
        Employee employee = new Employee();
        employee.setName(employeeDto.getName());     // ✅ No underscores
        employee.setEmail(employeeDto.getEmail());   // ✅ No underscores
        employee.setMobile(employeeDto.getMobile()); // ✅ No underscores
        employeeRepository.save(employee);
        System.out.println("Employee Saved: " + employeeDto.getName());
    }

    // Get All Employees
    @Override
    public List<EmployeeDto> getAllEmployees() {
        List<Employee> employees = employeeRepository.findAll();
        return employees.stream().map(emp -> {
            EmployeeDto dto = new EmployeeDto();
            dto.setId(emp.getId());         // ✅ No underscores
            dto.setName(emp.getName());     // ✅ No underscores
            dto.setEmail(emp.getEmail());   // ✅ No underscores
            dto.setMobile(emp.getMobile()); // ✅ No underscores
            return dto;
        }).collect(Collectors.toList());
    }

    // Get Employee By ID
    @Override
    public EmployeeDto getEmployeeById(int id) {
        Employee employee = employeeRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Employee not found: " + id));
        EmployeeDto dto = new EmployeeDto();
        dto.setId(employee.getId());
        dto.setName(employee.getName());
        dto.setEmail(employee.getEmail());
        dto.setMobile(employee.getMobile());
        return dto;
    }

    // Update Employee
    @Override
    public void updateEmployee(EmployeeDto employeeDto) {
        Employee employee = employeeRepository.findById(employeeDto.getId())
                .orElseThrow(() -> new RuntimeException("Employee not found"));
        employee.setName(employeeDto.getName());
        employee.setEmail(employeeDto.getEmail());
        employee.setMobile(employeeDto.getMobile());
        employeeRepository.save(employee);
        System.out.println("Employee Updated: " + employeeDto.getName());
    }

    // Delete Employee
    @Override
    public void deleteEmployee(int id) {
        employeeRepository.deleteById(id);
        System.out.println("Employee Deleted with ID: " + id);
    }
}