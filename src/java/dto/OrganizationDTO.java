/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : OrganizationDTO.java
 * Author     : Bullfrog
 * Date       : Feb 27 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package dto;

/**
 * @author LiverEatnJohnson
 */
public class OrganizationDTO {

    private int id;
    private String title;
    private String address;
    private String city;
    private String state;
    private String zip;
    private String phone;
    private String tollFree;
    private String fax;
    private Long directorId;
    private String emailAddress;

    /**
     * Basic Constructor
     */
    public OrganizationDTO() {
    }

    public int getId() {
        return id;
    }

    /**
     * @param id Long
     */
    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    /**
     * @param title String
     */
    public void setTitle(String title) {
        this.title = title;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTollFree() {
        return tollFree;
    }

    public void setTollFree(String tollFree) {
        this.tollFree = tollFree;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public Long getDirectorId() {
        return directorId;
    }

    public void setDirectorId(Long directorId) {
        this.directorId = directorId;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
}
