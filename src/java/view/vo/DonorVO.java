/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : DonorVO.java
 * Author     : LiverEatnJohnson
 * Date       : Feb 6 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package view.vo;

import entity.Donor;
import java.io.Serializable;

/**
 * @author LiverEatnJohnson
 */
public class DonorVO implements Serializable {

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
  private boolean hasDonations;

  /**
   * Constructor that takes a DonorDTO
   *
   * @param copyMe DonorDTO
   */
  public DonorVO(Donor copyMe) {
	this.id = copyMe.getId();
	this.firstName = copyMe.getFirstName();
	this.lastName = copyMe.getLastName();
	this.address = copyMe.getAddress();
	this.city = copyMe.getCity();
	this.state = copyMe.getState();
	this.zip = copyMe.getZip();
	this.phone = copyMe.getPhone();
	this.email = copyMe.getEmail();
	this.type = copyMe.getType();
	this.hasDonations = (!copyMe.getDonationList().isEmpty()) ? true : false;
  }

  /**
   * Basic Donor Constructor
   */
  public DonorVO() {
  }

  public Long getId() {
	if (id == null) {
	  return null;
	} else {
	  return id;
	}
  }

  public String getFirstName() {
	if (firstName == null) {
	  return "";
	} else {
	  return firstName;
	}
  }

  public String getLastName() {
	if (lastName == null) {
	  return "";
	} else {
	  return lastName;
	}
  }

  public String getAddress() {
	if (address == null) {
	  return "";
	} else {
	  return address;
	}
  }

  public String getCity() {
	if (city == null) {
	  return "";
	} else {
	  return city;
	}
  }

  public String getState() {
	if (state == null) {
	  return "";
	} else {
	  return state;
	}
  }

  public String getZip() {
	if (zip == null) {
	  return "";
	} else {
	  return zip;
	}
  }

  public String getPhone() {
	if (phone == null) {
	  return "";
	} else {
	  return phone;
	}
  }

  public String getEmail() {
	if (email == null) {
	  return "";
	} else {
	  return email;
	}
  }

  public String getType() {
	return type;
  }

  public boolean isHasDonations() {
	return hasDonations;
  }
}
