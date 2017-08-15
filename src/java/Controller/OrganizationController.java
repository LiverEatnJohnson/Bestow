/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : OrganizationController.java
 * Author     : Bullforg
 * Date       : Feb 27 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package controller;

import dto.OrganizationDTO;
import entity.Employee;
import entity.Organization;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jpa.EmployeeJpaController;
import jpa.OrganizationJpaController;
import jpa.exceptions.IllegalOrphanException;
import jpa.exceptions.NonexistentEntityException;

/**
 * Controller for Organization
 *
 * @author Bullfrog
 */
public class OrganizationController {

    private OrganizationJpaController organizationJpaController;
    private EmployeeJpaController employeeJpaController;

    /**
     * @param organizationJpaController OrganizationJpaController
     */
    public void setOrganizationJpaController(OrganizationJpaController organizationJpaController) {
        this.organizationJpaController = organizationJpaController;
    }

    public void setEmployeeJpaController(EmployeeJpaController employeeJpaController) {
        this.employeeJpaController = employeeJpaController;
    }

    /**
     * @param dto OrganizationDTO
     */
    public void saveOrganization(OrganizationDTO dto) {
        Organization org = new Organization();
        org.setTitle(dto.getTitle());
        org.setAddress(dto.getAddress());
        org.setCity(dto.getCity());
        org.setState(dto.getState());
        org.setZip(dto.getZip());
        org.setPhone(dto.getPhone());
        org.setTollFree(dto.getTollFree());
        org.setFax(dto.getFax());
        Employee tempDirector = null;
        if (dto.getDirectorId() != null) {
            tempDirector = employeeJpaController.findEmployee(dto.getDirectorId());
        }
        org.setDirector(tempDirector);
        org.setEmailAddress(dto.getEmailAddress());

        organizationJpaController.create(org);
    }

    public List<Organization> getList() {
        return organizationJpaController.findOrganizationEntities();
    }

    /**
     * @param id Long
     * @return DonorVO
     */
    public Organization getOrganization(int id) {
        Organization org = organizationJpaController.findOrganization(id);
        if (org != null) {
            return org;
        }

        return null;
    }

    /**
     * @param id Long
     * @throws NonexistentEntityException
     */
    public void deleteOrganization(int id) {
        try {
            try {
                organizationJpaController.destroy(id);
            } catch (IllegalOrphanException ex) {
                Logger.getLogger(OrganizationController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(OrganizationController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Edit an organization... only the title can change.
     *
     * @param dto OrganizationDTO
     */
    public void editOrganization(OrganizationDTO dto) {
        Organization org = organizationJpaController.findOrganization(dto.getId());
        if (org != null) {
            org.setTitle(dto.getTitle());
            org.setAddress(dto.getAddress());
            org.setCity(dto.getCity());
            org.setState(dto.getState());
            org.setZip(dto.getZip());
            org.setPhone(dto.getPhone());
            org.setTollFree(dto.getTollFree());
            org.setFax(dto.getFax());
            Employee tempDirector = null;
            if (dto.getDirectorId() != null) {
                tempDirector = employeeJpaController.findEmployee(dto.getDirectorId());
            }
            org.setDirector(tempDirector);
            org.setEmailAddress(dto.getEmailAddress());
            try {
                organizationJpaController.edit(org);
            } catch (IllegalOrphanException ex) {
                Logger.getLogger(OrganizationController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(OrganizationController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(OrganizationController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
