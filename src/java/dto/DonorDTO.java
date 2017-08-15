/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : DonorDTO.java
 * Author     : LiverEatnJohnson
 * Date       : Feb 14 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package dto;

import java.io.Serializable;

/**
 * @author LiverEatnJohnson
 */
public class DonorDTO implements Serializable {

    private Long id;
    private String firstName;
    private String lastName;
    private String address;
    private String city;
    private String state;
    private String zip;
    private String phone;
    private String email;
    private String type;

    /**
     * Basic Donor constructor
     */
    public DonorDTO() {
    }

    public Long getId() {
        return id;
    }

    /**
     * @param id Long
     */
    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName String
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName String
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    /**
     * @param address String
     */
    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    /**
     * @param city String
     */
    public void setCity(String city) {
        this.city = city;
    }

    public String getZip() {
        return zip;
    }

    /**
     * @param zip String
     */
    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getPhone() {
        return phone;
    }

    /**
     * @param phone String
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getState() {
        return state;
    }

    /**
     * @param state String
     */
    public void setState(String state) {
        this.state = state;
    }

    public String getEmail() {
        return email;
    }

    /**
     * @param email String
     */
    public void setEmail(String email) {
        this.email = email;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
