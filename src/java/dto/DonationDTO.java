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

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jeremiah.johnson5
 */
public class DonationDTO {

  private Long id;
  private Long donorId;
  private int departmentId;
  private Long employeeId;
  private Date donationDate;
  private String donationDateString;
  private String code;
  private String type;
  private List<ItemDTO> itemList;

  public DonationDTO() {
	itemList = new ArrayList<>();
  }

  public List<ItemDTO> getItemList() {
	return itemList;
  }

  public void setItemList(List<ItemDTO> itemList) {
	this.itemList = itemList;
  }

  public Long getId() {
	return id;
  }

  public void setId(Long id) {
	this.id = id;
  }

  public Long getDonorId() {
	return donorId;
  }

  public void setDonorId(Long donor) {
	this.donorId = donor;
  }

  public int getDepartmentId() {
	return departmentId;
  }

  public void setDepartmentId(int department) {
	this.departmentId = department;
  }

  public Long getEmployeeId() {
	return employeeId;
  }

  public void setEmployeeId(Long employee) {
	this.employeeId = employee;
  }

  public Date getDonationDate() {
	return donationDate;
  }

  public String getType() {
	return type;
  }

  public void setType(String type) {
	this.type = type;
  }

  public void setDonationDate(Date donationDate) {
	this.donationDate = donationDate;
  }

  public String getDonationDateString() {
	if (donationDate == null) {
	  return null;
	}
	SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
	return df.format(donationDate);
  }

  public void setDonationDateString(String donationDateString) {
	SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
	Date me = null;
	try {
	  me = df.parse(donationDateString);
	} catch (ParseException ex) {
	  Logger.getLogger(DonationDTO.class.getName()).log(Level.SEVERE, null, ex);
	}
	this.donationDate = me;
  }

  public String getCode() {
	return code;
  }

  public void setCode(String code) {
	this.code = code;
  }
}
