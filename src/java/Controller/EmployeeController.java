/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : EmployeeController.java
 * Author     : LiverEatnJohnson
 * Date       : Mar 6 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package controller;

import dto.EmployeeDTO;
import entity.Department;
import entity.Employee;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jpa.DepartmentJpaController;
import jpa.EmployeeJpaController;
import jpa.exceptions.IllegalOrphanException;
import jpa.exceptions.NonexistentEntityException;

/**
 *
 * @author LiverEatnJohnson
 */
public class EmployeeController {

    private EmployeeJpaController employeeJpaController;
    private DepartmentJpaController departmentJpaController;

    /**
     * Basic Constructor
     */
    public EmployeeController() {
    }

    /**
     * @param employeeJpaController EmployeeJpaController
     */
    public void setEmployeeJpaController(EmployeeJpaController employeeJpaController) {
        this.employeeJpaController = employeeJpaController;
    }

    public void setDepartmentJpaContorller(DepartmentJpaController departmentJpaController) {
        this.departmentJpaController = departmentJpaController;
    }

    public void saveEmployee(EmployeeDTO dto) {
        Employee employee = new Employee();
        //employee.setId(dto.getId()); Generated
        employee.setFirstName(dto.getFirstName());
        employee.setLastName(dto.getLastName());
        employee.setTitle(dto.getTitle());
        employee.setEmail(dto.getEmail());
        employee.setPhone(dto.getPhone());
        employee.setOffice(dto.getOffice());
        Department dep = departmentJpaController.findDepartment(dto.getDepartmentId());
        if (dep == null) {
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, "MISSING DEPARTMENT");
            return;
        }
        employee.setDepartment(dep);
        try {
            employeeJpaController.create(employee);
        } catch (IllegalOrphanException ex) {
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Employee> getList() {
        return employeeJpaController.findEmployeeEntities();
    }

    /**
     * @param id Long
     * @return DonorVO
     */
    public Employee getEmployee(Long id) {
        Employee e = employeeJpaController.findEmployee(id);
        if (e != null) {
            return e;
        }
        return null;
    }

    /**
     * @param id Long
     * @throws NonexistentEntityException
     */
    public void deleteEmployee(Long id) {
        try {
            try {
                employeeJpaController.destroy(id);
            } catch (IllegalOrphanException ex) {
                Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * @param dto EmployeeDTO
     */
    public void editEmployee(EmployeeDTO dto) {
        Employee employee = employeeJpaController.findEmployee(dto.getId());

        if (employee != null) {
            employee.setFirstName(dto.getFirstName());
            employee.setLastName(dto.getLastName());
            employee.setTitle(dto.getTitle());
            employee.setEmail(dto.getEmail());
            employee.setPhone(dto.getPhone());
            employee.setOffice(dto.getOffice());
            Department d = departmentJpaController.findDepartment(dto.getDepartmentId());
            employee.setDepartment(d);

            try {
                employeeJpaController.edit(employee);
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
