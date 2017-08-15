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
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author jeremiah.johnson5
 */
@Entity
@Table(name = "DONATION")
public class Donation implements Serializable {

  private static final long serialVersionUID = 1L;
  //
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Basic(optional = false)
  @Column(name = "ID")
  private Long id;
  //
  @Basic(optional = false)
  @Column(name = "DATE", nullable = false)
  @Temporal(TemporalType.DATE)
  private Date donationDate;
  //
  @Basic(optional = false)
  @Column(name = "CODE")
  private String code;
  //
  @Basic(optional = false)
  @Column(name = "TYPE")
  private String type;
  //
  @JoinColumn(name = "EMPLOYEE_ID", referencedColumnName = "ID")
  @ManyToOne(optional = false)
  private Employee employee;
  //
  @JoinColumn(name = "DONOR_ID", referencedColumnName = "ID")
  @ManyToOne(optional = false)
  private Donor donor;
  //
  @JoinColumn(name = "DEPARTMENT_ID", referencedColumnName = "ID")
  @ManyToOne(optional = false)
  private Department department;
  //
  @OneToMany(cascade = CascadeType.ALL, mappedBy = "donation")
  private List<Item> itemList;

  public Donation() {
	itemList = new ArrayList<>();
  }

  public Long getId() {
	return id;
  }

  public void setId(Long id) {
	this.id = id;
  }

  public Date getDonationDate() {
	return donationDate;
  }

  public void setDonationDate(Date donationDate) {
	this.donationDate = donationDate;
  }

  public double getTotal() {
	double total = 0;
	for (Item i : itemList) {
	  total += i.getQuantity() * i.getValue();
	}
	return total;
  }

  public String getType() {
	return type;
  }

  public void setType(String type) {
	this.type = type;
  }

  public String getCode() {
	return code;
  }

  public void setCode(String code) {
	this.code = code;
  }

  public Employee getEmployee() {
	return employee;
  }

  public void setEmployee(Employee employee) {
	this.employee = employee;
  }

  public Donor getDonor() {
	return donor;
  }

  public void setDonor(Donor donor) {
	this.donor = donor;
  }

  public Department getDepartment() {
	return department;
  }

  public void setDepartment(Department department) {
	this.department = department;
  }

  public List<Item> getItemList() {
	return itemList;
  }

  public void setItemList(List<Item> itemList) {
	this.itemList = itemList;
  }

  @Override
  public int hashCode() {
	int hash = 0;
	hash += (id != null ? id.hashCode() : 0);
	return hash;
  }

  @Override
  public boolean equals(Object object) {
	// Warning: this method won't work in the case the id fields are not set
	if (!(object instanceof Donation)) {
	  return false;
	}
	Donation other = (Donation) object;
	if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
	  return false;
	}
	return true;
  }

  @Override
  public String toString() {
	return "entity.Donation[ id=" + id + " ]";
  }
}
