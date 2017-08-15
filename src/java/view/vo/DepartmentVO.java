/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : DepartmentVO.java
 * Author     : LiverEatnJohnson
 * Date       : Mar 3 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package view.vo;

import entity.Department;
import entity.Employee;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * .
 * @author LiverEatnJohnson
 */
public class DepartmentVO {

  private int id;
  private String title;
  private EmployeeVO director;
  private OrganizationVO organization;
  private List<EmployeeVO> employeeList;
  private boolean hasEmployees;
  private boolean hasDonations;

  /**
   * Basic Constructor
   */
  public DepartmentVO() {
	this.employeeList = new ArrayList<>();
  }

  /**
   * Constructor from DTO
   *
   * @param copyMe  Department
   * @param myOrgVo OrganizationVO
   */
  public DepartmentVO(Department copyMe, OrganizationVO orgVO, boolean makeEmployeeList) {
	this();
	this.id = copyMe.getId();
	this.title = copyMe.getTitle();

	if (copyMe.getDirector() != null) {
	  this.director = new EmployeeVO(copyMe.getDirector(), null, false);
	}
	this.hasDonations = (!copyMe.getDonationList().isEmpty()) ? true : false;
	this.hasEmployees = (!copyMe.getEmployeeList().isEmpty()) ? true : false;

	if (orgVO != null) {
	  this.organization = orgVO;
	} else {
	  this.organization = new OrganizationVO(copyMe.getOrganization(), false);
	}

	if (makeEmployeeList) {
	  for (Employee emp : copyMe.getEmployeeList()) {
		EmployeeVO tempemp = new EmployeeVO(emp, this, false);
		employeeList.add(tempemp);
	  }
	}
  }

  public int getId() {
	return id;
  }

  public String getTitle() {
	return title;
  }

  public EmployeeVO getDirector() {
	return director;
  }

  public boolean isHasDonations() {
	return hasDonations;
  }

  public boolean isHasEmployees() {
	return hasEmployees;
  }

  public OrganizationVO getOrganization() {
	return organization;
  }

  public List<EmployeeVO> getEmployeeList() {
	return Collections.unmodifiableList(employeeList);
  }
}
