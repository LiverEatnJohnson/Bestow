/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : DepartmentController.java
 * Author     : Bullforg
 * Date       : Apr 30 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author jeremiah.johnson5
 */
@Entity
@Table(name = "EMPLOYEE")
public class Employee implements Serializable {

  private static final long serialVersionUID = 1L;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Basic(optional = false)
  @Column(name = "ID")
  private Long id;
  //
  @Basic(optional = false)
  @Column(name = "FIRST_NAME")
  private String firstName;
  //
  @Basic(optional = false)
  @Column(name = "LAST_NAME")
  private String lastName;
  //
  @Basic(optional = false)
  @Column(name = "TITLE")
  private String title;
  //
  @Basic(optional = false)
  @Column(name = "PHONE")
  private String phone;
  //
  @Basic(optional = false)
  @Column(name = "EMAIL")
  private String email;
  //
  @Basic(optional = false)
  @Column(name = "OFFICE")
  private String office;
  //
  @OneToMany(mappedBy = "employee")
  private List<Donation> donationList;
  //
  @JoinColumn(name = "DEPARTMENT_ID", referencedColumnName = "ID", nullable = false)
  @ManyToOne(optional = false)
  private Department department;

  public Employee() {
	donationList = new ArrayList<>();
  }

  public Long getId() {
	return id;
  }

  public void setId(Long id) {
	this.id = id;
  }

  public String getFirstName() {
	return firstName;
  }

  public void setFirstName(String firstName) {
	this.firstName = firstName;
  }

  public String getLastName() {
	return lastName;
  }

  public String getTitle() {
	return title;
  }

  public void setTitle(String title) {
	this.title = title;
  }

  public void setLastName(String lastName) {
	this.lastName = lastName;
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

  public List<Donation> getDonationList() {
	return donationList;
  }

  public void setDonationList(List<Donation> donationList) {
	this.donationList = donationList;
  }

  public Department getDepartment() {
	return department;
  }

  public void setDepartment(Department department) {
	this.department = department;
  }

  @Override
  public int hashCode() {
	int hash = 0;
	hash += (id != null ? id.hashCode() : 0);
	return hash;
  }

  @Override
  public boolean equals(Object object) {
	// Note: Warning - this method won't work in the case the id fields are not set
	if (!(object instanceof Employee)) {
	  return false;
	}
	Employee other = (Employee) object;
	if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
	  return false;
	}
	return true;
  }

  @Override
  public String toString() {
	return firstName + " " + lastName;
  }
}
