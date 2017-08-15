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
import entity.Item;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jpa.DonationJpaController;
import jpa.ItemJpaController;
import jpa.exceptions.NonexistentEntityException;

/**
 *
 * @author jeremiah.johnson5
 */
public class ItemController {

    private ItemJpaController itemJpaController;
    private DonationJpaController donationJpaController;

    public void setItemJpaController(ItemJpaController itemJpaController) {
        this.itemJpaController = itemJpaController;
    }

    public void setDonationJpaController(DonationJpaController donationJpaController) {
        this.donationJpaController = donationJpaController;
    }

    public void saveItem(ItemDTO idto) {
        Item i = new Item();
        //i.setId(generated);
        i.setItem(idto.getItem());
        i.setQuantity(idto.getQuantity());
        i.setValue(idto.getValue());
        Donation d = donationJpaController.findDonation(idto.getDonationId());
        i.setDonation(d);
        itemJpaController.create(i);
    }

    public List<Item> getItemsFromDonation(DonationDTO ddto) {
        Donation d = donationJpaController.findDonation(ddto.getId());
        List<Item> rtv = new ArrayList<>();
        for (Item i : d.getItemList()) {
            rtv.add(i);
        }
        return rtv;
    }

    public void editItem(ItemDTO idto) {
        Item i = itemJpaController.findItem(idto.getId());
        i.setItem(idto.getItem());
        i.setQuantity(idto.getQuantity());
        i.setValue(idto.getValue());
        Donation d = donationJpaController.findDonation(idto.getDonationId());
        i.setDonation(d);

        try {
            itemJpaController.edit(i);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ItemController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ItemController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteItem(Long id) {
        try {
            itemJpaController.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ItemController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
