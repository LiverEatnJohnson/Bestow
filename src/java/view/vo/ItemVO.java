/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : DepartmentController.java
 * Author     : Bullforg
 * Date       : Apr 30 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package view.vo;

import entity.Item;

/**
 *
 * @author bullfrog
 */
public class ItemVO {

    private Long id;
    private String item;
    private double quantity;
    private double value;
    private DonationVO donation;

    public ItemVO() {
    }

    public ItemVO(Item it) {
        id = it.getId();
        item = it.getItem();
        quantity = it.getQuantity();
        value = it.getValue();
        DonationVO tempDonation = new DonationVO(it.getDonation(), null, null, null, false);
        donation = tempDonation;
    }

    public Long getId() {
        return id;
    }

    public String getItem() {
        return item;
    }

    public double getQuantity() {
        return quantity;
    }

    public double getValue() {
        return value;
    }

    public DonationVO getDonation() {
        return donation;
    }
    
    public double getItemTotal(){
        double answer = value * quantity;
        answer *= 100;
        answer=Math.round(answer);
        return answer/100;
    }
}
