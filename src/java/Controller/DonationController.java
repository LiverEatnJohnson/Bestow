/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : DepartmentController.java
 * Author     : Bullforg
 * Date       : Apr 30 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package controller;

import dto.DonationDTO;
import dto.ItemDTO;
import entity.Donation;
import entity.Donor;
import entity.Item;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jpa.DepartmentJpaController;
import jpa.DonationJpaController;
import jpa.DonorJpaController;
import jpa.EmployeeJpaController;
import jpa.ItemJpaController;
import jpa.OrganizationJpaController;
import jpa.exceptions.IllegalOrphanException;
import jpa.exceptions.NonexistentEntityException;

/**
 *
 * @author bullfrog
 */
public class DonationController {

    private DonationJpaController donationJpaController;
    private DonorJpaController donorJpaController;
    private EmployeeJpaController employeeJpaController;
    private DepartmentJpaController departmentJpaController;
    private OrganizationJpaController organizationJpaController;
    private ItemJpaController itemJpaController;

    public void setDonationJpaController(DonationJpaController donationJpaController) {
        this.donationJpaController = donationJpaController;
    }

    public void setDonorJpaController(DonorJpaController donorJpaController) {
        this.donorJpaController = donorJpaController;
    }

    public void setEmployeeJpaController(EmployeeJpaController employeeJpaController) {
        this.employeeJpaController = employeeJpaController;
    }

    public void setDepartmentJpaController(DepartmentJpaController departmentJpaController) {
        this.departmentJpaController = departmentJpaController;
    }

    public void setOrganizationJpaController(OrganizationJpaController organizationJpaController) {
        this.organizationJpaController = organizationJpaController;
    }

    public void setItemJpaController(ItemJpaController itemJpaController) {
        this.itemJpaController = itemJpaController;
    }

    public void saveDonation(DonationDTO dto) {
        Donation donation = new Donation();
        // donation.setId(generated);
        donation.setDonationDate(dto.getDonationDate());
        donation.setType(dto.getType());
        donation.setCode(dto.getCode());
        donation.setDonor(donorJpaController.findDonor(dto.getDonorId()));
        donation.setEmployee(employeeJpaController.findEmployee(dto.getEmployeeId()));
        donation.setDepartment(departmentJpaController.findDepartment(dto.getDepartmentId()));
        donationJpaController.create(donation);

        for (ItemDTO i : dto.getItemList()) {
            Item item = new Item();
            // item.setId(generated);
            item.setDonation(donation);
            item.setItem(i.getItem());
            item.setQuantity(i.getQuantity());
            item.setValue(i.getValue());
            itemJpaController.create(item);
        }
    }

    public List<Donation> getList() {
        List<Donation> donList = donationJpaController.findDonationEntities();
        return donList;
    }

    public void deleteDonation(long did) {
        Donation deleteMe = donationJpaController.findDonation(did);
        for (Item kill : deleteMe.getItemList()) {
            try {
                itemJpaController.destroy(kill.getId());
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(DonationController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        try {
            try {
                donationJpaController.destroy(did);
            } catch (IllegalOrphanException ex) {
                Logger.getLogger(DonationController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(DonationController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editDonation(DonationDTO dto) {
        Donation editMe = donationJpaController.findDonation(dto.getId());
        if (editMe != null) {
            // remove all old items
            for (Item kill : editMe.getItemList()) {
                try {
                    itemJpaController.destroy(kill.getId());
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(DonationController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            editMe.setItemList(new ArrayList<Item>());
            Donor donor = donorJpaController.findDonor(dto.getDonorId());
            editMe.setDonor(donor);
            editMe.setDepartment(departmentJpaController.findDepartment(dto.getDepartmentId()));
            editMe.setEmployee(employeeJpaController.findEmployee(dto.getEmployeeId()));
            editMe.setDonationDate(dto.getDonationDate());
            editMe.setType(dto.getType());
            editMe.setCode(dto.getCode());
            try {
                donationJpaController.edit(editMe);
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(DonationController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(DonationController.class.getName()).log(Level.SEVERE, null, ex);
            }
            for (ItemDTO i : dto.getItemList()) {
                Item item = new Item();
                item.setDonation(editMe);
                item.setItem(i.getItem());
                item.setQuantity(i.getQuantity());
                item.setValue(i.getValue());
                itemJpaController.create(item);
            }

        }
    }

    public Donation getDonation(Long did) {
        return donationJpaController.findDonation(did);
    }
}
