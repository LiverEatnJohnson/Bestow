/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : EmployeeVO.java
 * Author     : LiverEatnJohnson
 * Date       : Feb 6 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package view.vo;

import entity.Employee;
import java.io.Serializable;

/**
 * @author LiverEatnJohnson
 */
public class EmployeeVO implements Serializable {

    private Long id;
    private String firstName;
    private String lastName;
    private String title;
    private String phone;
    private String office;
    private String email;
    private DepartmentVO department;
    private boolean hasDonations;

    /**
     * Basic Constructor
     */
    public EmployeeVO() {
    }

    /**
     * Constructor that takes an Entity
     *
     * @param copyMe   Employee
     * @param myDeptVo DepartmentVO
     */
    public EmployeeVO(Employee copyMe, DepartmentVO depVO, boolean makeDepartment) {
        this.id = copyMe.getId();
        this.firstName = copyMe.getFirstName();
        this.lastName = copyMe.getLastName();
        this.title = copyMe.getTitle();
        this.phone = copyMe.getPhone();
        this.office = copyMe.getOffice();
        this.email = copyMe.getEmail();
        this.hasDonations = (!copyMe.getDonationList().isEmpty()) ? true : false;

        if (depVO != null) {
            this.department = depVO;
        } else {
            if (makeDepartment) {
                this.department = new DepartmentVO(copyMe.getDepartment(), null, false);
            }
        }
    }

    public Long getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getTitle() {
        return title;
    }

    public DepartmentVO getDepartment() {
        return department;
    }

    public String getPhone() {
        return phone;
    }

    public String getOffice() {
        return office;
    }

    public String getEmail() {
        return email;
    }

    public boolean isHasDonations() {
        return hasDonations;
    }
}
