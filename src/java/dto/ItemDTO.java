/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : DepartmentController.java
 * Author     : Bullforg
 * Date       : Apr 30 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package dto;

/**
 *
 * @author jeremiah.johnson5
 */
public class ItemDTO {

    private Long id;
    private String item;
    private double quantity;
    private double value;
    private Long donationId;

    public ItemDTO() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    public Long getDonationId() {
        return donationId;
    }

    public void setDonationId(Long donation) {
        this.donationId = donation;
    }

    public double getQuantity() {
        return quantity;
    }
    
    public double getItemTotal(){
        double answer = value * quantity;
        answer *= 100;
        answer=Math.round(answer);
        return answer/100;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }
}
