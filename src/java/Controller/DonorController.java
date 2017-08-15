/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : DonorController.java
 * Author     : Bullforg
 * Date       : Feb 11 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package controller;

import dto.DonorDTO;
import entity.Donor;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jpa.DonorJpaController;
import jpa.exceptions.IllegalOrphanException;
import jpa.exceptions.NonexistentEntityException;

/**
 * Controller for Donor
 *
 * @author Bullfrog
 */
public class DonorController {

    private DonorJpaController donorJpaController;

    /**
     * Basic Constructor
     */
    public DonorController() {
    }

    /**
     * @param donorJpaController DonorJpaController
     */
    public void setDonorJpaController(DonorJpaController donorJpaController) {
        this.donorJpaController = donorJpaController;
    }

    /**
     * @param dto DonorDTO
     */
    public Donor saveDonor(DonorDTO dto) {
        Donor donor = new Donor();
        // donor.setId(generated);
        donor.setAddress(dto.getAddress());
        donor.setCity(dto.getCity());
        donor.setFirstName(dto.getFirstName());
        donor.setLastName(dto.getLastName());
        donor.setPhone(dto.getPhone());
        donor.setState(dto.getState());
        donor.setZip(dto.getZip());
        donor.setEmail(dto.getEmail());
        donor.setType(dto.getType());
        donorJpaController.create(donor);
        return donor;
    }

    public List<Donor> getList() {
        return donorJpaController.findDonorEntities();
    }

    /**
     * @param id Long
     * @return DonorVO
     */
    public Donor getDonor(Long id) {
        return donorJpaController.findDonor(id);
    }

    /**
     * @param id Long
     * @throws NonexistentEntityException
     */
    public void deleteDonor(Long id) {
        try {
            try {
                donorJpaController.destroy(id);
            } catch (IllegalOrphanException ex) {
                Logger.getLogger(DonorController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(DonorController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * @param dto DonorDTO
     */
    public void editDonor(DonorDTO dto) {
        Donor donor = donorJpaController.findDonor(dto.getId());
        donor.setId(dto.getId());
        donor.setAddress(dto.getAddress());
        donor.setCity(dto.getCity());
        donor.setFirstName(dto.getFirstName());
        donor.setLastName(dto.getLastName());
        donor.setPhone(dto.getPhone());
        donor.setState(dto.getState());
        donor.setZip(dto.getZip());
        donor.setEmail(dto.getEmail());
        donor.setType(dto.getType());

        try {
            donorJpaController.edit(donor);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(DonorController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DonorController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
