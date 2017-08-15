/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : DepartmentController.java
 * Author     : Bullforg
 * Date       : Mar 3 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package controller;

import dto.DepartmentDTO;
import entity.Department;
import entity.Employee;
import entity.Organization;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jpa.DepartmentJpaController;
import jpa.EmployeeJpaController;
import jpa.OrganizationJpaController;
import jpa.exceptions.IllegalOrphanException;
import jpa.exceptions.NonexistentEntityException;

/**
 * Controller for Department
 *
 * @author Bullfrog
 */
public class DepartmentController {

    private DepartmentJpaController departmentJpaController;
    private OrganizationJpaController organizationJpaController;
    private EmployeeJpaController employeeJpaController;

    public void setOrganizationJpaController(OrganizationJpaController organizationJpaController) {
        this.organizationJpaController = organizationJpaController;
    }

    /**
     * @param departmentJpaController
     */
    public void setDepartmentJpaController(DepartmentJpaController departmentJpaController) {
        this.departmentJpaController = departmentJpaController;
    }

    public void setEmployeeJpaController(EmployeeJpaController employeeJpaController) {
        this.employeeJpaController = employeeJpaController;
    }

    /**
     * Basic Constructor
     */
    public DepartmentController() {
    }

    public void saveDepartment(DepartmentDTO dto) {
        Department dep = new Department();
        dep.setTitle(dto.getTitle());
        Employee tempDirector = null;
        if (dto.getDirectorId() != null) {
            tempDirector = employeeJpaController.findEmployee(dto.getDirectorId());
        }
        Organization org = organizationJpaController.findOrganization(dto.getOrganizationId());
        if (org == null) {
            Logger.getLogger(DepartmentController.class.getName()).log(Level.SEVERE, "MISSING ORGANIZATION");
            return;
        }
        dep.setOrganization(org);
        departmentJpaController.create(dep);
    }

    public List<Department> getList() {
        return departmentJpaController.findDepartmentEntities();
    }

    /**
     * @param id Long
     * @return DonorVO
     */
    public Department getDepartment(int id) {
        Department dept = departmentJpaController.findDepartment(id);
        if (dept != null) {
            return dept;
        }
        return null;
    }

    /**
     * @param id Long
     * @throws NonexistentEntityException
     */
    public void deleteDepartment(int id) {
        try {
            try {
                departmentJpaController.destroy(id);
            } catch (IllegalOrphanException ex) {
                Logger.getLogger(DepartmentController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(DepartmentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Edit the department title. Only thing that can change on a department.
     *
     * @param dto DepartmentDTO for edit
     */
    public void editDepartment(DepartmentDTO dto) {
        Department dep = departmentJpaController.findDepartment(dto.getId());
        if (dep != null) {
            dep.setTitle(dto.getTitle());
            Employee tempDirector = null;
            if (dto.getDirectorId() != null) {
                tempDirector = employeeJpaController.findEmployee(dto.getDirectorId());
            }
            dep.setDirector(tempDirector);
            Organization org = organizationJpaController.findOrganization(dto.getOrganizationId());
            dep.setOrganization(org);

            try {
                departmentJpaController.edit(dep);
            } catch (IllegalOrphanException ex) {
                Logger.getLogger(DepartmentController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(DepartmentController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(DepartmentController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
