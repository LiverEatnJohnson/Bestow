/*
 * Company    : MAGi iNDUSTRIES iNC.
 * Project    : Bestow
 * File       : EmployeeView.java
 * Author     : LiverEatnJohnson
 * Date       : Feb 14 2013
 * Copyright  : (C) Jeremiah Johnson 2013
 * License    : GUN GPL v3
 */
package view;

import controller.EmployeeController;
import dto.EmployeeDTO;
import entity.Employee;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import view.vo.DepartmentVO;
import view.vo.EmployeeVO;
import view.vo.OrganizationVO;

/**
 * @author LiverEatnJohnson
 */
public class EmployeeView {

  private EmployeeController employeeController;

  /**
   * @param employeeController EmployeeController
   */
  public void setEmployeeController(EmployeeController employeeController) {
	this.employeeController = employeeController;
  }

  /**
   * @param dto EmployeeDTO
   */
  public void saveEmployee(EmployeeDTO dto) {
	employeeController.saveEmployee(dto);
  }

  public List<EmployeeVO> getListByLastFirst() {
	List<EmployeeVO> rtv = new ArrayList<>();
	for (Employee e : employeeController.getList()) {
	  OrganizationVO tempO = new OrganizationVO(e.getDepartment().getOrganization(), false);
	  DepartmentVO tempD = new DepartmentVO(e.getDepartment(), tempO, false);
	  EmployeeVO temp = new EmployeeVO(e, tempD, false);
	  rtv.add(temp);
	}
	Collections.sort(rtv, new Comparator<EmployeeVO>() {
	  @Override
	  public int compare(EmployeeVO o1, EmployeeVO o2) {
		if (o1.getLastName().compareToIgnoreCase(o2.getLastName()) == 0) {
		  return o1.getFirstName().compareToIgnoreCase(o2.getFirstName());
		} else {
		  return o1.getLastName().compareToIgnoreCase(o2.getLastName());
		}
	  }
	});
	return rtv;
  }

  /**
   * @param employeeId String
   */
  public void deleteEmployee(String employeeId) {
	Long eid = Long.parseLong(employeeId);
	employeeController.deleteEmployee(eid);
  }

  /**
   * @param dto EmployeeDTO
   */
  public void editEmployee(EmployeeDTO dto) {
	employeeController.editEmployee(dto);
  }

  /**
   * @param employeeId String id of employee
   * @return EmployeeVO or null
   */
  public EmployeeVO getEmployee(String employeeId) {
	Long eid = Long.parseLong(employeeId);
	OrganizationVO tempO = new OrganizationVO(employeeController.getEmployee(eid).getDepartment().getOrganization(), false);
	DepartmentVO tempD = new DepartmentVO(employeeController.getEmployee(eid).getDepartment(), tempO, false);
	EmployeeVO temp = new EmployeeVO(employeeController.getEmployee(eid), tempD, false);
	return temp;
  }
}
