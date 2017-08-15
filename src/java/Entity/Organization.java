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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author jeremiah.johnson5
 */
@Entity
@Table(name = "ORGANIZATION")
public class Organization implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    //
    @Basic(optional = false)
    @Column(name = "TITLE")
    private String title;
    //
    @Basic(optional = false)
    @Column(name = "ADDRESS")
    private String address;
    //
    @Basic(optional = false)
    @Column(name = "CITY")
    private String city;
    //
    @Basic(optional = false)
    @Column(name = "STATE")
    private String state;
    //
    @Basic(optional = false)
    @Column(name = "ZIP")
    private String zip;
    //
    @Basic(optional = false)
    @Column(name = "PHONE")
    private String phone;
    //
    @Basic(optional = true)
    @Column(name = "TOLL_FREE")
    private String tollFree;
    //
    @Basic(optional = true)
    @Column(name = "FAX")
    private String fax;
    //
    @JoinColumn(name = "DIRECTOR_ID", referencedColumnName = "ID", nullable = true)
    @OneToOne(optional = true)
    private Employee director;
    //
    @Basic(optional = true)
    @Column(name = "EMAIL_ADDRESS")
    private String emailAddress;
    //
    @OneToMany(mappedBy = "organization")
    private List<Department> departmentList;

    public Organization() {
        departmentList = new ArrayList<>();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

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

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public Employee getDirector() {
        return director;
    }

    public void setDirector(Employee director) {
        this.director = director;
    }

    public List<Department> getDepartmentList() {
        return departmentList;
    }

    public void setDepartmentList(List<Department> departmentList) {
        this.departmentList = departmentList;
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
        if (!(object instanceof Organization)) {
            return false;
        }
        Organization other = (Organization) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return title;
    }
}
