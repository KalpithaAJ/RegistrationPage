package com.ems.repository;

import com.ems.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

    // JpaRepository gives these methods for FREE:
    // save()       → save or update employee
    // findAll()    → get all employees
    // findById()   → get employee by id
    // deleteById() → delete employee by id
    // count()      → count total employees
    // existsById() → check if employee exists

}