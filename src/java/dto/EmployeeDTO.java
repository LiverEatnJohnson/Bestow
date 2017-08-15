/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : EmployeeDTO.java
 * Author     : LiverEatnJohnson
 * Date       : Mar 15 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package dto;

/**
 * @author LiverEatnJohnson
 */
public class EmployeeDTO {

  private Long id;
  private String firstName;
  private String lastName;
  private String title;
  private int departmentId;
  private String phone;
  private String email;
  private String office;

  /**
   * Basic Constructor
   */
  public EmployeeDTO() {
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

  public String getTitle() {
	return title;
  }

  public void setTitle(String title) {
	this.title = title;
  }

  public String getPhone() {
	return phone;
  }

  public void setPhone(String phone) {
	this.phone = phone;
  }

  public String getEmail() {
	return email;
  }

  public void setEmail(String email) {
	this.email = email;
  }

  public String getOffice() {
	return office;
  }

  public void setOffice(String office) {
	this.office = office;
  }

  public int getDepartmentId() {
	return departmentId;
  }

  public void setDepartmentId(int department) {
	this.departmentId = department;
  }
}
