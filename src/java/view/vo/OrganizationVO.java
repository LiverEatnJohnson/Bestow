/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : OrganizationVO.java
 * Author     : LiverEatnJohnson
 * Date       : Feb 6 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package view.vo;

import entity.Department;
import entity.Organization;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author LiverEatnJohnson
 */
public class OrganizationVO {

  private int id;
  private String title;
  private String address;
  private String city;
  private String state;
  private String zip;
  private String phone;
  private String tollFree;
  private String fax;
  private EmployeeVO director;
  private String emailAddress;
  private boolean hasDepartments;
  private List<DepartmentVO> departmentList;

  /**
   * Basic Constructor
   */
  public OrganizationVO() {
	this.departmentList = new ArrayList<>();
  }

  /**
   * Constructor that takes Entity
   *
   * @param org Organization
   */
  public OrganizationVO(Organization org, boolean makeDepartments) {
	this();
	this.id = org.getId();
	this.title = org.getTitle();
	this.address = org.getAddress();
	this.city = org.getCity();
	this.state = org.getState();
	this.zip = org.getZip();
	this.phone = org.getPhone();
	this.tollFree = org.getTollFree();
	this.fax = org.getFax();
	this.emailAddress = org.getEmailAddress();
	this.hasDepartments = (!org.getDepartmentList().isEmpty()) ? true : false;

	if (org.getDirector() != null) {
	  this.director = new EmployeeVO(org.getDirector(), null, false);
	}

	if (makeDepartments) {
	  for (Department ddto : org.getDepartmentList()) {
		DepartmentVO tempemp = new DepartmentVO(ddto, null, true);
		departmentList.add(tempemp);
	  }
	}
  }

  public int getId() {
	return id;
  }

  public String getTitle() {
	return title;
  }

  public String getAddress() {
	return address;
  }

  public String getCity() {
	return city;
  }

  public String getState() {
	return state;
  }

  public String getZip() {
	return zip;
  }

  public String getPhone() {
	return phone;
  }

  public String getTollFree() {
	return tollFree;
  }

  public String getFax() {
	return fax;
  }

  public EmployeeVO getDirector() {
	return director;
  }

  public String getEmailAddress() {
	return emailAddress;
  }

  public boolean isHasDepartments() {
	return hasDepartments;
  }

  public List<DepartmentVO> getDepartmentList() {
	return Collections.unmodifiableList(departmentList);
  }
}
