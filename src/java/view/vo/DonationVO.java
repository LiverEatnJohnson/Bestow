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

import entity.Donation;
import entity.Item;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author jeremiah.johnson5
 */
public class DonationVO {

  private Long id;
  private Date donationDate;
  private double total;
  private String type;
  private EmployeeVO employee;
  private DepartmentVO department;
  private DonorVO donor;
  private String code;
  private List<ItemVO> itemList;

  public DonationVO() {
	this.itemList = new ArrayList<>();
  }

  public DonationVO(Donation d, EmployeeVO empVO, DonorVO donorVO, DepartmentVO depVO, boolean makeItems) {
	this.id = d.getId();
	this.donationDate = d.getDonationDate();
	this.code = d.getCode();
        this.type = d.getType();
        
	if (empVO != null) {
	  this.employee = empVO;
	} else {
	  this.employee = new EmployeeVO(d.getEmployee(), null, true);
	}

	if (donorVO != null) {
	  this.donor = donorVO;
	} else {
	  this.donor = new DonorVO(d.getDonor());
	}

	if (depVO != null) {
	  this.department = depVO;
	} else {
	  this.department = new DepartmentVO(d.getDepartment(), null, false);
	}

	this.itemList = new ArrayList<>();
	if (makeItems) {
	  for (Item it : d.getItemList()) {
		ItemVO iv = new ItemVO(it);
		this.itemList.add(iv);
	  }
	}
  }

  public Long getId() {
	return id;
  }

  public Date getDonationDate() {
	return donationDate;
  }

  public String getType() {
	return type;
  }

  public double getTotal() {
	for (ItemVO i : itemList) {
	  this.total += i.getItemTotal();
	}
	return total;
  }

  public EmployeeVO getEmployee() {
	return employee;
  }

  public DepartmentVO getDepartment() {
	return department;
  }

  public DonorVO getDonor() {
	return donor;
  }

  public String getCode() {
	return code;
  }

  public List<ItemVO> getItemList() {
	return itemList;
  }
}
